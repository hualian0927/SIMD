#pragma once

#include <algorithm>
#include <cstdint>
#include <cstddef>
#include <cstring>
#include <iostream>
#include <string>
#include <vector>

#include "fa_core.h"
#include "fa_codec.h"

namespace fa_engine {

enum class CodeOrder {
    QuantizeFirst,   // global PQ first, then IVF
    ClusterFirst     // IVF first, then per-list PQ
};

struct FAIndex {
    fa_core::ClusterIndex ivf;
    Codec global_codec;
    std::vector<Codec> local_codec;
    std::vector<uint8_t> local_ready;
    CodeOrder order = CodeOrder::QuantizeFirst;
    const float* base = nullptr;
    size_t n = 0;
    size_t d = 0;

    void build(const float* base_, size_t n_, size_t d_, size_t nlist,
               CodeOrder order_, int ivf_iter = 8, int pq_iter = 8) {
        base = base_;
        n = n_;
        d = d_;
        order = order_;

        if (order == CodeOrder::QuantizeFirst) {
            std::cerr << "[FA] Building global codec first.\n";
            global_codec.build(base, n, d, 8, 256, pq_iter);
            ivf.build(base, n, d, nlist, ivf_iter);
            return;
        }

        std::cerr << "[FA] Building clusters first, then per-list codec.\n";
        ivf.build(base, n, d, nlist, ivf_iter);
        local_codec.clear();
        local_codec.resize(ivf.nlist);
        local_ready.assign(ivf.nlist, 0);

        for (size_t c = 0; c < ivf.nlist; ++c) {
            const size_t begin = ivf.list_offsets[c];
            const size_t count = ivf.list_offsets[c + 1] - begin;
            if (count == 0) continue;
            const size_t local_ksub = std::min<size_t>(256, std::max<size_t>(16, count));
            local_codec[c].build(ivf.reordered_base.data() + begin * d,
                                 count, d, 8, static_cast<int>(local_ksub), pq_iter);
            local_ready[c] = 1;
        }
    }

    // ---- serialization (base pointer is NOT saved) ----
    bool save(std::ostream& os) const {
        int32_t o = static_cast<int32_t>(order);
        if (!os.write(reinterpret_cast<const char*>(&o), sizeof(o))) return false;
        if (!ivf.save(os)) return false;

        if (order == CodeOrder::QuantizeFirst) {
            if (!global_codec.save(os)) return false;
        } else {
            size_t count = local_codec.size();
            if (!os.write(reinterpret_cast<const char*>(&count), sizeof(count))) return false;
            for (size_t i = 0; i < count; ++i)
                if (!local_codec[i].save(os)) return false;
            count = local_ready.size();
            if (!os.write(reinterpret_cast<const char*>(&count), sizeof(count))) return false;
            if (count && !os.write(reinterpret_cast<const char*>(local_ready.data()), count)) return false;
        }
        return !!os;
    }

    bool load(std::istream& is) {
        int32_t o = 0;
        if (!is.read(reinterpret_cast<char*>(&o), sizeof(o))) return false;
        order = static_cast<CodeOrder>(o);
        if (!ivf.load(is)) return false;
        n = ivf.reordered_ids.size();
        d = ivf.d;

        if (order == CodeOrder::QuantizeFirst) {
            if (!global_codec.load(is)) return false;
        } else {
            size_t count = 0;
            if (!is.read(reinterpret_cast<char*>(&count), sizeof(count))) return false;
            local_codec.resize(count);
            for (size_t i = 0; i < count; ++i)
                if (!local_codec[i].load(is)) return false;
            if (!is.read(reinterpret_cast<char*>(&count), sizeof(count))) return false;
            local_ready.resize(count);
            if (count && !is.read(reinterpret_cast<char*>(local_ready.data()), count)) return false;
        }
        return !!is;
    }
};

static inline size_t clamp_rerank(size_t rerank_p, size_t base_n, size_t k) {
    if (rerank_p < k) rerank_p = k;
    return std::min(rerank_p, base_n);
}

static inline void scan_quant(const FAIndex& index, const float* lut,
                              uint32_t list_id, size_t keep,
                              fa_core::TopK& coarse) {
    const size_t begin = index.ivf.list_offsets[list_id];
    const size_t end = index.ivf.list_offsets[static_cast<size_t>(list_id) + 1];
    for (size_t pos = begin; pos < end; ++pos) {
        const uint32_t id = index.ivf.reordered_ids[pos];
        const float dist = codec_dist(
            lut, index.global_codec.codes.data() + static_cast<size_t>(id) * index.global_codec.M,
            index.global_codec.M);
        fa_core::topk_push(coarse, dist, id, keep);
    }
}

static inline void scan_cluster(const FAIndex& index, const float* query,
                                uint32_t list_id, size_t keep,
                                fa_core::TopK& coarse) {
    if (list_id >= index.local_ready.size() || !index.local_ready[list_id])
        return;
    const Codec& codec = index.local_codec[list_id];
    float lut[8 * 256];  // stack allocation, avoid heap in hot path
    codec.fill_lut(query, lut);

    const size_t begin = index.ivf.list_offsets[list_id];
    const size_t end = index.ivf.list_offsets[static_cast<size_t>(list_id) + 1];
    for (size_t pos = begin; pos < end; ++pos) {
        const size_t local_pos = pos - begin;
        const uint32_t id = index.ivf.reordered_ids[pos];
        const float dist = codec_dist(
            lut, codec.codes.data() + local_pos * codec.M, codec.M);
        fa_core::topk_push(coarse, dist, id, keep);
    }
}

static inline void scan_list(const FAIndex& index, const float* query,
                             const float* global_lut, uint32_t list_id,
                             size_t keep, fa_core::TopK& coarse) {
    if (index.order == CodeOrder::QuantizeFirst)
        scan_quant(index, global_lut, list_id, keep, coarse);
    else
        scan_cluster(index, query, list_id, keep, coarse);
}

static inline fa_core::TopK rerank(const FAIndex& index,
                                   const float* query, size_t k,
                                   fa_core::TopK& coarse) {
    fa_core::TopK result;
    while (!coarse.empty()) {
        const uint32_t id = coarse.top().second;
        coarse.pop();
        const float dist = fa_core::vec_dist(
            index.base + static_cast<size_t>(id) * index.d, query, index.d);
        fa_core::topk_push(result, dist, id, k);
    }
    return result;
}

}  // namespace fa_engine

// ---- sequential search (single-query, no threading) ----
static inline fa_core::TopK fa_search(
    const fa_engine::FAIndex& index, const float* query,
    size_t k, size_t nprobe, size_t rerank_p) {
    rerank_p = fa_engine::clamp_rerank(rerank_p, index.n, k);
    const std::vector<uint32_t> probes = index.ivf.pick_lists(query, nprobe);

    std::vector<float> global_lut;
    const float* global_lut_ptr = nullptr;
    if (index.order == fa_engine::CodeOrder::QuantizeFirst) {
        global_lut.resize(static_cast<size_t>(index.global_codec.M) * 256);
        index.global_codec.fill_lut(query, global_lut.data());
        global_lut_ptr = global_lut.data();
    }

    fa_core::TopK coarse;
    for (size_t i = 0; i < probes.size(); ++i)
        fa_engine::scan_list(index, query, global_lut_ptr, probes[i], rerank_p, coarse);
    return fa_engine::rerank(index, query, k, coarse);
}

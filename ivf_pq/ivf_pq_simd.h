#pragma once

#include <algorithm>
#include <cstdint>
#include <cstddef>
#include <cstring>
#include <iostream>
#include <string>
#include <vector>

#include "ivf_index.h"

#include "pq_scan_simd.h"
#define ANN_IVFPQ_HAS_NEON 1

namespace ann_ivfpq {

enum class BuildMode {
    GlobalPQFirst,
    IVFLocalPQ
};

struct IVFPQIndex {
    ann_ivf::IVFIndex ivf;
    PQIndex global_pq;
    std::vector<PQIndex> local_pq;
    std::vector<uint8_t> local_ready;
    BuildMode mode = BuildMode::GlobalPQFirst;
    const float* base = nullptr;
    size_t n = 0;
    size_t d = 0;

    void build(const float* base_, size_t n_, size_t d_, size_t nlist,
               BuildMode mode_, int ivf_iter = 8, int pq_iter = 8) {
        base = base_;
        n = n_;
        d = d_;
        mode = mode_;

        if (mode == BuildMode::GlobalPQFirst) {
            std::cerr << "[IVF-PQ] Building global PQ first.\n";
            global_pq.build(base, n, d, 8, 256, pq_iter);
            ivf.build(base, n, d, nlist, ivf_iter);
            return;
        }

        std::cerr << "[IVF-PQ] Building IVF first, then per-list PQ.\n";
        ivf.build(base, n, d, nlist, ivf_iter);
        local_pq.clear();
        local_pq.resize(ivf.nlist);
        local_ready.assign(ivf.nlist, 0);

        for (size_t c = 0; c < ivf.nlist; ++c) {
            const size_t begin = ivf.list_offsets[c];
            const size_t count = ivf.list_offsets[c + 1] - begin;
            if (count == 0) {
                continue;
            }
            const size_t local_ksub = std::min<size_t>(256, std::max<size_t>(16, count));
            local_pq[c].build(ivf.reordered_base.data() + begin * d,
                              count, d, 8, static_cast<int>(local_ksub), pq_iter);
            local_ready[c] = 1;
        }
    }

    // ---- serialization (base pointer is NOT saved; caller must re-assign) ----
    bool save(std::ostream& os) const {
        int32_t m = static_cast<int32_t>(mode);
        if (!os.write(reinterpret_cast<const char*>(&m), sizeof(m))) return false;
        if (!ivf.save(os)) return false;

        if (mode == BuildMode::GlobalPQFirst) {
            if (!global_pq.save(os)) return false;
        } else {
            size_t count = local_pq.size();
            if (!os.write(reinterpret_cast<const char*>(&count), sizeof(count))) return false;
            for (size_t i = 0; i < count; ++i) {
                if (!local_pq[i].save(os)) return false;
            }
            count = local_ready.size();
            if (!os.write(reinterpret_cast<const char*>(&count), sizeof(count))) return false;
            if (count && !os.write(reinterpret_cast<const char*>(local_ready.data()), count)) return false;
        }
        return !!os;
    }

    bool load(std::istream& is) {
        int32_t m = 0;
        if (!is.read(reinterpret_cast<char*>(&m), sizeof(m))) return false;
        mode = static_cast<BuildMode>(m);
        if (!ivf.load(is)) return false;
        n = ivf.reordered_ids.size();
        d = ivf.d;

        if (mode == BuildMode::GlobalPQFirst) {
            if (!global_pq.load(is)) return false;
        } else {
            size_t count = 0;
            if (!is.read(reinterpret_cast<char*>(&count), sizeof(count))) return false;
            local_pq.resize(count);
            for (size_t i = 0; i < count; ++i) {
                if (!local_pq[i].load(is)) return false;
            }
            if (!is.read(reinterpret_cast<char*>(&count), sizeof(count))) return false;
            local_ready.resize(count);
            if (count && !is.read(reinterpret_cast<char*>(local_ready.data()), count)) return false;
        }
        return !!is;
    }
};

static inline size_t NormalizeRerankP(size_t rerank_p, size_t base_n, size_t k) {
    if (rerank_p < k) {
        rerank_p = k;
    }
    return std::min(rerank_p, base_n);
}

static inline void ScanGlobalList(const IVFPQIndex& index, const float* lut,
                                  uint32_t list_id, size_t keep,
                                  ann_ivf::SearchHeap& coarse) {
    const size_t begin = index.ivf.list_offsets[list_id];
    const size_t end = index.ivf.list_offsets[static_cast<size_t>(list_id) + 1];
    for (size_t pos = begin; pos < end; ++pos) {
        const uint32_t id = index.ivf.reordered_ids[pos];
        const float dist = adc_distance(
            lut, index.global_pq.codes.data() + static_cast<size_t>(id) * index.global_pq.M,
            index.global_pq.M);
        ann_ivf::PushTopK(coarse, dist, id, keep);
    }
}

static inline void ScanLocalList(const IVFPQIndex& index, const float* query,
                                 uint32_t list_id, size_t keep,
                                 ann_ivf::SearchHeap& coarse) {
    if (list_id >= index.local_ready.size() || !index.local_ready[list_id]) {
        return;
    }
    const PQIndex& pq = index.local_pq[list_id];
    // 栈分配 LUT: M=8, ksub≤256 → 最多 8×256 = 2048 floats (8 KB)
    // 避免 per-call std::vector 堆分配, 大幅降低热路径开销
    float lut[8 * 256];
    pq.build_lut(query, lut);

    const size_t begin = index.ivf.list_offsets[list_id];
    const size_t end = index.ivf.list_offsets[static_cast<size_t>(list_id) + 1];
    for (size_t pos = begin; pos < end; ++pos) {
        const size_t local_pos = pos - begin;
        const uint32_t id = index.ivf.reordered_ids[pos];
        const float dist = adc_distance(
            lut, pq.codes.data() + local_pos * pq.M, pq.M);
        ann_ivf::PushTopK(coarse, dist, id, keep);
    }
}

static inline void ScanList(const IVFPQIndex& index, const float* query,
                            const float* global_lut, uint32_t list_id,
                            size_t keep, ann_ivf::SearchHeap& coarse) {
    if (index.mode == BuildMode::GlobalPQFirst) {
        ScanGlobalList(index, global_lut, list_id, keep, coarse);
    } else {
        ScanLocalList(index, query, list_id, keep, coarse);
    }
}

static inline ann_ivf::SearchHeap Rerank(const IVFPQIndex& index,
                                         const float* query, size_t k,
                                         ann_ivf::SearchHeap& coarse) {
    ann_ivf::SearchHeap result;
    while (!coarse.empty()) {
        const uint32_t id = coarse.top().second;
        coarse.pop();
        const float dist = ann_ivf::Distance(index.base + static_cast<size_t>(id) * index.d,
                                             query, index.d);
        ann_ivf::PushTopK(result, dist, id, k);
    }
    return result;
}

}  // namespace ann_ivfpq

static inline ann_ivf::SearchHeap ivf_pq_search(
    const ann_ivfpq::IVFPQIndex& index, const float* query,
    size_t k, size_t nprobe, size_t rerank_p) {
    rerank_p = ann_ivfpq::NormalizeRerankP(rerank_p, index.n, k);
    const std::vector<uint32_t> probes = index.ivf.select_probes(query, nprobe);

    std::vector<float> global_lut;
    const float* global_lut_ptr = nullptr;
    if (index.mode == ann_ivfpq::BuildMode::GlobalPQFirst) {
        global_lut.resize(static_cast<size_t>(index.global_pq.M) * 256);
        index.global_pq.build_lut(query, global_lut.data());
        global_lut_ptr = global_lut.data();
    }

    ann_ivf::SearchHeap coarse;
    for (size_t i = 0; i < probes.size(); ++i) {
        ann_ivfpq::ScanList(index, query, global_lut_ptr, probes[i], rerank_p, coarse);
    }
    return ann_ivfpq::Rerank(index, query, k, coarse);
}

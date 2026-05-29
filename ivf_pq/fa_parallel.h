#pragma once

#include <algorithm>
#include <atomic>
#include <cstddef>
#include <pthread.h>
#include <vector>

#include "fa_index.h"
#include "fa_pool.h"

namespace fa_mt {

static inline int clamp_threads(int nthreads) {
    return nthreads < 1 ? 1 : nthreads;
}

// ===== inter-query (batch) =====

struct BatchArg {
    const fa_engine::FAIndex* index;
    const float* queries;
    size_t query_n;
    size_t k;
    size_t nprobe;
    size_t rerank_p;
    size_t q_start;
    size_t q_end;
    std::vector<fa_core::TopK>* results;
};

static inline void* batch_worker(void* arg) {
    BatchArg* a = static_cast<BatchArg*>(arg);
    for (size_t i = a->q_start; i < a->q_end; ++i)
        (*a->results)[i] = fa_search(*a->index,
                                     a->queries + i * a->index->d,
                                     a->k, a->nprobe, a->rerank_p);
    return nullptr;
}

struct DynBatchArg {
    const fa_engine::FAIndex* index;
    const float* queries;
    size_t query_n;
    size_t k;
    size_t nprobe;
    size_t rerank_p;
    std::atomic<size_t>* next_query;
    std::vector<fa_core::TopK>* results;
};

static inline void* dyn_batch_worker(void* arg) {
    DynBatchArg* a = static_cast<DynBatchArg*>(arg);
    while (true) {
        const size_t i = a->next_query->fetch_add(1, std::memory_order_relaxed);
        if (i >= a->query_n) break;
        (*a->results)[i] = fa_search(*a->index,
                                     a->queries + i * a->index->d,
                                     a->k, a->nprobe, a->rerank_p);
    }
    return nullptr;
}

// ===== intra-query (per-query scan) =====

struct ScanArg {
    const fa_engine::FAIndex* index;
    const float* query;
    const float* global_lut;
    const std::vector<uint32_t>* probes;
    size_t keep;
    size_t p_start;
    size_t p_end;
    fa_core::TopK local_heap;
};

static inline void* scan_worker(void* arg) {
    ScanArg* a = static_cast<ScanArg*>(arg);
    for (size_t i = a->p_start; i < a->p_end; ++i)
        fa_engine::scan_list(*a->index, a->query, a->global_lut,
                             (*a->probes)[i], a->keep, a->local_heap);
    return nullptr;
}

struct DynScanArg {
    const fa_engine::FAIndex* index;
    const float* query;
    const float* global_lut;
    const std::vector<uint32_t>* probes;
    size_t keep;
    std::atomic<size_t>* next_probe;
};

static inline void* dyn_scan_worker(void* arg) {
    DynScanArg* a = static_cast<DynScanArg*>(arg);
    fa_core::TopK* heap = new fa_core::TopK();
    while (true) {
        const size_t i = a->next_probe->fetch_add(1, std::memory_order_relaxed);
        if (i >= a->probes->size()) break;
        fa_engine::scan_list(*a->index, a->query, a->global_lut,
                             (*a->probes)[i], a->keep, *heap);
    }
    return heap;
}

static inline void maybe_fill_lut(const fa_engine::FAIndex& index,
                                  const float* query,
                                  std::vector<float>& lut,
                                  const float*& lut_ptr) {
    lut_ptr = nullptr;
    if (index.order == fa_engine::CodeOrder::QuantizeFirst) {
        lut.resize(static_cast<size_t>(index.global_codec.M) * 256);
        index.global_codec.fill_lut(query, lut.data());
        lut_ptr = lut.data();
    }
}

}  // namespace fa_mt

// ===== public API =====

static inline void fa_batch_static(
    const fa_engine::FAIndex& index, const float* queries, size_t query_n,
    size_t k, size_t nprobe, size_t rerank_p, int nthreads,
    std::vector<fa_core::TopK>& results) {
    using namespace fa_mt;
    nthreads = clamp_threads(nthreads);
    rerank_p = fa_engine::clamp_rerank(rerank_p, index.n, k);
    results.clear();
    results.resize(query_n);

    std::vector<pthread_t> threads(static_cast<size_t>(nthreads));
    std::vector<BatchArg> args(static_cast<size_t>(nthreads));
    const size_t chunk = (query_n + static_cast<size_t>(nthreads) - 1) /
                         static_cast<size_t>(nthreads);
    for (int t = 0; t < nthreads; ++t) {
        const size_t start = static_cast<size_t>(t) * chunk;
        const size_t end = std::min(start + chunk, query_n);
        args[static_cast<size_t>(t)] =
            {&index, queries, query_n, k, nprobe, rerank_p, start, end, &results};
        pthread_create(&threads[static_cast<size_t>(t)], nullptr,
                       &batch_worker, &args[static_cast<size_t>(t)]);
    }
    for (int t = 0; t < nthreads; ++t)
        pthread_join(threads[static_cast<size_t>(t)], nullptr);
}

// ---- inter-query dynamic (used by main.cc, best perf) ----
static inline void fa_batch(
    const fa_engine::FAIndex& index, const float* queries, size_t query_n,
    size_t k, size_t nprobe, size_t rerank_p, int nthreads,
    std::vector<fa_core::TopK>& results) {
    using namespace fa_mt;
    nthreads = clamp_threads(nthreads);
    rerank_p = fa_engine::clamp_rerank(rerank_p, index.n, k);
    results.clear();
    results.resize(query_n);

    std::atomic<size_t> next_query(0);
    std::vector<pthread_t> threads(static_cast<size_t>(nthreads));
    DynBatchArg arg =
        {&index, queries, query_n, k, nprobe, rerank_p, &next_query, &results};
    for (int t = 0; t < nthreads; ++t)
        pthread_create(&threads[static_cast<size_t>(t)], nullptr,
                       &dyn_batch_worker, &arg);
    for (int t = 0; t < nthreads; ++t)
        pthread_join(threads[static_cast<size_t>(t)], nullptr);
}

static inline fa_core::TopK fa_scan_static(
    const fa_engine::FAIndex& index, const float* query, size_t k,
    size_t nprobe, size_t rerank_p, int nthreads) {
    using namespace fa_mt;
    nthreads = clamp_threads(nthreads);
    rerank_p = fa_engine::clamp_rerank(rerank_p, index.n, k);
    const std::vector<uint32_t> probes = index.ivf.pick_lists(query, nprobe);

    std::vector<float> lut;
    const float* lut_ptr = nullptr;
    maybe_fill_lut(index, query, lut, lut_ptr);

    std::vector<pthread_t> threads(static_cast<size_t>(nthreads));
    std::vector<ScanArg> args(static_cast<size_t>(nthreads));
    const size_t chunk = (probes.size() + static_cast<size_t>(nthreads) - 1) /
                         static_cast<size_t>(nthreads);
    for (int t = 0; t < nthreads; ++t) {
        const size_t start = static_cast<size_t>(t) * chunk;
        const size_t end = std::min(start + chunk, probes.size());
        args[static_cast<size_t>(t)] =
            {&index, query, lut_ptr, &probes, rerank_p, start, end, fa_core::TopK()};
        pthread_create(&threads[static_cast<size_t>(t)], nullptr,
                       &scan_worker, &args[static_cast<size_t>(t)]);
    }
    for (int t = 0; t < nthreads; ++t)
        pthread_join(threads[static_cast<size_t>(t)], nullptr);

    std::vector<fa_core::TopK> heaps;
    heaps.reserve(static_cast<size_t>(nthreads));
    for (int t = 0; t < nthreads; ++t)
        heaps.push_back(std::move(args[static_cast<size_t>(t)].local_heap));
    fa_core::TopK coarse = fa_core::topk_merge(heaps, rerank_p);
    return fa_engine::rerank(index, query, k, coarse);
}

static inline fa_core::TopK fa_scan_dyn(
    const fa_engine::FAIndex& index, const float* query, size_t k,
    size_t nprobe, size_t rerank_p, int nthreads) {
    using namespace fa_mt;
    nthreads = clamp_threads(nthreads);
    rerank_p = fa_engine::clamp_rerank(rerank_p, index.n, k);
    const std::vector<uint32_t> probes = index.ivf.pick_lists(query, nprobe);

    std::vector<float> lut;
    const float* lut_ptr = nullptr;
    maybe_fill_lut(index, query, lut, lut_ptr);

    std::atomic<size_t> next_probe(0);
    std::vector<pthread_t> threads(static_cast<size_t>(nthreads));
    DynScanArg arg = {&index, query, lut_ptr, &probes, rerank_p, &next_probe};
    for (int t = 0; t < nthreads; ++t)
        pthread_create(&threads[static_cast<size_t>(t)], nullptr,
                       &dyn_scan_worker, &arg);

    std::vector<fa_core::TopK> heaps;
    heaps.reserve(static_cast<size_t>(nthreads));
    for (int t = 0; t < nthreads; ++t) {
        void* ret = nullptr;
        pthread_join(threads[static_cast<size_t>(t)], &ret);
        fa_core::TopK* heap = static_cast<fa_core::TopK*>(ret);
        heaps.push_back(std::move(*heap));
        delete heap;
    }
    fa_core::TopK coarse = fa_core::topk_merge(heaps, rerank_p);
    return fa_engine::rerank(index, query, k, coarse);
}

static inline void fa_batch_pool(
    const fa_engine::FAIndex& index, const float* queries, size_t query_n,
    size_t k, size_t nprobe, size_t rerank_p, int nthreads,
    std::vector<fa_core::TopK>& results) {
    nthreads = fa_mt::clamp_threads(nthreads);
    rerank_p = fa_engine::clamp_rerank(rerank_p, index.n, k);
    results.clear();
    results.resize(query_n);

    Workers pool(nthreads);
    for (size_t i = 0; i < query_n; ++i) {
        pool.Enqueue({i, i + 1, [&, i](size_t, size_t) {
            results[i] = fa_search(index, queries + i * index.d,
                                   k, nprobe, rerank_p);
        }});
    }
    pool.WaitAll();
}

static inline fa_core::TopK fa_scan_pool(
    const fa_engine::FAIndex& index, const float* query, size_t k,
    size_t nprobe, size_t rerank_p, int nthreads) {
    nthreads = fa_mt::clamp_threads(nthreads);
    rerank_p = fa_engine::clamp_rerank(rerank_p, index.n, k);
    const std::vector<uint32_t> probes = index.ivf.pick_lists(query, nprobe);

    std::vector<float> lut;
    const float* lut_ptr = nullptr;
    fa_mt::maybe_fill_lut(index, query, lut, lut_ptr);

    std::vector<fa_core::TopK> heaps(probes.size());
    Workers pool(nthreads);
    for (size_t p = 0; p < probes.size(); ++p) {
        pool.Enqueue({p, p + 1, [&, p](size_t, size_t) {
            fa_engine::scan_list(index, query, lut_ptr, probes[p], rerank_p, heaps[p]);
        }});
    }
    pool.WaitAll();

    fa_core::TopK coarse = fa_core::topk_merge(heaps, rerank_p);
    return fa_engine::rerank(index, query, k, coarse);
}

// 复用外部 Workers 的版本 —— 避免 per-query 创建/销毁线程
static inline fa_core::TopK fa_scan_reuse(
    const fa_engine::FAIndex& index, const float* query, size_t k,
    size_t nprobe, size_t rerank_p, Workers& pool) {
    rerank_p = fa_engine::clamp_rerank(rerank_p, index.n, k);
    const std::vector<uint32_t> probes = index.ivf.pick_lists(query, nprobe);

    std::vector<float> lut;
    const float* lut_ptr = nullptr;
    fa_mt::maybe_fill_lut(index, query, lut, lut_ptr);

    std::vector<fa_core::TopK> heaps(probes.size());
    for (size_t p = 0; p < probes.size(); ++p) {
        pool.Enqueue({p, p + 1, [&, p](size_t, size_t) {
            fa_engine::scan_list(index, query, lut_ptr, probes[p], rerank_p, heaps[p]);
        }});
    }
    pool.WaitAll();

    fa_core::TopK coarse = fa_core::topk_merge(heaps, rerank_p);
    return fa_engine::rerank(index, query, k, coarse);
}

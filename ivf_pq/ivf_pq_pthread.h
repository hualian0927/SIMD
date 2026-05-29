#pragma once

#include <algorithm>
#include <atomic>
#include <cstddef>
#include <pthread.h>
#include <vector>

#include "ivf_pq_simd.h"
#include "thread_pool.h"

namespace ann_ivfpq_pthread {

static inline int NormalizeThreads(int nthreads) {
    return nthreads < 1 ? 1 : nthreads;
}

struct InterStaticArg {
    const ann_ivfpq::IVFPQIndex* index;
    const float* queries;
    size_t query_n;
    size_t k;
    size_t nprobe;
    size_t rerank_p;
    size_t q_start;
    size_t q_end;
    std::vector<ann_ivf::SearchHeap>* results;
};

static inline void* InterStaticWorker(void* arg) {
    InterStaticArg* a = static_cast<InterStaticArg*>(arg);
    for (size_t i = a->q_start; i < a->q_end; ++i) {
        (*a->results)[i] = ivf_pq_search(*a->index,
                                         a->queries + i * a->index->d,
                                         a->k, a->nprobe, a->rerank_p);
    }
    return nullptr;
}

struct InterDynamicArg {
    const ann_ivfpq::IVFPQIndex* index;
    const float* queries;
    size_t query_n;
    size_t k;
    size_t nprobe;
    size_t rerank_p;
    std::atomic<size_t>* next_query;
    std::vector<ann_ivf::SearchHeap>* results;
};

static inline void* InterDynamicWorker(void* arg) {
    InterDynamicArg* a = static_cast<InterDynamicArg*>(arg);
    while (true) {
        const size_t i = a->next_query->fetch_add(1, std::memory_order_relaxed);
        if (i >= a->query_n) {
            break;
        }
        (*a->results)[i] = ivf_pq_search(*a->index,
                                         a->queries + i * a->index->d,
                                         a->k, a->nprobe, a->rerank_p);
    }
    return nullptr;
}

struct IntraStaticArg {
    const ann_ivfpq::IVFPQIndex* index;
    const float* query;
    const float* global_lut;
    const std::vector<uint32_t>* probes;
    size_t keep;
    size_t p_start;
    size_t p_end;
    ann_ivf::SearchHeap local_heap;
};

static inline void* IntraStaticWorker(void* arg) {
    IntraStaticArg* a = static_cast<IntraStaticArg*>(arg);
    for (size_t i = a->p_start; i < a->p_end; ++i) {
        ann_ivfpq::ScanList(*a->index, a->query, a->global_lut,
                            (*a->probes)[i], a->keep, a->local_heap);
    }
    return nullptr;
}

struct IntraDynamicArg {
    const ann_ivfpq::IVFPQIndex* index;
    const float* query;
    const float* global_lut;
    const std::vector<uint32_t>* probes;
    size_t keep;
    std::atomic<size_t>* next_probe;
};

static inline void* IntraDynamicWorker(void* arg) {
    IntraDynamicArg* a = static_cast<IntraDynamicArg*>(arg);
    ann_ivf::SearchHeap* heap = new ann_ivf::SearchHeap();
    while (true) {
        const size_t i = a->next_probe->fetch_add(1, std::memory_order_relaxed);
        if (i >= a->probes->size()) {
            break;
        }
        ann_ivfpq::ScanList(*a->index, a->query, a->global_lut,
                            (*a->probes)[i], a->keep, *heap);
    }
    return heap;
}

static inline void BuildGlobalLutIfNeeded(const ann_ivfpq::IVFPQIndex& index,
                                          const float* query,
                                          std::vector<float>& lut,
                                          const float*& lut_ptr) {
    lut_ptr = nullptr;
    if (index.mode == ann_ivfpq::BuildMode::GlobalPQFirst) {
        lut.resize(static_cast<size_t>(index.global_pq.M) * 256);
        index.global_pq.build_lut(query, lut.data());
        lut_ptr = lut.data();
    }
}

}  // namespace ann_ivfpq_pthread

static inline void ivf_pq_search_inter_static(
    const ann_ivfpq::IVFPQIndex& index, const float* queries, size_t query_n,
    size_t k, size_t nprobe, size_t rerank_p, int nthreads,
    std::vector<ann_ivf::SearchHeap>& results) {
    using namespace ann_ivfpq_pthread;
    nthreads = NormalizeThreads(nthreads);
    rerank_p = ann_ivfpq::NormalizeRerankP(rerank_p, index.n, k);
    results.clear();
    results.resize(query_n);

    std::vector<pthread_t> threads(static_cast<size_t>(nthreads));
    std::vector<InterStaticArg> args(static_cast<size_t>(nthreads));
    const size_t chunk = (query_n + static_cast<size_t>(nthreads) - 1) /
                         static_cast<size_t>(nthreads);
    for (int t = 0; t < nthreads; ++t) {
        const size_t start = static_cast<size_t>(t) * chunk;
        const size_t end = std::min(start + chunk, query_n);
        args[static_cast<size_t>(t)] =
            {&index, queries, query_n, k, nprobe, rerank_p, start, end, &results};
        pthread_create(&threads[static_cast<size_t>(t)], nullptr,
                       &InterStaticWorker, &args[static_cast<size_t>(t)]);
    }
    for (int t = 0; t < nthreads; ++t) {
        pthread_join(threads[static_cast<size_t>(t)], nullptr);
    }
}

static inline ann_ivf::SearchHeap ivf_pq_search_intra_static(
    const ann_ivfpq::IVFPQIndex& index, const float* query, size_t k,
    size_t nprobe, size_t rerank_p, int nthreads) {
    using namespace ann_ivfpq_pthread;
    nthreads = NormalizeThreads(nthreads);
    rerank_p = ann_ivfpq::NormalizeRerankP(rerank_p, index.n, k);
    const std::vector<uint32_t> probes = index.ivf.select_probes(query, nprobe);

    std::vector<float> lut;
    const float* lut_ptr = nullptr;
    BuildGlobalLutIfNeeded(index, query, lut, lut_ptr);

    std::vector<pthread_t> threads(static_cast<size_t>(nthreads));
    std::vector<IntraStaticArg> args(static_cast<size_t>(nthreads));
    const size_t chunk = (probes.size() + static_cast<size_t>(nthreads) - 1) /
                         static_cast<size_t>(nthreads);
    for (int t = 0; t < nthreads; ++t) {
        const size_t start = static_cast<size_t>(t) * chunk;
        const size_t end = std::min(start + chunk, probes.size());
        args[static_cast<size_t>(t)] =
            {&index, query, lut_ptr, &probes, rerank_p, start, end, ann_ivf::SearchHeap()};
        pthread_create(&threads[static_cast<size_t>(t)], nullptr,
                       &IntraStaticWorker, &args[static_cast<size_t>(t)]);
    }
    for (int t = 0; t < nthreads; ++t) {
        pthread_join(threads[static_cast<size_t>(t)], nullptr);
    }

    std::vector<ann_ivf::SearchHeap> heaps;
    heaps.reserve(static_cast<size_t>(nthreads));
    for (int t = 0; t < nthreads; ++t) {
        heaps.push_back(std::move(args[static_cast<size_t>(t)].local_heap));
    }
    ann_ivf::SearchHeap coarse = ann_ivf::MergeHeaps(heaps, rerank_p);
    return ann_ivfpq::Rerank(index, query, k, coarse);
}

static inline void ivf_pq_search_inter_dynamic(
    const ann_ivfpq::IVFPQIndex& index, const float* queries, size_t query_n,
    size_t k, size_t nprobe, size_t rerank_p, int nthreads,
    std::vector<ann_ivf::SearchHeap>& results) {
    using namespace ann_ivfpq_pthread;
    nthreads = NormalizeThreads(nthreads);
    rerank_p = ann_ivfpq::NormalizeRerankP(rerank_p, index.n, k);
    results.clear();
    results.resize(query_n);

    std::atomic<size_t> next_query(0);
    std::vector<pthread_t> threads(static_cast<size_t>(nthreads));
    InterDynamicArg arg =
        {&index, queries, query_n, k, nprobe, rerank_p, &next_query, &results};
    for (int t = 0; t < nthreads; ++t) {
        pthread_create(&threads[static_cast<size_t>(t)], nullptr,
                       &InterDynamicWorker, &arg);
    }
    for (int t = 0; t < nthreads; ++t) {
        pthread_join(threads[static_cast<size_t>(t)], nullptr);
    }
}

static inline ann_ivf::SearchHeap ivf_pq_search_intra_dynamic(
    const ann_ivfpq::IVFPQIndex& index, const float* query, size_t k,
    size_t nprobe, size_t rerank_p, int nthreads) {
    using namespace ann_ivfpq_pthread;
    nthreads = NormalizeThreads(nthreads);
    rerank_p = ann_ivfpq::NormalizeRerankP(rerank_p, index.n, k);
    const std::vector<uint32_t> probes = index.ivf.select_probes(query, nprobe);

    std::vector<float> lut;
    const float* lut_ptr = nullptr;
    BuildGlobalLutIfNeeded(index, query, lut, lut_ptr);

    std::atomic<size_t> next_probe(0);
    std::vector<pthread_t> threads(static_cast<size_t>(nthreads));
    IntraDynamicArg arg = {&index, query, lut_ptr, &probes, rerank_p, &next_probe};
    for (int t = 0; t < nthreads; ++t) {
        pthread_create(&threads[static_cast<size_t>(t)], nullptr,
                       &IntraDynamicWorker, &arg);
    }

    std::vector<ann_ivf::SearchHeap> heaps;
    heaps.reserve(static_cast<size_t>(nthreads));
    for (int t = 0; t < nthreads; ++t) {
        void* ret = nullptr;
        pthread_join(threads[static_cast<size_t>(t)], &ret);
        ann_ivf::SearchHeap* heap = static_cast<ann_ivf::SearchHeap*>(ret);
        heaps.push_back(std::move(*heap));
        delete heap;
    }
    ann_ivf::SearchHeap coarse = ann_ivf::MergeHeaps(heaps, rerank_p);
    return ann_ivfpq::Rerank(index, query, k, coarse);
}

static inline void ivf_pq_search_inter_pool(
    const ann_ivfpq::IVFPQIndex& index, const float* queries, size_t query_n,
    size_t k, size_t nprobe, size_t rerank_p, int nthreads,
    std::vector<ann_ivf::SearchHeap>& results) {
    nthreads = ann_ivfpq_pthread::NormalizeThreads(nthreads);
    rerank_p = ann_ivfpq::NormalizeRerankP(rerank_p, index.n, k);
    results.clear();
    results.resize(query_n);

    ThreadPool pool(nthreads);
    for (size_t i = 0; i < query_n; ++i) {
        pool.Enqueue({i, i + 1, [&, i](size_t, size_t) {
            results[i] = ivf_pq_search(index, queries + i * index.d,
                                       k, nprobe, rerank_p);
        }});
    }
    pool.WaitAll();
}

static inline ann_ivf::SearchHeap ivf_pq_search_intra_pool(
    const ann_ivfpq::IVFPQIndex& index, const float* query, size_t k,
    size_t nprobe, size_t rerank_p, int nthreads) {
    nthreads = ann_ivfpq_pthread::NormalizeThreads(nthreads);
    rerank_p = ann_ivfpq::NormalizeRerankP(rerank_p, index.n, k);
    const std::vector<uint32_t> probes = index.ivf.select_probes(query, nprobe);

    std::vector<float> lut;
    const float* lut_ptr = nullptr;
    ann_ivfpq_pthread::BuildGlobalLutIfNeeded(index, query, lut, lut_ptr);

    std::vector<ann_ivf::SearchHeap> heaps(probes.size());
    ThreadPool pool(nthreads);
    for (size_t p = 0; p < probes.size(); ++p) {
        pool.Enqueue({p, p + 1, [&, p](size_t, size_t) {
            ann_ivfpq::ScanList(index, query, lut_ptr, probes[p], rerank_p, heaps[p]);
        }});
    }
    pool.WaitAll();

    ann_ivf::SearchHeap coarse = ann_ivf::MergeHeaps(heaps, rerank_p);
    return ann_ivfpq::Rerank(index, query, k, coarse);
}

// 复用外部线程池的版本 —— 避免 per-query 创建/销毁线程的开销
static inline ann_ivf::SearchHeap ivf_pq_search_intra_pool_ext(
    const ann_ivfpq::IVFPQIndex& index, const float* query, size_t k,
    size_t nprobe, size_t rerank_p, ThreadPool& pool) {
    rerank_p = ann_ivfpq::NormalizeRerankP(rerank_p, index.n, k);
    const std::vector<uint32_t> probes = index.ivf.select_probes(query, nprobe);

    std::vector<float> lut;
    const float* lut_ptr = nullptr;
    ann_ivfpq_pthread::BuildGlobalLutIfNeeded(index, query, lut, lut_ptr);

    std::vector<ann_ivf::SearchHeap> heaps(probes.size());
    for (size_t p = 0; p < probes.size(); ++p) {
        pool.Enqueue({p, p + 1, [&, p](size_t, size_t) {
            ann_ivfpq::ScanList(index, query, lut_ptr, probes[p], rerank_p, heaps[p]);
        }});
    }
    pool.WaitAll();

    ann_ivf::SearchHeap coarse = ann_ivf::MergeHeaps(heaps, rerank_p);
    return ann_ivfpq::Rerank(index, query, k, coarse);
}

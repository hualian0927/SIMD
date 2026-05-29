#ifndef IVF_PTHREAD_H
#define IVF_PTHREAD_H

#include <algorithm>
#include <atomic>
#include <cmath>
#include <cstdlib>
#include <cstring>
#include <iostream>
#include <limits>
#include <pthread.h>
#include <queue>
#include <vector>

#include "hnswlib/hnswlib/simd_utils.h"

// ---- 倒排表结构 ----
struct IVFList {
    std::vector<int> ids;
};

// ===================================================================
// 1. IVF 训练 (k-means) — pthread 并行 assign 步骤
// ===================================================================
struct TrainAssignArg {
    const float* base;
    size_t base_number;
    size_t vecdim;
    int K;
    const float* centroids;
    int* assign;
    size_t start;
    size_t end;
};

static inline void* train_assign_pthread_worker(void* arg) {
    TrainAssignArg* a = static_cast<TrainAssignArg*>(arg);
    for (size_t i = a->start; i < a->end; ++i) {
        float min_dist = std::numeric_limits<float>::max();
        int best_k = 0;
        const float* vec = a->base + i * a->vecdim;
        for (int k = 0; k < a->K; ++k) {
            float dist = 0.0f;
            const float* c = a->centroids + k * a->vecdim;
            for (size_t d = 0; d < a->vecdim; ++d) {
                float diff = vec[d] - c[d];
                dist += diff * diff;
            }
            if (dist < min_dist) { min_dist = dist; best_k = k; }
        }
        a->assign[i] = best_k;
    }
    return nullptr;
}

inline void train_ivf_pthread(const float* base, size_t base_number, size_t vecdim,
                              int K_ivf, std::vector<float>& ivf_centroids,
                              int nthreads = 8) {
    std::cerr << "[IVF-Pthread] Training " << K_ivf
              << " centroids with " << nthreads << " pthreads..." << std::endl;
    int max_iter = 15;
    ivf_centroids.resize(K_ivf * vecdim);

    // 随机初始化
    for (int k = 0; k < K_ivf; ++k) {
        int rand_idx = rand() % base_number;
        std::memcpy(&ivf_centroids[k * vecdim], base + rand_idx * vecdim,
                    vecdim * sizeof(float));
    }

    std::vector<int> assign(base_number);
    std::vector<float> new_centroids(K_ivf * vecdim);
    std::vector<int> counts(K_ivf);

    for (int iter = 0; iter < max_iter; ++iter) {
        // ---- assign: pthread 均分 base ----
        std::vector<pthread_t> threads(nthreads);
        std::vector<TrainAssignArg> args(nthreads);
        size_t chunk = (base_number + nthreads - 1) / nthreads;
        int actual = 0;
        for (int t = 0; t < nthreads; ++t) {
            size_t s = t * chunk;
            size_t e = std::min(s + chunk, base_number);
            if (s >= e) break;
            args[t].base = base;
            args[t].base_number = base_number;
            args[t].vecdim = vecdim;
            args[t].K = K_ivf;
            args[t].centroids = ivf_centroids.data();
            args[t].assign = assign.data();
            args[t].start = s;
            args[t].end = e;
            pthread_create(&threads[t], nullptr, train_assign_pthread_worker, &args[t]);
            actual = t + 1;
        }
        for (int t = 0; t < actual; ++t)
            pthread_join(threads[t], nullptr);

        // ---- update: 主线程归并 ----
        std::fill(new_centroids.begin(), new_centroids.end(), 0.0f);
        std::fill(counts.begin(), counts.end(), 0);
        for (size_t i = 0; i < base_number; ++i) {
            int k = assign[i];
            counts[k]++;
            const float* vec = base + i * vecdim;
            for (size_t d = 0; d < vecdim; ++d)
                new_centroids[k * vecdim + d] += vec[d];
        }
        for (int k = 0; k < K_ivf; ++k) {
            if (counts[k] > 0) {
                for (size_t d = 0; d < vecdim; ++d)
                    ivf_centroids[k * vecdim + d] = new_centroids[k * vecdim + d] / counts[k];
            }
        }
    }
}

// ===================================================================
// 2. 构建倒排表 — pthread 线程本地桶 + mutex 汇合
// ===================================================================
struct BuildIVFArg {
    const float* base;
    size_t base_number;
    size_t vecdim;
    int K_ivf;
    const float* centroids;
    std::vector<IVFList>* global_lists;
    pthread_mutex_t* mutex;
    size_t start;
    size_t end;
};

static inline void* build_ivf_pthread_worker(void* arg) {
    BuildIVFArg* a = static_cast<BuildIVFArg*>(arg);
    // 线程本地桶
    std::vector<std::vector<int>> local_lists(a->K_ivf);

    for (size_t i = a->start; i < a->end; ++i) {
        float min_dist = std::numeric_limits<float>::max();
        int best_k = 0;
        const float* vec = a->base + i * a->vecdim;
        for (int k = 0; k < a->K_ivf; ++k) {
            float dist = 0.0f;
            const float* c = a->centroids + k * a->vecdim;
            for (size_t d = 0; d < a->vecdim; ++d) {
                float diff = vec[d] - c[d];
                dist += diff * diff;
            }
            if (dist < min_dist) { min_dist = dist; best_k = k; }
        }
        local_lists[best_k].push_back(static_cast<int>(i));
    }

    // mutex 汇入全局
    pthread_mutex_lock(a->mutex);
    for (int k = 0; k < a->K_ivf; ++k) {
        auto& dst = (*a->global_lists)[k].ids;
        dst.insert(dst.end(), local_lists[k].begin(), local_lists[k].end());
    }
    pthread_mutex_unlock(a->mutex);
    return nullptr;
}

inline std::vector<IVFList> build_ivf_pthread(
    const float* base, size_t base_number, size_t vecdim,
    int K_ivf, const std::vector<float>& ivf_centroids, int nthreads = 8)
{
    std::cerr << "[IVF-Pthread] Building inverted lists with "
              << nthreads << " pthreads..." << std::endl;
    std::vector<IVFList> ivf_lists(K_ivf);
    pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;

    std::vector<pthread_t> threads(nthreads);
    std::vector<BuildIVFArg> args(nthreads);
    size_t chunk = (base_number + nthreads - 1) / nthreads;
    int actual = 0;
    for (int t = 0; t < nthreads; ++t) {
        size_t s = t * chunk;
        size_t e = std::min(s + chunk, base_number);
        if (s >= e) break;
        args[t].base = base;
        args[t].base_number = base_number;
        args[t].vecdim = vecdim;
        args[t].K_ivf = K_ivf;
        args[t].centroids = ivf_centroids.data();
        args[t].global_lists = &ivf_lists;
        args[t].mutex = &mutex;
        args[t].start = s;
        args[t].end = e;
        pthread_create(&threads[t], nullptr, build_ivf_pthread_worker, &args[t]);
        actual = t + 1;
    }
    for (int t = 0; t < actual; ++t)
        pthread_join(threads[t], nullptr);
    pthread_mutex_destroy(&mutex);

    std::cerr << "[IVF-Pthread] Build finished!" << std::endl;
    return ivf_lists;
}

// ===================================================================
// 3. 尝试 2 对应: intra-query 精排簇并行 (pthread 替代 OpenMP dynamic)
//    每个线程处理不同的簇, 维护局部 TopK, 最后 mutex 合并
// ===================================================================
struct FineParallelArg {
    const std::vector<float>* centroids;
    const std::vector<IVFList>* lists;
    const float* base;
    const float* query;
    size_t vecdim;
    size_t k;
    const std::vector<int>* target_clusters;
    size_t cluster_start;
    size_t cluster_end;
    std::priority_queue<std::pair<float, int>>* local_result;
};

static inline void* fine_parallel_worker(void* arg) {
    FineParallelArg* a = static_cast<FineParallelArg*>(arg);
    for (size_t i = a->cluster_start; i < a->cluster_end; ++i) {
        int cid = (*a->target_clusters)[i];
        for (int vid : (*a->lists)[cid].ids) {
            float d = InnerProductSIMDNeon(a->query, a->base + vid * a->vecdim, a->vecdim);
            auto& h = *a->local_result;
            if (h.size() < a->k) h.push({d, vid});
            else if (d < h.top().first) { h.pop(); h.push({d, vid}); }
        }
    }
    return nullptr;
}

inline std::priority_queue<std::pair<float, int>> ivf_simd_fine_pthread(
    const std::vector<float>& ivf_centroids, const std::vector<IVFList>& ivf_lists,
    const float* base, const float* query, size_t vecdim, size_t k,
    int nprobe, int nthreads = 8)
{
    // ---- 粗排 (串行, 计算量小) ----
    int K_ivf = static_cast<int>(ivf_centroids.size() / vecdim);
    std::priority_queue<std::pair<float, int>> coarse;
    for (int c = 0; c < K_ivf; ++c) {
        float d = InnerProductSIMDNeon(query, ivf_centroids.data() + c * vecdim, vecdim);
        if (coarse.size() < static_cast<size_t>(nprobe)) coarse.push({d, c});
        else if (d < coarse.top().first) { coarse.pop(); coarse.push({d, c}); }
    }
    std::vector<int> target;
    while (!coarse.empty()) { target.push_back(coarse.top().second); coarse.pop(); }

    // ---- 精排: pthread 均分簇 ----
    std::vector<pthread_t> threads(nthreads);
    std::vector<FineParallelArg> args(nthreads);
    std::vector<std::priority_queue<std::pair<float, int>>> local_heaps(nthreads);

    size_t nclusters = target.size();
    size_t chunk = (nclusters + nthreads - 1) / nthreads;
    int actual = 0;
    for (int t = 0; t < nthreads; ++t) {
        size_t s = t * chunk;
        size_t e = std::min(s + chunk, nclusters);
        if (s >= e) break;
        args[t].centroids = &ivf_centroids;
        args[t].lists = &ivf_lists;
        args[t].base = base;
        args[t].query = query;
        args[t].vecdim = vecdim;
        args[t].k = k;
        args[t].target_clusters = &target;
        args[t].cluster_start = s;
        args[t].cluster_end = e;
        args[t].local_result = &local_heaps[t];
        pthread_create(&threads[t], nullptr, fine_parallel_worker, &args[t]);
        actual = t + 1;
    }
    for (int t = 0; t < actual; ++t)
        pthread_join(threads[t], nullptr);

    // 合并各线程的局部 TopK
    std::priority_queue<std::pair<float, int>> result;
    for (int t = 0; t < actual; ++t) {
        while (!local_heaps[t].empty()) {
            result.push(local_heaps[t].top());
            local_heaps[t].pop();
            if (result.size() > k) result.pop();
        }
    }
    return result;
}

// ===================================================================
// 4. 尝试 3 对应: inter-query 批量并行 (pthread 替代 OpenMP parallel for)
//    atomic fetch_add 分发 query, 零互斥, 每线程独立跑粗排+精排
// ===================================================================
struct BatchIVFArg {
    const std::vector<float>* centroids;
    const std::vector<IVFList>* lists;
    const float* base;
    const float* queries;
    size_t vecdim;
    size_t query_n;
    size_t k;
    int nprobe;
    std::atomic<size_t>* next_query;
    std::vector<float>* latencies;
    std::vector<float>* recalls;
    const int* gt;
    size_t gt_dim;
};

static inline void* batch_ivf_worker(void* arg) {
    BatchIVFArg* a = static_cast<BatchIVFArg*>(arg);
    int K_ivf = static_cast<int>(a->centroids->size() / a->vecdim);
    const unsigned long Converter = 1000 * 1000;

    while (true) {
        const size_t qi = a->next_query->fetch_add(1, std::memory_order_relaxed);
        if (qi >= a->query_n) break;

        const float* query = a->queries + qi * a->vecdim;
        struct timeval tv;
        gettimeofday(&tv, nullptr);

        // 粗排
        std::priority_queue<std::pair<float, int>> coarse;
        for (int c = 0; c < K_ivf; ++c) {
            float d = InnerProductSIMDNeon(query, a->centroids->data() + c * a->vecdim, a->vecdim);
            if (coarse.size() < static_cast<size_t>(a->nprobe)) coarse.push({d, c});
            else if (d < coarse.top().first) { coarse.pop(); coarse.push({d, c}); }
        }

        // 精排
        std::priority_queue<std::pair<float, int>> fine;
        while (!coarse.empty()) {
            int cid = coarse.top().second; coarse.pop();
            for (int vid : (*a->lists)[cid].ids) {
                float d = InnerProductSIMDNeon(query, a->base + vid * a->vecdim, a->vecdim);
                if (fine.size() < a->k) fine.push({d, vid});
                else if (d < fine.top().first) { fine.pop(); fine.push({d, vid}); }
            }
        }

        struct timeval tv2;
        gettimeofday(&tv2, nullptr);
        int64_t diff = (tv2.tv_sec * Converter + tv2.tv_usec)
                     - (tv.tv_sec * Converter + tv.tv_usec);
        (*a->latencies)[qi] = static_cast<float>(diff);

        // Recall
        std::set<uint32_t> gtset;
        for (size_t j = 0; j < a->k; ++j)
            gtset.insert(static_cast<uint32_t>(a->gt[j + qi * a->gt_dim]));
        size_t hits = 0;
        while (!fine.empty()) {
            if (gtset.find(static_cast<uint32_t>(fine.top().second)) != gtset.end())
                ++hits;
            fine.pop();
        }
        (*a->recalls)[qi] = static_cast<float>(hits) / a->k;
    }
    return nullptr;
}

inline void ivf_simd_batch_pthread(
    const std::vector<float>& ivf_centroids, const std::vector<IVFList>& ivf_lists,
    const float* base, const float* queries,
    size_t vecdim, size_t query_n, size_t k, int nprobe, int nthreads,
    std::vector<float>& latencies, std::vector<float>& recalls,
    const int* gt, size_t gt_dim)
{
    latencies.resize(query_n);
    recalls.resize(query_n);
    std::atomic<size_t> next_query(0);

    std::vector<pthread_t> threads(nthreads);
    BatchIVFArg arg;
    arg.centroids = &ivf_centroids; arg.lists = &ivf_lists; arg.base = base;
    arg.queries = queries; arg.vecdim = vecdim; arg.query_n = query_n;
    arg.k = k; arg.nprobe = nprobe; arg.next_query = &next_query;
    arg.latencies = &latencies; arg.recalls = &recalls;
    arg.gt = gt; arg.gt_dim = gt_dim;
    for (int t = 0; t < nthreads; ++t)
        pthread_create(&threads[t], nullptr, batch_ivf_worker, &arg);
    for (int t = 0; t < nthreads; ++t)
        pthread_join(threads[t], nullptr);
}

// ===================================================================
// 5. 纯串行 baseline (供参考, 与 batch 内部逻辑一致)
// ===================================================================
inline std::priority_queue<std::pair<float, int>> ivf_simd_serial(
    const std::vector<float>& ivf_centroids, const std::vector<IVFList>& ivf_lists,
    const float* base, const float* query, size_t vecdim, size_t k, int nprobe)
{
    int K_ivf = static_cast<int>(ivf_centroids.size() / vecdim);
    std::priority_queue<std::pair<float, int>> coarse;
    for (int c = 0; c < K_ivf; ++c) {
        float d = InnerProductSIMDNeon(query, ivf_centroids.data() + c * vecdim, vecdim);
        if (coarse.size() < static_cast<size_t>(nprobe)) coarse.push({d, c});
        else if (d < coarse.top().first) { coarse.pop(); coarse.push({d, c}); }
    }
    std::priority_queue<std::pair<float, int>> fine;
    while (!coarse.empty()) {
        int cid = coarse.top().second; coarse.pop();
        for (int vid : ivf_lists[cid].ids) {
            float d = InnerProductSIMDNeon(query, base + vid * vecdim, vecdim);
            if (fine.size() < k) fine.push({d, vid});
            else if (d < fine.top().first) { fine.pop(); fine.push({d, vid}); }
        }
    }
    return fine;
}

// ===================================================================
// 序列化 — 索引持久化到 files/, 后续运行跳过离线训练
// ===================================================================
inline void ivf_save(const std::string& path,
                     const std::vector<float>& centroids,
                     const std::vector<IVFList>& lists,
                     size_t vecdim, int K_ivf) {
    std::ofstream ofs(path, std::ios::binary);
    auto w = [&](const void* p, size_t sz) { ofs.write((const char*)p, sz); };
    size_t magic = 0x49564653; w(&magic, sizeof(magic)); // "IVFS"
    int K = K_ivf; w(&K, sizeof(K)); w(&vecdim, sizeof(vecdim));
    size_t sz = centroids.size(); w(&sz, sizeof(sz));
    w(centroids.data(), sz * sizeof(float));
    for (int k = 0; k < K; ++k) {
        sz = lists[k].ids.size(); w(&sz, sizeof(sz));
        if (sz) w(lists[k].ids.data(), sz * sizeof(int));
    }
    std::cerr << "[IVF] Index saved to " << path
              << " (" << (ofs.tellp() / 1024) << " KB)" << std::endl;
}

inline std::vector<IVFList> ivf_load(const std::string& path,
                                     std::vector<float>& centroids,
                                     size_t& vecdim, int& K_ivf) {
    std::ifstream ifs(path, std::ios::binary);
    if (!ifs) return {};
    auto r = [&](void* p, size_t sz) { ifs.read((char*)p, sz); return !!ifs; };
    size_t magic; if (!r(&magic, sizeof(magic)) || magic != 0x49564653) return {};
    if (!r(&K_ivf, sizeof(K_ivf))) return {};
    if (!r(&vecdim, sizeof(vecdim))) return {};
    size_t sz; if (!r(&sz, sizeof(sz))) return {};
    centroids.resize(sz);
    if (sz && !r(centroids.data(), sz * sizeof(float))) return {};
    std::vector<IVFList> lists(K_ivf);
    for (int k = 0; k < K_ivf; ++k) {
        if (!r(&sz, sizeof(sz))) return {};
        lists[k].ids.resize(sz);
        if (sz && !r(lists[k].ids.data(), sz * sizeof(int))) return {};
    }
    std::cerr << "[IVF] Index loaded from " << path << std::endl;
    return lists;
}

#endif // IVF_PTHREAD_H

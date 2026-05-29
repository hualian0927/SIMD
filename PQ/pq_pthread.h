#ifndef PQ_PTHREAD_H
#define PQ_PTHREAD_H

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

// 平台 SIMD 工具 (内积 NEON)
#include "hnswlib/hnswlib/simd_utils.h"

// ===================================================================
// 0. LUT 构建 (串行, 极轻量, 不需并行)
// ===================================================================
inline void pq_build_lut(const float* query, size_t sub_dim,
                         int M, int K_pq,
                         const std::vector<float>& codebooks_SoA,
                         float lut[4][256]) {
    for (int m = 0; m < M; ++m) {
        const float* sub_query = query + m * sub_dim;
        const float* centroids_SoA_m = codebooks_SoA.data() + m * K_pq * sub_dim;
        for (int c = 0; c < K_pq; ++c) {
            float dot = 0.0f;
            for (size_t d = 0; d < sub_dim; ++d)
                dot += sub_query[d] * centroids_SoA_m[d * K_pq + c];
            lut[m][c] = dot;
        }
    }
}

// ===================================================================
// 1. PQ 训练 — pthread 并行 (每子空间 k-means 的 assign/update 用多线程)
// ===================================================================
struct TrainArg {
    const float* base;
    size_t base_number;
    size_t vecdim;
    size_t sub_dim;
    int K;
    float* centroids;
    size_t start;
    size_t end;
    std::vector<int>* assign;
};

static inline void* train_assign_worker(void* arg) {
    TrainArg* a = static_cast<TrainArg*>(arg);
    for (size_t i = a->start; i < a->end; ++i) {
        float min_dist = std::numeric_limits<float>::max();
        int best_k = 0;
        const float* sub_vec = a->base + i * a->vecdim;
        for (int k = 0; k < a->K; ++k) {
            float dist = 0.0f;
            const float* c = a->centroids + k * a->sub_dim;
            for (size_t d = 0; d < a->sub_dim; ++d) {
                float diff = sub_vec[d] - c[d];
                dist += diff * diff;
            }
            if (dist < min_dist) { min_dist = dist; best_k = k; }
        }
        (*a->assign)[i] = best_k;
    }
    return nullptr;
}

inline void train_pq_pthread(const float* base, size_t base_number, size_t vecdim,
                             int M, int K, std::vector<float>& codebooks,
                             int nthreads = 8) {
    size_t sub_dim = vecdim / M;
    int max_iter = 15;
    codebooks.resize(M * K * sub_dim);
    std::cerr << "[PQ-Pthread] Training " << M << " sub-spaces, "
              << K << " centroids, " << nthreads << " threads..." << std::endl;

    for (int m = 0; m < M; ++m) {
        float* centroids = codebooks.data() + m * K * sub_dim;
        for (int k = 0; k < K; ++k) {
            int rand_idx = rand() % base_number;
            std::memcpy(centroids + k * sub_dim,
                        base + rand_idx * vecdim + m * sub_dim,
                        sub_dim * sizeof(float));
        }

        std::vector<int> assign(base_number);

        for (int iter = 0; iter < max_iter; ++iter) {
            // ---- assign: pthread 并行 ----
            std::vector<pthread_t> threads(nthreads);
            std::vector<TrainArg> args(nthreads);
            size_t chunk = (base_number + nthreads - 1) / nthreads;
            for (int t = 0; t < nthreads; ++t) {
                size_t s = t * chunk;
                size_t e = std::min(s + chunk, base_number);
                args[t].base = base + m * sub_dim;
                args[t].base_number = base_number;
                args[t].vecdim = vecdim;
                args[t].sub_dim = sub_dim;
                args[t].K = K;
                args[t].centroids = centroids;
                args[t].start = s;
                args[t].end = e;
                args[t].assign = &assign;
                pthread_create(&threads[t], nullptr, train_assign_worker, &args[t]);
            }
            for (int t = 0; t < nthreads; ++t)
                pthread_join(threads[t], nullptr);

            // ---- update: 主线程归并 ----
            std::vector<float> new_centroids(K * sub_dim, 0.0f);
            std::vector<int> counts(K, 0);
            for (size_t i = 0; i < base_number; ++i) {
                int k = assign[i];
                counts[k]++;
                const float* sub_vec = base + i * vecdim + m * sub_dim;
                for (size_t d = 0; d < sub_dim; ++d)
                    new_centroids[k * sub_dim + d] += sub_vec[d];
            }
            for (int k = 0; k < K; ++k) {
                if (counts[k] > 0) {
                    for (size_t d = 0; d < sub_dim; ++d)
                        centroids[k * sub_dim + d] = new_centroids[k * sub_dim + d] / counts[k];
                }
            }
        }
    }
}

// ===================================================================
// 2. PQ 编码 — pthread 并行
// ===================================================================
struct EncodeArg {
    const float* base;
    size_t vecdim;
    size_t sub_dim;
    int M;
    int K;
    const float* codebooks;
    uint8_t* pq_base;
    size_t start;
    size_t end;
};

static inline void* encode_worker(void* arg) {
    EncodeArg* a = static_cast<EncodeArg*>(arg);
    for (size_t i = a->start; i < a->end; ++i) {
        for (int m = 0; m < a->M; ++m) {
            const float* sub_vec = a->base + i * a->vecdim + m * a->sub_dim;
            const float* centroids = a->codebooks + m * a->K * a->sub_dim;
            float min_dist = std::numeric_limits<float>::max();
            int best_k = 0;
            for (int k = 0; k < a->K; ++k) {
                float dist = 0.0f;
                const float* c = centroids + k * a->sub_dim;
                for (size_t d = 0; d < a->sub_dim; ++d) {
                    float diff = sub_vec[d] - c[d];
                    dist += diff * diff;
                }
                if (dist < min_dist) { min_dist = dist; best_k = k; }
            }
            a->pq_base[i * a->M + m] = static_cast<uint8_t>(best_k);
        }
    }
    return nullptr;
}

inline uint8_t* encode_pq_pthread(const float* base, size_t base_number, size_t vecdim,
                                  int M, int K, const std::vector<float>& codebooks,
                                  int nthreads = 8) {
    size_t sub_dim = vecdim / M;
    uint8_t* pq_base = new uint8_t[base_number * M];

    std::vector<pthread_t> threads(nthreads);
    std::vector<EncodeArg> args(nthreads);
    size_t chunk = (base_number + nthreads - 1) / nthreads;
    for (int t = 0; t < nthreads; ++t) {
        size_t s = t * chunk;
        size_t e = std::min(s + chunk, base_number);
        args[t].base = base;
        args[t].vecdim = vecdim;
        args[t].sub_dim = sub_dim;
        args[t].M = M;
        args[t].K = K;
        args[t].codebooks = codebooks.data();
        args[t].pq_base = pq_base;
        args[t].start = s;
        args[t].end = e;
        pthread_create(&threads[t], nullptr, encode_worker, &args[t]);
    }
    for (int t = 0; t < nthreads; ++t)
        pthread_join(threads[t], nullptr);

    std::cerr << "[PQ-Pthread] Encoding Finished!" << std::endl;
    return pq_base;
}

// ===================================================================
// 3. 策略 A: intra-query pthread 分块扫描 (底库分块, 无锁)
//    → 替代原 OpenMP 版本 pq_adc_search_chunk_parallel
// ===================================================================
struct IntraChunkArg {
    const uint8_t* pq_base;
    int M;
    float (*lut)[256];
    size_t start;
    size_t end;
    size_t P_size;
    std::priority_queue<std::pair<float, int>>* local_heap;  // 线程局部堆
};

static inline void* intra_chunk_worker(void* arg) {
    IntraChunkArg* a = static_cast<IntraChunkArg*>(arg);
    for (size_t i = a->start; i < a->end; ++i) {
        const uint8_t* pq_vec = a->pq_base + i * a->M;
        float proxy_dot = a->lut[0][pq_vec[0]] + a->lut[1][pq_vec[1]]
                        + a->lut[2][pq_vec[2]] + a->lut[3][pq_vec[3]];
        float proxy_dist = 1.0f - proxy_dot;
        auto& h = *a->local_heap;
        if (h.size() < a->P_size) {
            h.push({proxy_dist, static_cast<int>(i)});
        } else if (proxy_dist < h.top().first) {
            h.pop();
            h.push({proxy_dist, static_cast<int>(i)});
        }
    }
    return nullptr;
}

inline std::priority_queue<std::pair<float, int>> pq_adc_search_intra_pthread(
    const uint8_t* pq_base, const float* base, const float* query,
    size_t base_number, size_t vecdim, size_t k,
    int M, int K_pq, const std::vector<float>& codebooks_SoA,
    size_t P_size, int nthreads = 8)
{
    size_t sub_dim = vecdim / M;
    float lut[4][256];
    pq_build_lut(query, sub_dim, M, K_pq, codebooks_SoA, lut);

    // 每线程维护局部有界堆, 无需 800KB dist_array + nth_element
    size_t p_actual = std::min(P_size, base_number);
    std::vector<std::priority_queue<std::pair<float, int>>> local_heaps(nthreads);

    std::vector<pthread_t> threads(nthreads);
    std::vector<IntraChunkArg> args(nthreads);
    size_t chunk = (base_number + nthreads - 1) / nthreads;
    for (int t = 0; t < nthreads; ++t) {
        size_t s = t * chunk;
        size_t e = std::min(s + chunk, base_number);
        if (s >= e) { threads.resize(t); break; }
        args[t].pq_base = pq_base;
        args[t].M = M;
        args[t].lut = (float(*)[256])lut;
        args[t].start = s;
        args[t].end = e;
        args[t].P_size = p_actual;
        args[t].local_heap = &local_heaps[t];
        pthread_create(&threads[t], nullptr, intra_chunk_worker, &args[t]);
    }
    for (size_t t = 0; t < threads.size(); ++t)
        pthread_join(threads[t], nullptr);

    // 合并各线程局部堆 → 全局 coarse 堆
    std::priority_queue<std::pair<float, int>> coarse;
    for (size_t t = 0; t < threads.size(); ++t) {
        while (!local_heaps[t].empty()) {
            auto p = local_heaps[t].top(); local_heaps[t].pop();
            if (coarse.size() < p_actual) coarse.push(p);
            else if (p.first < coarse.top().first) { coarse.pop(); coarse.push(p); }
        }
    }

    // 精排 top-K (从 coarse 堆弹出 距离最近的优先)
    std::priority_queue<std::pair<float, int>> fine_top_k;
    while (!coarse.empty()) {
        int cid = coarse.top().second; coarse.pop();
        float exact = InnerProductSIMDNeon(query, base + cid * vecdim, vecdim);
        if (fine_top_k.size() < k) fine_top_k.push({exact, cid});
        else if (exact < fine_top_k.top().first) { fine_top_k.pop(); fine_top_k.push({exact, cid}); }
    }
    return fine_top_k;
}

// ===================================================================
// 4. 策略 B: inter-query pthread 批量并行 (原子分发, 零互斥)
//    → 替代原 OpenMP 版本 #pragma omp parallel for
// ===================================================================
struct BatchArg {
    const uint8_t* pq_base;
    const float* base;
    const float* queries;
    size_t base_number;
    size_t vecdim;
    size_t query_n;
    size_t k;
    int M;
    int K_pq;
    const std::vector<float>* codebooks_SoA;
    size_t P_size;
    std::atomic<size_t>* next_query;
    std::vector<float>* latencies;   // per-query latency (us)
    std::vector<float>* recalls;     // per-query recall
    const int* gt;
    size_t gt_dim;
};

static inline void* batch_worker(void* arg) {
    BatchArg* a = static_cast<BatchArg*>(arg);
    size_t sub_dim = a->vecdim / a->M;
    const unsigned long Converter = 1000 * 1000;

    while (true) {
        const size_t i = a->next_query->fetch_add(1, std::memory_order_relaxed);
        if (i >= a->query_n) break;

        const float* query = a->queries + i * a->vecdim;
        struct timeval val;
        gettimeofday(&val, nullptr);

        // 有界堆一趟扫描: 省掉 800KB dist_array + nth_element
        float lut[4][256];
        pq_build_lut(query, sub_dim, a->M, a->K_pq, *a->codebooks_SoA, lut);

        size_t p_actual = std::min(a->P_size, a->base_number);
        std::priority_queue<std::pair<float, int>> coarse;
        for (size_t j = 0; j < a->base_number; ++j) {
            const uint8_t* pq_vec = a->pq_base + j * a->M;
            float dot = lut[0][pq_vec[0]] + lut[1][pq_vec[1]]
                      + lut[2][pq_vec[2]] + lut[3][pq_vec[3]];
            float dist = 1.0f - dot;
            if (coarse.size() < p_actual) {
                coarse.push({dist, static_cast<int>(j)});
            } else if (dist < coarse.top().first) {
                coarse.pop();
                coarse.push({dist, static_cast<int>(j)});
            }
        }

        // 精排: 从 coarse 弹出候选做精确距离
        std::priority_queue<std::pair<float, int>> fine_top_k;
        while (!coarse.empty()) {
            int cid = coarse.top().second; coarse.pop();
            float exact = InnerProductSIMDNeon(query, a->base + cid * a->vecdim, a->vecdim);
            if (fine_top_k.size() < a->k)
                fine_top_k.push({exact, cid});
            else if (exact < fine_top_k.top().first) {
                fine_top_k.pop();
                fine_top_k.push({exact, cid});
            }
        }

        struct timeval newVal;
        gettimeofday(&newVal, nullptr);
        int64_t diff = (newVal.tv_sec * Converter + newVal.tv_usec)
                     - (val.tv_sec * Converter + val.tv_usec);
        (*a->latencies)[i] = static_cast<float>(diff);

        // Recall
        std::set<uint32_t> gtset;
        for (size_t j = 0; j < a->k; ++j)
            gtset.insert(static_cast<uint32_t>(a->gt[j + i * a->gt_dim]));
        size_t hits = 0;
        while (!fine_top_k.empty()) {
            if (gtset.find(static_cast<uint32_t>(fine_top_k.top().second)) != gtset.end())
                ++hits;
            fine_top_k.pop();
        }
        (*a->recalls)[i] = static_cast<float>(hits) / a->k;
    }
    return nullptr;
}

inline void pq_adc_search_batch_pthread(
    const uint8_t* pq_base, const float* base, const float* queries,
    size_t base_number, size_t vecdim, size_t query_n, size_t k,
    int M, int K_pq, const std::vector<float>& codebooks_SoA,
    size_t P_size, int nthreads,
    std::vector<float>& latencies, std::vector<float>& recalls,
    const int* gt, size_t gt_dim)
{
    latencies.resize(query_n);
    recalls.resize(query_n);
    std::atomic<size_t> next_query(0);

    std::vector<pthread_t> threads(nthreads);
    BatchArg arg;
    arg.pq_base = pq_base; arg.base = base; arg.queries = queries;
    arg.base_number = base_number; arg.vecdim = vecdim; arg.query_n = query_n;
    arg.k = k; arg.M = M; arg.K_pq = K_pq; arg.codebooks_SoA = &codebooks_SoA;
    arg.P_size = P_size; arg.next_query = &next_query;
    arg.latencies = &latencies; arg.recalls = &recalls;
    arg.gt = gt; arg.gt_dim = gt_dim;
    for (int t = 0; t < nthreads; ++t)
        pthread_create(&threads[t], nullptr, batch_worker, &arg);
    for (int t = 0; t < nthreads; ++t)
        pthread_join(threads[t], nullptr);
}

// ===================================================================
// 序列化 — 索引持久化到 files/, 后续运行跳过离线训练
// ===================================================================
inline void pq_save(const std::string& path,
                    const std::vector<float>& codebooks_SoA,
                    const uint8_t* pq_base,
                    size_t base_number, int M, int K_pq, size_t sub_dim) {
    std::ofstream ofs(path, std::ios::binary);
    auto w = [&](const void* p, size_t sz) { ofs.write((const char*)p, sz); };
    size_t magic = 0x50494354; w(&magic, sizeof(magic)); // "PICT"
    w(&base_number, sizeof(base_number));
    w(&M, sizeof(M)); w(&K_pq, sizeof(K_pq)); w(&sub_dim, sizeof(sub_dim));
    size_t sz = codebooks_SoA.size(); w(&sz, sizeof(sz));
    w(codebooks_SoA.data(), sz * sizeof(float));
    sz = base_number * M; w(pq_base, sz * sizeof(uint8_t));
    std::cerr << "[PQ] Index saved to " << path
              << " (" << (ofs.tellp() / 1024) << " KB)" << std::endl;
}

inline uint8_t* pq_load(const std::string& path,
                        std::vector<float>& codebooks_SoA,
                        size_t& base_number, int& M, int& K_pq, size_t& sub_dim) {
    std::ifstream ifs(path, std::ios::binary);
    if (!ifs) return nullptr;
    auto r = [&](void* p, size_t sz) { ifs.read((char*)p, sz); return !!ifs; };
    size_t magic; if (!r(&magic, sizeof(magic)) || magic != 0x50494354) return nullptr;
    if (!r(&base_number, sizeof(base_number))) return nullptr;
    if (!r(&M, sizeof(M)) || !r(&K_pq, sizeof(K_pq)) || !r(&sub_dim, sizeof(sub_dim))) return nullptr;
    size_t sz; if (!r(&sz, sizeof(sz))) return nullptr;
    codebooks_SoA.resize(sz);
    if (sz && !r(codebooks_SoA.data(), sz * sizeof(float))) return nullptr;
    sz = base_number * M;
    uint8_t* pq_base = new uint8_t[sz];
    if (!r(pq_base, sz * sizeof(uint8_t))) { delete[] pq_base; return nullptr; }
    std::cerr << "[PQ] Index loaded from " << path << std::endl;
    return pq_base;
}

#endif // PQ_PTHREAD_H

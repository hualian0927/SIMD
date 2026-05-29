#ifndef PQ_TRAIN_H
#define PQ_TRAIN_H

#include <algorithm>
#include <vector>
#include <cmath>
#include <cstdlib>
#include <iostream>
#include <limits>
#include <omp.h> 
#include <queue>
#include "simd_utils.h"

// 1. 训练 PQ (修复Bug的高质量版)
inline void train_pq(const float* base, size_t base_number, size_t vecdim, 
                     int M, int K, std::vector<float>& codebooks) {
    size_t sub_dim = vecdim / M;
    int max_iter = 15; 
    std::cerr << "[PQ] Training " << M << " sub-spaces, " << K << " centroids each..." << std::endl;

    for (int m = 0; m < M; ++m) {
        float* centroids = &codebooks[m * K * sub_dim];
        for (int k = 0; k < K; ++k) {
            int rand_idx = rand() % base_number;
            for (size_t d = 0; d < sub_dim; ++d) { centroids[k * sub_dim + d] = base[rand_idx * vecdim + m * sub_dim + d]; }
        }
        std::vector<int> assign(base_number, 0);

        for (int iter = 0; iter < max_iter; ++iter) {
            #pragma omp parallel for
            for (size_t i = 0; i < base_number; ++i) {
                float min_dist = std::numeric_limits<float>::max();
                int best_k = 0;
                const float* sub_vec = base + i * vecdim + m * sub_dim;
                for (int k = 0; k < K; ++k) {
                    float dist = 0.0f;
                    const float* c = centroids + k * sub_dim;
                    for (size_t d = 0; d < sub_dim; ++d) { float diff = sub_vec[d] - c[d]; dist += diff * diff; }
                    if (dist < min_dist) { min_dist = dist; best_k = k; }
                }
                assign[i] = best_k;
            }

            int num_threads = omp_get_max_threads();
            std::vector<std::vector<float>> local_new_centroids(num_threads, std::vector<float>(K * sub_dim, 0.0f));
            std::vector<std::vector<int>> local_counts(num_threads, std::vector<int>(K, 0));

            #pragma omp parallel
            {
                int tid = omp_get_thread_num();
                #pragma omp for // 已修复 ror 笔误
                for (size_t i = 0; i < base_number; ++i) {
                    int k = assign[i];
                    local_counts[tid][k]++;
                    const float* sub_vec = base + i * vecdim + m * sub_dim;
                    for (size_t d = 0; d < sub_dim; ++d) { local_new_centroids[tid][k * sub_dim + d] += sub_vec[d]; }
                }
            }
            std::vector<float> new_centroids(K * sub_dim, 0.0f);
            std::vector<int> counts(K, 0);
            for (int t = 0; t < num_threads; ++t) {
                for (int k = 0; k < K; ++k) {
                    counts[k] += local_counts[t][k];
                    for (size_t d = 0; d < sub_dim; ++d) { new_centroids[k * sub_dim + d] += local_new_centroids[t][k * sub_dim + d]; }
                }
            }
            for (int k = 0; k < K; ++k) {
                if (counts[k] > 0) {
                    for (size_t d = 0; d < sub_dim; ++d) { centroids[k * sub_dim + d] = new_centroids[k * sub_dim + d] / counts[k]; }
                }
            }
        }
    }
}

// 2. 将底库编码为 PQ 格式
inline uint8_t* encode_pq(const float* base, size_t base_number, size_t vecdim, 
                          int M, int K, const std::vector<float>& codebooks) {
    size_t sub_dim = vecdim / M;
    uint8_t* pq_base = new uint8_t[base_number * M]; 
    #pragma omp parallel for
    for (size_t i = 0; i < base_number; ++i) {
        for (int m = 0; m < M; ++m) { 
            const float* sub_vec = base + i * vecdim + m * sub_dim;
            const float* centroids = &codebooks[m * K * sub_dim];
            float min_dist = std::numeric_limits<float>::max();
            int best_k = 0;
            for (int k = 0; k < K; ++k) {
                float dist = 0.0f;
                const float* c = centroids + k * sub_dim;
                for (size_t d = 0; d < sub_dim; ++d) { float diff = sub_vec[d] - c[d]; dist += diff * diff; }
                if (dist < min_dist) { min_dist = dist; best_k = k; }
            }
            pq_base[i * M + m] = static_cast<uint8_t>(best_k); 
        }
    }
    std::cerr << "[PQ] Encoding Finished!" << std::endl;
    return pq_base;
}

// ===================================================================
// 3. 极速纯串行版 (无锁) —— 专供 Batch Query 多查询并发调用
// ===================================================================
inline std::priority_queue<std::pair<float, int>> pq_adc_search_pure_serial(
    const uint8_t* pq_base, const float* base, const float* query, 
    size_t base_number, size_t vecdim, size_t k,
    int M, int K_pq, const std::vector<float>& codebooks_SoA, size_t P_size) {
    
    size_t sub_dim = vecdim / M; 
    float lut[4][256]; 
    for (int m = 0; m < M; ++m) {
        const float* sub_query = query + m * sub_dim;
        const float* centroids_SoA_m = codebooks_SoA.data() + m * K_pq * sub_dim;
        for (int c = 0; c < K_pq; ++c) {
            float dot = 0.0f;
            for (size_t d = 0; d < sub_dim; ++d) { dot += sub_query[d] * centroids_SoA_m[d * K_pq + c]; }
            lut[m][c] = dot;
        }
    }

    std::vector<std::pair<float, int>> dist_array(base_number);
    for (size_t i = 0; i < base_number; ++i) {
        const uint8_t* pq_vec = pq_base + i * M;
        float proxy_dot = lut[0][pq_vec[0]] + lut[1][pq_vec[1]] + lut[2][pq_vec[2]] + lut[3][pq_vec[3]];
        dist_array[i] = {1.0f - proxy_dot, static_cast<int>(i)};
    }

    std::nth_element(dist_array.begin(), dist_array.begin() + P_size, dist_array.end(),
                     [](const std::pair<float, int>& a, const std::pair<float, int>& b) { return a.first < b.first; });

    std::priority_queue<std::pair<float, int>> fine_top_k;
    for (size_t i = 0; i < P_size; ++i) {
        int candidate_idx = dist_array[i].second;
        float exact_dist = InnerProductSIMDNeon(query, base + candidate_idx * vecdim, vecdim);
        if (fine_top_k.size() < k) fine_top_k.push({exact_dist, candidate_idx});
        else if (exact_dist < fine_top_k.top().first) { fine_top_k.pop(); fine_top_k.push({exact_dist, candidate_idx}); }
    }
    return fine_top_k;
}

// ===================================================================
// 4. Pthread 风格：查表分块扫描并行 (指导书要求的“底库分块扫描”)
// ===================================================================
inline std::priority_queue<std::pair<float, int>> pq_adc_search_chunk_parallel(
    const uint8_t* pq_base, const float* base, const float* query, 
    size_t base_number, size_t vecdim, size_t k,
    int M, int K_pq, const std::vector<float>& codebooks_SoA, size_t P_size) {
    
    size_t sub_dim = vecdim / M; 
    float lut[4][256]; 
    for (int m = 0; m < M; ++m) {
        const float* sub_query = query + m * sub_dim;
        const float* centroids_SoA_m = codebooks_SoA.data() + m * K_pq * sub_dim;
        for (int c = 0; c < K_pq; ++c) {
            float dot = 0.0f;
            for (size_t d = 0; d < sub_dim; ++d) { dot += sub_query[d] * centroids_SoA_m[d * K_pq + c]; }
            lut[m][c] = dot;
        }
    }

    std::vector<std::pair<float, int>> dist_array(base_number);

    // 🌟 Pthread 风格的高阶玩法：不要用 omp for！
    // 而是根据线程 ID 手动切分 10 万底库，彻底消灭 OpenMP 的隐式屏障调度开销！
    #pragma omp parallel
    {
        int tid = omp_get_thread_num();
        int threads = omp_get_num_threads();
        
        // 静态均分底库分块 (Static Chunking)
        size_t chunk = base_number / threads;
        size_t start_idx = tid * chunk;
        size_t end_idx = (tid == threads - 1) ? base_number : start_idx + chunk;

        // 线程在自己负责的区块内全速奔跑，无锁，无竞争！
        for (size_t i = start_idx; i < end_idx; ++i) {
            const uint8_t* pq_vec = pq_base + i * M;
            float proxy_dot = lut[0][pq_vec[0]] + lut[1][pq_vec[1]] + lut[2][pq_vec[2]] + lut[3][pq_vec[3]];
            dist_array[i] = {1.0f - proxy_dot, static_cast<int>(i)};
        }
    } // 线程在这里汇合一次

    std::nth_element(dist_array.begin(), dist_array.begin() + P_size, dist_array.end(),
                     [](const std::pair<float, int>& a, const std::pair<float, int>& b) { return a.first < b.first; });

    std::priority_queue<std::pair<float, int>> fine_top_k;
    for (size_t i = 0; i < P_size; ++i) {
        int candidate_idx = dist_array[i].second;
        float exact_dist = InnerProductSIMDNeon(query, base + candidate_idx * vecdim, vecdim);
        if (fine_top_k.size() < k) fine_top_k.push({exact_dist, candidate_idx});
        else if (exact_dist < fine_top_k.top().first) { fine_top_k.pop(); fine_top_k.push({exact_dist, candidate_idx}); }
    }
    return fine_top_k;
}

#endif // PQ_TRAIN_H
#ifndef PQ_TRAIN_H
#define PQ_TRAIN_H

#include <vector>
#include <cmath>
#include <cstdlib>
#include <iostream>
#include <limits>
#include <omp.h> // 使用 OpenMP 加速离线训练

// 1. 训练 PQ 的 Codebook (K-Means 聚类)
inline void train_pq(const float* base, size_t base_number, size_t vecdim, 
                     int M, int K, std::vector<float>& codebooks) {
    size_t sub_dim = vecdim / M;
    int max_iter = 15; // 迭代 15 次

    std::cerr << "[PQ] Training " << M << " sub-spaces, " << K << " centroids each..." << std::endl;

    for (int m = 0; m < M; ++m) {
        float* centroids = &codebooks[m * K * sub_dim];

        // 随机初始化聚类中心
        for (int k = 0; k < K; ++k) {
            int rand_idx = rand() % base_number;
            for (size_t d = 0; d < sub_dim; ++d) {
                centroids[k * sub_dim + d] = base[rand_idx * vecdim + m * sub_dim + d];
            }
        }

        std::vector<int> assign(base_number, 0);
        std::vector<float> new_centroids(K * sub_dim, 0.0f);
        std::vector<int> counts(K, 0);

        for (int iter = 0; iter < max_iter; ++iter) {
            // 为每个向量寻找最近的聚类中心 (开启 OpenMP 多线程加速)
            #pragma omp parallel for
            for (size_t i = 0; i < base_number; ++i) {
                float min_dist = std::numeric_limits<float>::max();
                int best_k = 0;
                const float* sub_vec = base + i * vecdim + m * sub_dim;

                for (int k = 0; k < K; ++k) {
                    float dist = 0.0f;
                    const float* c = centroids + k * sub_dim;
                    for (size_t d = 0; d < sub_dim; ++d) {
                        float diff = sub_vec[d] - c[d];
                        dist += diff * diff; // 使用 L2 距离进行聚类
                    }
                    if (dist < min_dist) {
                        min_dist = dist;
                        best_k = k;
                    }
                }
                assign[i] = best_k;
            }

            // 更新聚类中心
            std::fill(new_centroids.begin(), new_centroids.end(), 0.0f);
            std::fill(counts.begin(), counts.end(), 0);

            for (size_t i = 0; i < base_number; ++i) {
                int k = assign[i];
                counts[k]++;
                const float* sub_vec = base + i * vecdim + m * sub_dim;
                for (size_t d = 0; d < sub_dim; ++d) {
                    new_centroids[k * sub_dim + d] += sub_vec[d];
                }
            }

            for (int k = 0; k < K; ++k) {
                if (counts[k] > 0) {
                    for (size_t d = 0; d < sub_dim; ++d) {
                        centroids[k * sub_dim + d] = new_centroids[k * sub_dim + d] / counts[k];
                    }
                }
            }
        }
    }
}

// 2. 将底库编码为 PQ 格式 ( 96维 float 变成 4维 uint8_t)
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
                for (size_t d = 0; d < sub_dim; ++d) {
                    float diff = sub_vec[d] - c[d];
                    dist += diff * diff;
                }
                if (dist < min_dist) {
                    min_dist = dist;
                    best_k = k;
                }
            }
            // 保存类中心的 ID
            pq_base[i * M + m] = static_cast<uint8_t>(best_k); 
        }
    }
    std::cerr << "[PQ] Encoding Finished!" << std::endl;
    return pq_base;
}

#endif // PQ_TRAIN_H

#ifndef IVF_TRAIN_H
#define IVF_TRAIN_H

#include <vector>
#include <cmath>
#include <cstdlib>
#include <iostream>
#include <limits>
#include <omp.h>
#include <queue>
#include "simd_utils.h"

// 定义倒排表结构：每个房间(桶)里只存放属于这里的向量的“真实 ID”
struct IVFList {
    std::vector<int> ids; 
};

// 1. 训练 IVF 粗聚类中心 (建 1000 个房间)
inline void train_ivf(const float* base, size_t base_number, size_t vecdim, 
                      int K_ivf, std::vector<float>& ivf_centroids) {
    std::cerr << "[IVF] Training " << K_ivf << " coarse centroids (rooms)..." << std::endl;
    int max_iter = 15;

    // 随机选 1000 个人作为房间的初始中心
    for (int k = 0; k < K_ivf; ++k) {
        int rand_idx = rand() % base_number;
        for (size_t d = 0; d < vecdim; ++d) {
            ivf_centroids[k * vecdim + d] = base[rand_idx * vecdim + d];
        }
    }

    std::vector<int> assign(base_number, 0);
    std::vector<float> new_centroids(K_ivf * vecdim, 0.0f);
    std::vector<int> counts(K_ivf, 0);

    for (int iter = 0; iter < max_iter; ++iter) {
        // 多线程加速：每个人找离自己最近的房间
        #pragma omp parallel for
        for (size_t i = 0; i < base_number; ++i) {
            float min_dist = std::numeric_limits<float>::max();
            int best_k = 0;
            const float* vec = base + i * vecdim;

            for (int k = 0; k < K_ivf; ++k) {
                float dist = 0.0f;
                const float* c = ivf_centroids.data() + k * vecdim;
                for (size_t d = 0; d < vecdim; ++d) {
                    float diff = vec[d] - c[d];
                    dist += diff * diff; // L2 距离聚类
                }
                if (dist < min_dist) {
                    min_dist = dist;
                    best_k = k;
                }
            }
            assign[i] = best_k;
        }

        std::fill(new_centroids.begin(), new_centroids.end(), 0.0f);
        std::fill(counts.begin(), counts.end(), 0);

        for (size_t i = 0; i < base_number; ++i) {
            int k = assign[i];
            counts[k]++;
            const float* vec = base + i * vecdim;
            for (size_t d = 0; d < vecdim; ++d) {
                new_centroids[k * vecdim + d] += vec[d];
            }
        }

        // 更新房间位置
        for (int k = 0; k < K_ivf; ++k) {
            if (counts[k] > 0) {
                for (size_t d = 0; d < vecdim; ++d) {
                    ivf_centroids[k * vecdim + d] = new_centroids[k * vecdim + d] / counts[k];
                }
            }
        }
    }
}

// 2. 将 10万个人分发到对应的 1000 个房间里
inline std::vector<IVFList> build_ivf(const float* base, size_t base_number, size_t vecdim, 
                                      int K_ivf, const std::vector<float>& ivf_centroids) {
    std::cerr << "[IVF] Building Inverted Lists (Distributing vectors into rooms)..." << std::endl;
    std::vector<IVFList> ivf_lists(K_ivf);

    #pragma omp parallel
    {
        // 线程本地桶，防止 8 个线程抢着往同一个房间里塞人导致崩溃
        std::vector<std::vector<int>> local_lists(K_ivf);
        
        #pragma omp for nowait
        for (size_t i = 0; i < base_number; ++i) {
            float min_dist = std::numeric_limits<float>::max();
            int best_k = 0;
            const float* vec = base + i * vecdim;

            for (int k = 0; k < K_ivf; ++k) {
                float dist = 0.0f;
                const float* c = ivf_centroids.data() + k * vecdim;
                for (size_t d = 0; d < vecdim; ++d) {
                    float diff = vec[d] - c[d];
                    dist += diff * diff;
                }
                if (dist < min_dist) {
                    min_dist = dist;
                    best_k = k;
                }
            }
            local_lists[best_k].push_back(i); // 塞入本地房间
        }

        // 互斥锁：把每个线程分发好的人，统一汇入全局大房间
        #pragma omp critical
        {
            for (int k = 0; k < K_ivf; ++k) {
                ivf_lists[k].ids.insert(ivf_lists[k].ids.end(), 
                                        local_lists[k].begin(), local_lists[k].end());
            }
        }
    }
    std::cerr << "[IVF] Build Finished! 100,000 vectors successfully buckets!" << std::endl;
    return ivf_lists;
}

// // 探查最近的 15 个房间 (15 / 1000 = 只搜索底库的 1.5%)
// const size_t NPROBE = 15;     

// 探查最近的 50 个房间 (15 / 1000 = 只搜索底库的 1.5%)
// const size_t NPROBE = 50;     

// // 精排候选人数（因为范围大大缩小，250 个人足够保住召回率了）
// const size_t IVF_PQ_P = 250;  


// const size_t IVF_PQ_P = 800;  

const size_t NPROBE = 50;
const size_t IVF_PQ_P = 1500;



inline std::priority_queue<std::pair<float, int>> ivf_pq_search(
    const std::vector<float>& ivf_centroids, const std::vector<IVFList>& ivf_lists,
    const uint8_t* pq_base, const float* base, const float* query,
    size_t vecdim, size_t k,
    int M, int K_pq, const std::vector<float>& codebooks,size_t P_size) {

    int K_ivf = ivf_lists.size();

    // ----------------------------------------------------
    // 阶段 1：找最近的 nprobe 个房间 (Coarse Search)
    // ----------------------------------------------------
    std::priority_queue<std::pair<float, int>> top_buckets;
    for (int b = 0; b < K_ivf; ++b) {
        float dist = 0.0f;
        const float* c = ivf_centroids.data() + b * vecdim;
        // 计算 Query 到各个房间中心的距离
        for (size_t d = 0; d < vecdim; ++d) {
            float diff = query[d] - c[d];
            dist += diff * diff; 
        }
        if (top_buckets.size() < NPROBE) {
            top_buckets.push({dist, b});
        } else if (dist < top_buckets.top().first) {
            top_buckets.pop();
            top_buckets.push({dist, b});
        }
    }

    // 将选中的 15 个房间里所有的人，汇聚成候选人名单
    std::vector<int> candidate_ids;
    while (!top_buckets.empty()) {
        int b = top_buckets.top().second;
        top_buckets.pop();
        candidate_ids.insert(candidate_ids.end(), ivf_lists[b].ids.begin(), ivf_lists[b].ids.end());
    }

    // // ----------------------------------------------------
    // // 阶段 2：在线构建 PQ LUT (Look-Up Table)
    // // ----------------------------------------------------
    // size_t sub_dim = vecdim / M;
    // float lut[4][256];
    // for (int m = 0; m < M; ++m) {
    //     const float* sub_query = query + m * sub_dim;
    //     const float* centroids = codebooks.data() + m * K_pq * sub_dim;
    //     for (int c = 0; c < K_pq; ++c) {
    //         const float* centroid = centroids + c * sub_dim;
    //         float dot = 0.0f;
    //         for (size_t d = 0; d < sub_dim; ++d) {
    //             dot += sub_query[d] * centroid[d];
    //         }
    //         lut[m][c] = dot;
    //     }
    // }

    // ----------------------------------------------------
    // 阶段 2：在线构建 PQ LUT (跨 Centroid 并行 + SoA 布局优化)
    // ----------------------------------------------------
    size_t sub_dim = vecdim / M; // 24维
    float lut[4][256];

    for (int m = 0; m < M; ++m) {
        const float* sub_query = query + m * sub_dim;
        // 指向 SoA 布局下，第 m 个子空间的首地址 (注意：这里假设传入的 codebooks 已经是 SoA 格式)
        const float* centroids_SoA_m = codebooks.data() + m * K_pq * sub_dim; 

        // 每次同时处理 4 个聚类中心！(Cross-Centroid Parallelism)
        for (int c = 0; c < K_pq; c += 4) {
            
            // 初始化累加器，里面装的是：[中心C0的内积, 中心C1的内积, 中心C2的内积, 中心C3的内积]
            float32x4_t sum_4c = vdupq_n_f32(0.0f); 

            for (size_t d = 0; d < sub_dim; ++d) {
                // 1. 广播 Query 的第 d 维
                float32x4_t q_d = vdupq_n_f32(sub_query[d]);

                // 2. 连续加载 4 个中心的第 d 维 (SoA 布局下它们在内存中刚好连在一起！)
                const float* c_ptr = centroids_SoA_m + d * K_pq + c;
                float32x4_t c_d = vld1q_f32(c_ptr);

                // 3. 垂直乘加，彻底告别水平求和！
                sum_4c = vmlaq_f32(sum_4c, q_d, c_d);
            }

            // 24维循环跑完后，把 4 个内积结果直接存入 LUT！
            vst1q_f32(&lut[m][c], sum_4c);
        }
    }



    // // ----------------------------------------------------
    // // 阶段 3：对 candidate_ids 里的候选人进行 ADC 极速查表
    // // ----------------------------------------------------
    // std::priority_queue<std::pair<float, int>> coarse_top_p;

    // // 注意：这里只遍历那 1.5% 的候选人！算力暴降！
    // for (int idx : candidate_ids) {
    //     const uint8_t* pq_vec = pq_base + idx * M;
        
    //     // 查表，无乘法
    //     float proxy_dot = lut[0][pq_vec[0]] +
    //                       lut[1][pq_vec[1]] +
    //                       lut[2][pq_vec[2]] +
    //                       lut[3][pq_vec[3]];
    //     float proxy_dist = 1.0f - proxy_dot;

    //     if (coarse_top_p.size() < IVF_PQ_P) {
    //         coarse_top_p.push({proxy_dist, idx});
    //     } else if (proxy_dist < coarse_top_p.top().first) {
    //         coarse_top_p.pop();
    //         coarse_top_p.push({proxy_dist, idx});
    //     }
    // }

    // // ----------------------------------------------------
    // // 阶段 3：ADC 极速查表 (计算与入堆分离优化)
    // // ----------------------------------------------------
    // std::priority_queue<std::pair<float, int>> coarse_top_p;

    // size_t num_candidates = candidate_ids.size();
    
    // // 开辟一块连续内存，专门存这批人的粗排距离
    // std::vector<float> proxy_dists(num_candidates);

    // // 循环 1：纯粹的计算循环（没有任何 if 分支！）
    // // CPU 看到这种没有依赖的纯净代码，底层会自动触发最极限的预取和向量化
    // for (size_t i = 0; i < num_candidates; ++i) {
    //     int idx = candidate_ids[i];
    //     const uint8_t* pq_vec = pq_base + idx * M;
        
    //     float proxy_dot = lut[0][pq_vec[0]] + 
    //                       lut[1][pq_vec[1]] + 
    //                       lut[2][pq_vec[2]] + 
    //                       lut[3][pq_vec[3]];
    //     proxy_dists[i] = 1.0f - proxy_dot;
    // }

    // // 循环 2：纯粹的入堆循环（只做逻辑判断）
    // for (size_t i = 0; i < num_candidates; ++i) {
    //     if (coarse_top_p.size() < IVF_PQ_P) {
    //         coarse_top_p.push({proxy_dists[i], candidate_ids[i]});
    //     } else if (proxy_dists[i] < coarse_top_p.top().first) {
    //         coarse_top_p.pop();
    //         coarse_top_p.push({proxy_dists[i], candidate_ids[i]});
    //     }
    // }

    // // // 尾部处理：处理剩下除不尽的 1~3 个候选人
    // // for (size_t i=0; i < num_candidates; ++i) {
    // //     int idx = candidate_ids[i];
    // //     const uint8_t* pq_vec = pq_base + idx * M;
        
    // //     float proxy_dot = lut[0][pq_vec[0]] + lut[1][pq_vec[1]] + 
    // //                       lut[2][pq_vec[2]] + lut[3][pq_vec[3]];
    // //     float proxy_dist = 1.0f - proxy_dot;

    // //     if (coarse_top_p.size() < IVF_PQ_P) {
    // //         coarse_top_p.push({proxy_dist, idx});
    // //     } else if (proxy_dist < coarse_top_p.top().first) {
    // //         coarse_top_p.pop();
    // //         coarse_top_p.push({proxy_dist, idx});
    // //     }
    // // }


    // ----------------------------------------------------
    // 阶段 3：ADC 极速查表 (Block化缓存优化 + 计算流分离)
    // ----------------------------------------------------
    std::priority_queue<std::pair<float, int>> coarse_top_p;

    size_t num_candidates = candidate_ids.size();
    std::vector<float> proxy_dists(num_candidates);

    // 🚀【新增大招：L1 Cache Blocking 循环分块】🚀
    // L1 Data Cache 通常为 32KB。我们设定 Block Size 为 256。
    // 256 个 float (1KB) + 256 个 int (1KB)，完美契合 L1 缓存，杜绝任何 Cache Miss！
    const size_t L1_CACHE_BLOCK_SIZE = 256; 

    // 外层循环：按 Block 推进
    for (size_t block_start = 0; block_start < num_candidates; block_start += L1_CACHE_BLOCK_SIZE) {
        size_t block_end = std::min(num_candidates, block_start + L1_CACHE_BLOCK_SIZE);

        // 内层循环 1：在当前 Block 内进行纯计算 (充分利用 L1 缓存预取)
        for (size_t i = block_start; i < block_end; ++i) {
            int idx = candidate_ids[i];
            const uint8_t* pq_vec = pq_base + idx * M;
            
            float proxy_dot = lut[0][pq_vec[0]] + 
                              lut[1][pq_vec[1]] + 
                              lut[2][pq_vec[2]] + 
                              lut[3][pq_vec[3]];
            proxy_dists[i] = 1.0f - proxy_dot;
        }

        // 内层循环 2：在当前 Block 内进行入堆操作
        // 核心意义：此时 proxy_dists[block_start : block_end] 的数据还是“烫”的！
        // 它们完美驻留在 CPU 的 L1 Cache 中，入堆时的访存延迟几乎为 0！
        for (size_t i = block_start; i < block_end; ++i) {
            if (coarse_top_p.size() < P_size) {
                coarse_top_p.push({proxy_dists[i], candidate_ids[i]});
            } else if (proxy_dists[i] < coarse_top_p.top().first) {
                coarse_top_p.pop();
                coarse_top_p.push({proxy_dists[i], candidate_ids[i]});
            }
        }
    }



    // ----------------------------------------------------
    // 阶段 4：精排 (Reranking)
    // ----------------------------------------------------
    std::priority_queue<std::pair<float, int>> fine_top_k;
    while (!coarse_top_p.empty()) {
        int candidate_idx = coarse_top_p.top().second;
        coarse_top_p.pop();

        // SIMD 武器库精准打击
        float exact_dist = InnerProductSIMDNeon(query, base + candidate_idx * vecdim, vecdim);

        if (fine_top_k.size() < k) {
            fine_top_k.push({exact_dist, candidate_idx});
        } else if (exact_dist < fine_top_k.top().first) {
            fine_top_k.pop();
            fine_top_k.push({exact_dist, candidate_idx});
        }
    }

    return fine_top_k;
}


#endif // IVF_TRAIN_H
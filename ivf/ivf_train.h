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

// 定义倒排表
struct IVFList {
    std::vector<int> ids; 
};

// 1. 训练 IVF 粗聚类中心 
inline void train_ivf(const float* base, size_t base_number, size_t vecdim, 
                      int K_ivf, std::vector<float>& ivf_centroids, int num_threads = 8) {
    std::cerr << "[IVF] Training " << K_ivf << " coarse centroids (rooms) with " << num_threads << " threads..." << std::endl;
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
        #pragma omp parallel for num_threads(num_threads)
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


// 2.分发
inline std::vector<IVFList> build_ivf(const float* base, size_t base_number, size_t vecdim, 
                                      int K_ivf, const std::vector<float>& ivf_centroids, int num_threads = 8) {
    std::cerr << "[IVF] Building Inverted Lists with " << num_threads << " threads..." << std::endl;
    std::vector<IVFList> ivf_lists(K_ivf);

    // 🌟 注意：这里必须要有换行，不能把大括号放在 #pragma 同一行
    #pragma omp parallel num_threads(num_threads)    
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
// const size_t NPROBE = 15;     

// const size_t NPROBE = 50;     

// const size_t IVF_PQ_P = 250;  


// const size_t IVF_PQ_P = 800;  

// const size_t NPROBE = 50;
const size_t NPROBE = 100;


const size_t IVF_PQ_P = 1500;


// //全局PQ
// inline std::priority_queue<std::pair<float, int>> ivf_pq_search(
//     const std::vector<float>& ivf_centroids, const std::vector<IVFList>& ivf_lists,
//     const uint8_t* pq_base, const float* base, const float* query,
//     size_t vecdim, size_t k,
//     int M, int K_pq, const std::vector<float>& codebooks,size_t P_size) {

//     int K_ivf = ivf_lists.size();

//     // ----------------------------------------------------
//     // 阶段 1：找最近的 nprobe 个房间 (Coarse Search)
//     // ----------------------------------------------------
//     std::priority_queue<std::pair<float, int>> top_buckets;
//     for (int b = 0; b < K_ivf; ++b) {
//         float dist = 0.0f;
//         const float* c = ivf_centroids.data() + b * vecdim;
//         // 计算 Query 到各个房间中心的距离
//         for (size_t d = 0; d < vecdim; ++d) {
//             float diff = query[d] - c[d];
//             dist += diff * diff; 
//         }
//         if (top_buckets.size() < NPROBE) {
//             top_buckets.push({dist, b});
//         } else if (dist < top_buckets.top().first) {
//             top_buckets.pop();
//             top_buckets.push({dist, b});
//         }
//     }

//     // 将选中的 15 个房间里所有的人，汇聚成候选人名单
//     std::vector<int> candidate_ids;
//     while (!top_buckets.empty()) {
//         int b = top_buckets.top().second;
//         top_buckets.pop();
//         candidate_ids.insert(candidate_ids.end(), ivf_lists[b].ids.begin(), ivf_lists[b].ids.end());
//     }


//     // ----------------------------------------------------
//     // 阶段 2：在线构建 PQ LUT (跨 Centroid 并行 + SoA 布局优化)
//     // ----------------------------------------------------
//     size_t sub_dim = vecdim / M; // 24维
//     float lut[4][256];

//     for (int m = 0; m < M; ++m) {
//         const float* sub_query = query + m * sub_dim;
//         // 指向 SoA 布局下，第 m 个子空间的首地址 
//         const float* centroids_SoA_m = codebooks.data() + m * K_pq * sub_dim; 

//         // 每次同时处理 4 个聚类中心
//         for (int c = 0; c < K_pq; c += 4) {
            
//             // 初始化累加器：[中心C0的内积, 中心C1的内积, 中心C2的内积, 中心C3的内积]
//             float32x4_t sum_4c = vdupq_n_f32(0.0f); 

//             for (size_t d = 0; d < sub_dim; ++d) {
//                 // 1. 广播 Query 的第 d 维
//                 float32x4_t q_d = vdupq_n_f32(sub_query[d]);

//                 // 2. 连续加载 4 个中心的第 d 维
//                 const float* c_ptr = centroids_SoA_m + d * K_pq + c;
//                 float32x4_t c_d = vld1q_f32(c_ptr);

//                 // 3. 垂直乘加
//                 sum_4c = vmlaq_f32(sum_4c, q_d, c_d);
//             }

//             // 24维循环跑完后，把 4 个内积结果直接存入 LUT！
//             vst1q_f32(&lut[m][c], sum_4c);
//         }
//     }



//     // // ----------------------------------------------------
//     // // 阶段 3：ADC 极速查表 (Block化缓存优化 + 计算流分离)
//     // // ----------------------------------------------------
//     // std::priority_queue<std::pair<float, int>> coarse_top_p;

//     // size_t num_candidates = candidate_ids.size();
//     // std::vector<float> proxy_dists(num_candidates);

//     // //Cache Blocking 循环分块
//     // const size_t L1_CACHE_BLOCK_SIZE = 256; 

//     // // 外层循环：按 Block 推进
//     // for (size_t block_start = 0; block_start < num_candidates; block_start += L1_CACHE_BLOCK_SIZE) {
//     //     size_t block_end = std::min(num_candidates, block_start + L1_CACHE_BLOCK_SIZE);

//     //     // 内层循环 1：在当前 Block 内进行纯计算 (利用 L1 缓存预取)
//     //     for (size_t i = block_start; i < block_end; ++i) {
//     //         int idx = candidate_ids[i];
//     //         const uint8_t* pq_vec = pq_base + idx * M;
            
//     //         float proxy_dot = lut[0][pq_vec[0]] + 
//     //                           lut[1][pq_vec[1]] + 
//     //                           lut[2][pq_vec[2]] + 
//     //                           lut[3][pq_vec[3]];
//     //         proxy_dists[i] = 1.0f - proxy_dot;
//     //     }

//     //     // 内层循环 2：在当前 Block 内进行入堆操作
//     //     for (size_t i = block_start; i < block_end; ++i) {
//     //         if (coarse_top_p.size() < P_size) {
//     //             coarse_top_p.push({proxy_dists[i], candidate_ids[i]});
//     //         } else if (proxy_dists[i] < coarse_top_p.top().first) {
//     //             coarse_top_p.pop();
//     //             coarse_top_p.push({proxy_dists[i], candidate_ids[i]});
//     //         }
//     //     }
//     // }



//     // // ----------------------------------------------------
//     // // 阶段 4：精排 (Reranking)
//     // // ----------------------------------------------------
//     // std::priority_queue<std::pair<float, int>> fine_top_k;
//     // while (!coarse_top_p.empty()) {
//     //     int candidate_idx = coarse_top_p.top().second;
//     //     coarse_top_p.pop();

//     //     float exact_dist = InnerProductSIMDNeon(query, base + candidate_idx * vecdim, vecdim);

//     //     if (fine_top_k.size() < k) {
//     //         fine_top_k.push({exact_dist, candidate_idx});
//     //     } else if (exact_dist < fine_top_k.top().first) {
//     //         fine_top_k.pop();
//     //         fine_top_k.push({exact_dist, candidate_idx});
//     //     }
//     // }

//     // return fine_top_k;


//     // ----------------------------------------------------
//     // 阶段 3 & 4：多线程融合 (ADC极速查表 + 真实距离精排)
//     // ----------------------------------------------------
//     size_t num_candidates = candidate_ids.size();
//     std::priority_queue<std::pair<float, int>> global_fine_top_k;

//     #pragma omp parallel
//     {
//         // 每个线程私有的粗排和精排堆（彻底消除全局锁竞争）
//         std::priority_queue<std::pair<float, int>> local_coarse;
//         std::priority_queue<std::pair<float, int>> local_fine;

//         // 1. 多线程并行 ADC 查表过滤 (动态调度解决候选人分布不均)
//         #pragma omp for schedule(dynamic)
//         for (size_t i = 0; i < num_candidates; ++i) {
//             int idx = candidate_ids[i];
//             const uint8_t* pq_vec = pq_base + idx * M;
            
//             float proxy_dot = lut[0][pq_vec[0]] + lut[1][pq_vec[1]] + 
//                               lut[2][pq_vec[2]] + lut[3][pq_vec[3]];
//             float proxy_dist = 1.0f - proxy_dot;
            
//             if (local_coarse.size() < P_size) {
//                 local_coarse.push({proxy_dist, idx});
//             } else if (proxy_dist < local_coarse.top().first) {
//                 local_coarse.pop();
//                 local_coarse.push({proxy_dist, idx});
//             }
//         }

//         // 2. 局部候选人精排 (在各自线程内无缝衔接完成！)
//         while (!local_coarse.empty()) {
//             int candidate_idx = local_coarse.top().second;
//             local_coarse.pop();

//             // 重计算真实距离
//             float exact_dist = InnerProductSIMDNeon(query, base + candidate_idx * vecdim, vecdim);

//             if (local_fine.size() < k) {
//                 local_fine.push({exact_dist, candidate_idx});
//             } else if (exact_dist < local_fine.top().first) {
//                 local_fine.pop();
//                 local_fine.push({exact_dist, candidate_idx});
//             }
//         }

//         // 3. 把各线程挑出的“精锐部队”汇总到全局堆
//         #pragma omp critical
//         {
//             while (!local_fine.empty()) {
//                 global_fine_top_k.push(local_fine.top());
//                 local_fine.pop();
//             }
//         }
//     }

//     // 剔除多余元素，只留全局前 k 名
//     while (global_fine_top_k.size() > k) {
//         global_fine_top_k.pop();
//     }

//     return global_fine_top_k;



// }

//部分PQ
inline std::priority_queue<std::pair<float, int>> ivf_pq_search(
    const std::vector<float>& ivf_centroids, const std::vector<IVFList>& ivf_lists,
    const uint8_t* pq_base, const float* base, const float* query,
    size_t vecdim, size_t k,
    int M, int K_pq, const std::vector<float>& codebooks_SoA, size_t P_size) {

    int K_ivf = ivf_lists.size();

    // ----------------------------------------------------
    // 阶段 1：粗排 (寻找最近的 NPROBE 个房间)
    // ----------------------------------------------------
    std::priority_queue<std::pair<float, int>> top_buckets;
    for (int b = 0; b < K_ivf; ++b) {
        float dist = InnerProductSIMDNeon(query, ivf_centroids.data() + b * vecdim, vecdim);
        if (top_buckets.size() < NPROBE) {
            top_buckets.push({dist, b});
        } else if (dist < top_buckets.top().first) {
            top_buckets.pop();
            top_buckets.push({dist, b});
        }
    }

    std::vector<int> selected_clusters;
    while (!top_buckets.empty()) {
        selected_clusters.push_back(top_buckets.top().second);
        top_buckets.pop();
    }

    // ----------------------------------------------------
    // 阶段 2 & 3：以【簇】为单位并发处理 (计算 Query 残差 -> 建 LUT -> 查表)
    // ----------------------------------------------------
    std::priority_queue<std::pair<float, int>> global_fine_top_k;
    size_t sub_dim = vecdim / M; 

    #pragma omp parallel
    {
        std::priority_queue<std::pair<float, int>> local_coarse;
        std::priority_queue<std::pair<float, int>> local_fine;

        // 🌟 路线 2 核心：并行的粒度变成了“簇”。每个线程领到一个簇后，自己算残差、建表、搜库！
        #pragma omp for schedule(dynamic)
        for (size_t i = 0; i < selected_clusters.size(); ++i) {
            int cluster_id = selected_clusters[i];
            
            // A. 计算当前 Query 相对于这个簇中心的残差
            float q_residual[96]; // 假设 vecdim=96
            const float* c_ptr = ivf_centroids.data() + cluster_id * vecdim;
            for (size_t d = 0; d < vecdim; ++d) {
                q_residual[d] = query[d] - c_ptr[d];
            }

            // B. 针对这个簇的残差，构建专属 LUT (依然使用 SIMD + SoA 加速)
            float lut[4][256];
            for (int m = 0; m < M; ++m) {
                const float* sub_query = q_residual + m * sub_dim;
                const float* centroids_SoA_m = codebooks_SoA.data() + m * K_pq * sub_dim; 

                for (int c = 0; c < K_pq; c += 4) {
                    float32x4_t sum_4c = vdupq_n_f32(0.0f); 
                    for (size_t d = 0; d < sub_dim; ++d) {
                        float32x4_t q_d = vdupq_n_f32(sub_query[d]);
                        float32x4_t c_d = vld1q_f32(centroids_SoA_m + d * K_pq + c);
                        sum_4c = vmlaq_f32(sum_4c, q_d, c_d);
                    }
                    vst1q_f32(&lut[m][c], sum_4c);
                }
            }

            // C. ADC 查表粗排
            const auto& list = ivf_lists[cluster_id].ids;
            for (int target_id : list) {
                const uint8_t* pq_vec = pq_base + target_id * M;
                float proxy_dot = lut[0][pq_vec[0]] + lut[1][pq_vec[1]] + 
                                  lut[2][pq_vec[2]] + lut[3][pq_vec[3]];
                float proxy_dist = 1.0f - proxy_dot;
                
                if (local_coarse.size() < P_size) {
                    local_coarse.push({proxy_dist, target_id});
                } else if (proxy_dist < local_coarse.top().first) {
                    local_coarse.pop();
                    local_coarse.push({proxy_dist, target_id});
                }
            }
        } // 簇循环结束

        // 阶段 4：局部候选人精排 (算真实距离，不再用残差)
        while (!local_coarse.empty()) {
            int candidate_idx = local_coarse.top().second;
            local_coarse.pop();

            float exact_dist = InnerProductSIMDNeon(query, base + candidate_idx * vecdim, vecdim);

            if (local_fine.size() < k) {
                local_fine.push({exact_dist, candidate_idx});
            } else if (exact_dist < local_fine.top().first) {
                local_fine.pop();
                local_fine.push({exact_dist, candidate_idx});
            }
        }

        #pragma omp critical
        {
            while (!local_fine.empty()) {
                global_fine_top_k.push(local_fine.top());
                local_fine.pop();
            }
        }
    }

    while (global_fine_top_k.size() > k) {
        global_fine_top_k.pop();
    }

    return global_fine_top_k;
}

// ---------------------------------------------------------
// 2.2.1 专用：纯 IVF-SIMD 搜索逻辑 (不带 PQ)
// 包含粗排 (Coarse Search) 和精排 (Fine Search) 的并行化探究
// ---------------------------------------------------------
// inline std::priority_queue<std::pair<float, int>> ivf_simd_search(
//     const std::vector<float>& ivf_centroids,
//     const std::vector<IVFList>& ivf_lists,
//     const float* base,
//     const float* query,
//     size_t vecdim,
//     size_t k,
//     size_t nprobe) // nprobe: 要搜索的房间数量
// {
//     int K_ivf = ivf_centroids.size() / vecdim;

//     // ====================================================
//     // 阶段 1：粗排 (寻找最近的 nprobe 个房间)
//     // 探究点 A：这里如果加 #pragma omp parallel for 会是负优化！
//     // 因为 K_ivf 只有 1000，单核算完也就几十微秒，多线程调度的开销远大于计算。
//     // ====================================================
//     std::priority_queue<std::pair<float, int>> coarse_top_p;

//     // 建议：测试时可尝试把这行解开注释，看看 latency 是不是变慢了
//     // #pragma omp parallel for schedule(static)
//     for (int c = 0; c < K_ivf; ++c) {
//         float dist = InnerProductSIMDNeon(query, ivf_centroids.data() + c * vecdim, vecdim);
//         // 注意：如果是并行测试，这里需要改成局部堆 + critical 合并。
//         // 但目前串行版本直接 push 即可。
//         if (coarse_top_p.size() < nprobe) {
//             coarse_top_p.push({dist, c});
//         } else if (dist < coarse_top_p.top().first) {
//             coarse_top_p.pop();
//             coarse_top_p.push({dist, c});
//         }
//     }

//     // 提取选中的簇 ID
//     std::vector<int> selected_clusters;
//     while (!coarse_top_p.empty()) {
//         selected_clusters.push_back(coarse_top_p.top().second);
//         coarse_top_p.pop();
//     }

//     // ====================================================
//     // 阶段 2：精排 (扫描选中房间内的所有真实向量)
//     // 探究点 B：倒排表扫描并行。这里是正优化，但必须处理负载不均 (Load Imbalance)！
//     // ====================================================
//     std::priority_queue<std::pair<float, int>> global_fine_top_k;

//     #pragma omp parallel
//     {
//         // 每个线程维护一个私有的 Top-K 堆，实现无锁并发计算
//         std::priority_queue<std::pair<float, int>> local_fine_top_k;

//         // 🌟 核心高分点：schedule(dynamic)
//         // 为什么不用 static？因为不同房间里的人数（向量数量）差异极大！
//         // 用 static 会导致分配到“大房间”的线程累死，分配到“小房间”的线程早早空转。
//          #pragma omp for schedule(dynamic)
//         //#pragma omp for schedule(static)
//         for (size_t i = 0; i < selected_clusters.size(); ++i) {
//             int cluster_id = selected_clusters[i];
//             const auto& list = ivf_lists[cluster_id].ids;

//             // 遍历这个房间里的所有向量，算真实距离
//             for (int target_id : list) {
//                 float exact_dist = InnerProductSIMDNeon(query, base + target_id * vecdim, vecdim);
//                 if (local_fine_top_k.size() < k) {
//                     local_fine_top_k.push({exact_dist, target_id});
//                 } else if (exact_dist < local_fine_top_k.top().first) {
//                     local_fine_top_k.pop();
//                     local_fine_top_k.push({exact_dist, target_id});
//                 }
//             }
//         }

//         // 所有线程算完后，通过互斥锁把精锐部队倒进全局大堆
//         #pragma omp critical
//         {
//             while (!local_fine_top_k.empty()) {
//                 global_fine_top_k.push(local_fine_top_k.top());
//                 local_fine_top_k.pop();
//             }
//         }
//     }

//     // 剔除掉多余的元素，只保留全局前 k 个
//     while (global_fine_top_k.size() > k) {
//         global_fine_top_k.pop();
//     }

//     return global_fine_top_k;
// }

// 粗排探索
// ---------------------------------------------------------
// 2.2.1 专用：纯 IVF-SIMD 搜索逻辑 (不带 PQ)
// 包含粗排 (Coarse Search) 和精排 (Fine Search) 的并行化探究
// ---------------------------------------------------------
inline std::priority_queue<std::pair<float, int>> ivf_simd_search(
    const std::vector<float>& ivf_centroids,
    const std::vector<IVFList>& ivf_lists,
    const float* base,
    const float* query,
    size_t vecdim,
    size_t k,
    size_t nprobe) // nprobe: 要搜索的房间数量
{
    int K_ivf = ivf_centroids.size() / vecdim;

    // ====================================================
    // 阶段 1：粗排 (簇中心并行 - 故意引入负优化探究)
    // 探究点 A：这里加了 #pragma omp parallel，多线程调度和抢锁开销将远大于计算收益。
    // ====================================================
    std::priority_queue<std::pair<float, int>> global_coarse_top_p;

    // 🌟 开启粗排阶段的簇中心并行！
    #pragma omp parallel
    {
        // 线程私有的局部堆
        std::priority_queue<std::pair<float, int>> local_coarse;

        #pragma omp for schedule(static)
        for (int c = 0; c < K_ivf; ++c) {
            // 计算 Query 到当前簇中心的距离 (仅几十微秒的计算量)
            float dist = InnerProductSIMDNeon(query, ivf_centroids.data() + c * vecdim, vecdim);
            
            if (local_coarse.size() < nprobe) {
                local_coarse.push({dist, c});
            } else if (dist < local_coarse.top().first) {
                local_coarse.pop();
                local_coarse.push({dist, c});
            }
        }

        // 抢锁合并到全局堆 (几十个/上百个线程在这里排队，引发严重开销)
        #pragma omp critical
        {
            while (!local_coarse.empty()) {
                global_coarse_top_p.push(local_coarse.top());
                local_coarse.pop();
            }
        }
    }

    // 剔除全局堆中多余的元素，确保只留下 nprobe 个
    while (global_coarse_top_p.size() > nprobe) {
        global_coarse_top_p.pop();
    }

    // 提取选中的簇 ID
    std::vector<int> selected_clusters;
    while (!global_coarse_top_p.empty()) {
        selected_clusters.push_back(global_coarse_top_p.top().second);
        global_coarse_top_p.pop();
    }

    // ====================================================
    // 阶段 2：精排 (扫描选中房间内的所有真实向量)
    // 探究点 B：倒排表扫描并行 (正向优化)。
    // ====================================================
    std::priority_queue<std::pair<float, int>> global_fine_top_k;

    #pragma omp parallel
    {
        // 每个线程维护一个私有的 Top-K 堆，实现无锁并发计算
        std::priority_queue<std::pair<float, int>> local_fine_top_k;

        // 🌟 核心高分点：schedule(dynamic) 解决倒排表长度极度不均匀的问题
        #pragma omp for schedule(dynamic)
        for (size_t i = 0; i < selected_clusters.size(); ++i) {
            int cluster_id = selected_clusters[i];
            const auto& list = ivf_lists[cluster_id].ids;

            // 遍历这个房间里的所有向量，算真实距离
            for (int target_id : list) {
                float exact_dist = InnerProductSIMDNeon(query, base + target_id * vecdim, vecdim);
                if (local_fine_top_k.size() < k) {
                    local_fine_top_k.push({exact_dist, target_id});
                } else if (exact_dist < local_fine_top_k.top().first) {
                    local_fine_top_k.pop();
                    local_fine_top_k.push({exact_dist, target_id});
                }
            }
        }

        // 所有线程算完后，通过互斥锁把精锐部队倒进全局大堆
        #pragma omp critical
        {
            while (!local_fine_top_k.empty()) {
                global_fine_top_k.push(local_fine_top_k.top());
                local_fine_top_k.pop();
            }
        }
    }

    // 剔除掉多余的元素，只保留全局前 k 个
    while (global_fine_top_k.size() > k) {
        global_fine_top_k.pop();
    }

    return global_fine_top_k;
}




#endif // IVF_TRAIN_H



// #ifndef IVF_TRAIN_H
// #define IVF_TRAIN_H

// #include <vector>
// #include <cmath>
// #include <cstdlib>
// #include <iostream>
// #include <limits>
// #include <omp.h>
// #include <queue>
// #include "simd_utils.h"

// // 定义倒排表
// struct IVFList {
//     std::vector<int> ids; 
// };

// // 1. 训练 IVF 粗聚类中心 
// inline void train_ivf(const float* base, size_t base_number, size_t vecdim, 
//                       int K_ivf, std::vector<float>& ivf_centroids) {
//     std::cerr << "[IVF] Training " << K_ivf << " coarse centroids (rooms)..." << std::endl;
//     int max_iter = 15;

//     // 随机选 1000 个人作为房间的初始中心
//     for (int k = 0; k < K_ivf; ++k) {
//         int rand_idx = rand() % base_number;
//         for (size_t d = 0; d < vecdim; ++d) {
//             ivf_centroids[k * vecdim + d] = base[rand_idx * vecdim + d];
//         }
//     }

//     std::vector<int> assign(base_number, 0);
//     std::vector<float> new_centroids(K_ivf * vecdim, 0.0f);
//     std::vector<int> counts(K_ivf, 0);

//     for (int iter = 0; iter < max_iter; ++iter) {
//         // 多线程加速：每个人找离自己最近的房间
//         #pragma omp parallel for
//         for (size_t i = 0; i < base_number; ++i) {
//             float min_dist = std::numeric_limits<float>::max();
//             int best_k = 0;
//             const float* vec = base + i * vecdim;

//             for (int k = 0; k < K_ivf; ++k) {
//                 float dist = 0.0f;
//                 const float* c = ivf_centroids.data() + k * vecdim;
//                 for (size_t d = 0; d < vecdim; ++d) {
//                     float diff = vec[d] - c[d];
//                     dist += diff * diff; // L2 距离聚类
//                 }
//                 if (dist < min_dist) {
//                     min_dist = dist;
//                     best_k = k;
//                 }
//             }
//             assign[i] = best_k;
//         }

//         std::fill(new_centroids.begin(), new_centroids.end(), 0.0f);
//         std::fill(counts.begin(), counts.end(), 0);

//         for (size_t i = 0; i < base_number; ++i) {
//             int k = assign[i];
//             counts[k]++;
//             const float* vec = base + i * vecdim;
//             for (size_t d = 0; d < vecdim; ++d) {
//                 new_centroids[k * vecdim + d] += vec[d];
//             }
//         }

//         // 更新房间位置
//         for (int k = 0; k < K_ivf; ++k) {
//             if (counts[k] > 0) {
//                 for (size_t d = 0; d < vecdim; ++d) {
//                     ivf_centroids[k * vecdim + d] = new_centroids[k * vecdim + d] / counts[k];
//                 }
//             }
//         }
//     }
// }

// // 2.分发
// inline std::vector<IVFList> build_ivf(const float* base, size_t base_number, size_t vecdim, 
//                                       int K_ivf, const std::vector<float>& ivf_centroids) {
//     std::cerr << "[IVF] Building Inverted Lists (Distributing vectors into rooms)..." << std::endl;
//     std::vector<IVFList> ivf_lists(K_ivf);

//     #pragma omp parallel
//     {
//         // 线程本地桶，防止 8 个线程抢着往同一个房间里塞人导致崩溃
//         std::vector<std::vector<int>> local_lists(K_ivf);
        
//         #pragma omp for nowait
//         for (size_t i = 0; i < base_number; ++i) {
//             float min_dist = std::numeric_limits<float>::max();
//             int best_k = 0;
//             const float* vec = base + i * vecdim;

//             for (int k = 0; k < K_ivf; ++k) {
//                 float dist = 0.0f;
//                 const float* c = ivf_centroids.data() + k * vecdim;
//                 for (size_t d = 0; d < vecdim; ++d) {
//                     float diff = vec[d] - c[d];
//                     dist += diff * diff;
//                 }
//                 if (dist < min_dist) {
//                     min_dist = dist;
//                     best_k = k;
//                 }
//             }
//             local_lists[best_k].push_back(i); // 塞入本地房间
//         }

//         // 互斥锁：把每个线程分发好的人，统一汇入全局大房间
//         #pragma omp critical
//         {
//             for (int k = 0; k < K_ivf; ++k) {
//                 ivf_lists[k].ids.insert(ivf_lists[k].ids.end(), 
//                                         local_lists[k].begin(), local_lists[k].end());
//             }
//         }
//     }
//     std::cerr << "[IVF] Build Finished! 100,000 vectors successfully buckets!" << std::endl;
//     return ivf_lists;
// }

// // const size_t NPROBE = 15;     

// // const size_t NPROBE = 50;     

// // const size_t IVF_PQ_P = 250;  


// // const size_t IVF_PQ_P = 800;  

// const size_t NPROBE = 50;
// const size_t IVF_PQ_P = 1500;



// inline std::priority_queue<std::pair<float, int>> ivf_pq_search(
//     const std::vector<float>& ivf_centroids, const std::vector<IVFList>& ivf_lists,
//     const uint8_t* pq_base, const float* base, const float* query,
//     size_t vecdim, size_t k,
//     int M, int K_pq, const std::vector<float>& codebooks,size_t P_size) {

//     int K_ivf = ivf_lists.size();

//     // ----------------------------------------------------
//     // 阶段 1：找最近的 nprobe 个房间 (Coarse Search)
//     // ----------------------------------------------------
//     std::priority_queue<std::pair<float, int>> top_buckets;
//     for (int b = 0; b < K_ivf; ++b) {
//         float dist = 0.0f;
//         const float* c = ivf_centroids.data() + b * vecdim;
//         // 计算 Query 到各个房间中心的距离
//         for (size_t d = 0; d < vecdim; ++d) {
//             float diff = query[d] - c[d];
//             dist += diff * diff; 
//         }
//         if (top_buckets.size() < NPROBE) {
//             top_buckets.push({dist, b});
//         } else if (dist < top_buckets.top().first) {
//             top_buckets.pop();
//             top_buckets.push({dist, b});
//         }
//     }

//     // 将选中的 15 个房间里所有的人，汇聚成候选人名单
//     std::vector<int> candidate_ids;
//     while (!top_buckets.empty()) {
//         int b = top_buckets.top().second;
//         top_buckets.pop();
//         candidate_ids.insert(candidate_ids.end(), ivf_lists[b].ids.begin(), ivf_lists[b].ids.end());
//     }


//     // ----------------------------------------------------
//     // 阶段 2：在线构建 PQ LUT (跨 Centroid 并行 + SoA 布局优化)
//     // ----------------------------------------------------
//     size_t sub_dim = vecdim / M; // 24维
//     float lut[4][256];

//     for (int m = 0; m < M; ++m) {
//         const float* sub_query = query + m * sub_dim;
//         // 指向 SoA 布局下，第 m 个子空间的首地址 
//         const float* centroids_SoA_m = codebooks.data() + m * K_pq * sub_dim; 

//         // 每次同时处理 4 个聚类中心
//         for (int c = 0; c < K_pq; c += 4) {
            
//             // 初始化累加器：[中心C0的内积, 中心C1的内积, 中心C2的内积, 中心C3的内积]
//             float32x4_t sum_4c = vdupq_n_f32(0.0f); 

//             for (size_t d = 0; d < sub_dim; ++d) {
//                 // 1. 广播 Query 的第 d 维
//                 float32x4_t q_d = vdupq_n_f32(sub_query[d]);

//                 // 2. 连续加载 4 个中心的第 d 维
//                 const float* c_ptr = centroids_SoA_m + d * K_pq + c;
//                 float32x4_t c_d = vld1q_f32(c_ptr);

//                 // 3. 垂直乘加
//                 sum_4c = vmlaq_f32(sum_4c, q_d, c_d);
//             }

//             // 24维循环跑完后，把 4 个内积结果直接存入 LUT！
//             vst1q_f32(&lut[m][c], sum_4c);
//         }
//     }



//     // ----------------------------------------------------
//     // 阶段 3：ADC 极速查表 (Block化缓存优化 + 计算流分离)
//     // ----------------------------------------------------
//     std::priority_queue<std::pair<float, int>> coarse_top_p;

//     size_t num_candidates = candidate_ids.size();
//     std::vector<float> proxy_dists(num_candidates);

//     //Cache Blocking 循环分块
//     const size_t L1_CACHE_BLOCK_SIZE = 256; 

//     // 外层循环：按 Block 推进
//     for (size_t block_start = 0; block_start < num_candidates; block_start += L1_CACHE_BLOCK_SIZE) {
//         size_t block_end = std::min(num_candidates, block_start + L1_CACHE_BLOCK_SIZE);

//         // 内层循环 1：在当前 Block 内进行纯计算 (利用 L1 缓存预取)
//         for (size_t i = block_start; i < block_end; ++i) {
//             int idx = candidate_ids[i];
//             const uint8_t* pq_vec = pq_base + idx * M;
            
//             float proxy_dot = lut[0][pq_vec[0]] + 
//                               lut[1][pq_vec[1]] + 
//                               lut[2][pq_vec[2]] + 
//                               lut[3][pq_vec[3]];
//             proxy_dists[i] = 1.0f - proxy_dot;
//         }

//         // 内层循环 2：在当前 Block 内进行入堆操作
//         for (size_t i = block_start; i < block_end; ++i) {
//             if (coarse_top_p.size() < P_size) {
//                 coarse_top_p.push({proxy_dists[i], candidate_ids[i]});
//             } else if (proxy_dists[i] < coarse_top_p.top().first) {
//                 coarse_top_p.pop();
//                 coarse_top_p.push({proxy_dists[i], candidate_ids[i]});
//             }
//         }
//     }



//     // ----------------------------------------------------
//     // 阶段 4：精排 (Reranking)
//     // ----------------------------------------------------
//     std::priority_queue<std::pair<float, int>> fine_top_k;
//     while (!coarse_top_p.empty()) {
//         int candidate_idx = coarse_top_p.top().second;
//         coarse_top_p.pop();

//         float exact_dist = InnerProductSIMDNeon(query, base + candidate_idx * vecdim, vecdim);

//         if (fine_top_k.size() < k) {
//             fine_top_k.push({exact_dist, candidate_idx});
//         } else if (exact_dist < fine_top_k.top().first) {
//             fine_top_k.pop();
//             fine_top_k.push({exact_dist, candidate_idx});
//         }
//     }

//     return fine_top_k;
// }

// // ---------------------------------------------------------
// // 2.2.1 专用：纯 IVF-SIMD 搜索逻辑 (串行化，为外部 Query 并行做准备)
// // ---------------------------------------------------------
// inline std::priority_queue<std::pair<float, int>> ivf_simd_search(
//     const std::vector<float>& ivf_centroids,
//     const std::vector<IVFList>& ivf_lists,
//     const float* base,
//     const float* query,
//     size_t vecdim,
//     size_t k,
//     size_t nprobe) 
// {
//     int K_ivf = ivf_centroids.size() / vecdim;

//     // ====================================================
//     // 阶段 1：粗排 (串行)
//     // ====================================================
//     std::priority_queue<std::pair<float, int>> coarse_top_p;

//     for (int c = 0; c < K_ivf; ++c) {
//         float dist = InnerProductSIMDNeon(query, ivf_centroids.data() + c * vecdim, vecdim);
//         if (coarse_top_p.size() < nprobe) {
//             coarse_top_p.push({dist, c});
//         } else if (dist < coarse_top_p.top().first) {
//             coarse_top_p.pop();
//             coarse_top_p.push({dist, c});
//         }
//     }

//     std::vector<int> selected_clusters;
//     while (!coarse_top_p.empty()) {
//         selected_clusters.push_back(coarse_top_p.top().second);
//         coarse_top_p.pop();
//     }

//     // ====================================================
//     // 阶段 2：精排 (串行，直接入全局堆，无需锁)
//     // ====================================================
//     std::priority_queue<std::pair<float, int>> global_fine_top_k;

//     for (size_t i = 0; i < selected_clusters.size(); ++i) {
//         int cluster_id = selected_clusters[i];
//         const auto& list = ivf_lists[cluster_id].ids;

//         for (int target_id : list) {
//             float exact_dist = InnerProductSIMDNeon(query, base + target_id * vecdim, vecdim);
//             if (global_fine_top_k.size() < k) {
//                 global_fine_top_k.push({exact_dist, target_id});
//             } else if (exact_dist < global_fine_top_k.top().first) {
//                 global_fine_top_k.pop();
//                 global_fine_top_k.push({exact_dist, target_id});
//             }
//         }
//     }

//     return global_fine_top_k;
// }

// #endif // IVF_TRAIN_H
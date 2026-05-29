#include <unistd.h>
#include <vector>
#include <cstring>
#include <string>
#include <iostream>
#include <fstream>
#include <set>
#include <chrono>
#include <iomanip>
#include <sstream>
#include <sys/time.h>
#include "hnswlib/hnswlib/hnswlib.h"

#include <arm_neon.h>
#include <queue>

// ==========================================
// 自定义核心算法头文件
// ==========================================
#include "hnswlib/hnswlib/simd_utils.h"   
#include "hnswlib/hnswlib/ivf_train.h"    

using namespace hnswlib;

// ==========================================
// 辅助函数定义
// ==========================================
template<typename T>
T *LoadData(std::string data_path, size_t& n, size_t& d) {
    std::ifstream fin;
    fin.open(data_path, std::ios::in | std::ios::binary);
    fin.read((char*)&n,4);
    fin.read((char*)&d,4);
    T* data = new T[n*d];
    int sz = sizeof(T);
    for(int i = 0; i < n; ++i){
        fin.read(((char*)data + i*d*sz), d*sz);
    }
    fin.close();
    std::cerr << "load data " << data_path << "\n";
    return data;
}

// 🌟 核心算法：IVF-SIMD 纯串行单核 Baseline
inline std::priority_queue<std::pair<float, int>> ivf_simd_baseline_search(
    const std::vector<float>& ivf_centroids,
    const std::vector<IVFList>& ivf_lists,
    const float* base,
    const float* query,
    size_t vecdim,
    size_t k,
    int nprobe)
{
    // ==========================================
    // 阶段 1：粗排 (Coarse Ranking)
    // ==========================================
    std::priority_queue<std::pair<float, int>> top_centroids;
    int K_ivf = ivf_centroids.size() / vecdim;

    for (int c = 0; c < K_ivf; ++c) {
        float dist = InnerProductSIMDNeon(query, ivf_centroids.data() + c * vecdim, vecdim);
        
        if (top_centroids.size() < nprobe) {
            top_centroids.push({dist, c});
        } else if (dist < top_centroids.top().first) {
            top_centroids.pop();
            top_centroids.push({dist, c});
        }
    }

    // 提取选中的前 nprobe 个聚类中心 ID
    std::vector<int> target_centroids;
    while (!top_centroids.empty()) {
        target_centroids.push_back(top_centroids.top().second);
        top_centroids.pop();
    }

    // ==========================================
    // 阶段 2：精排 (Fine Ranking / 扫描倒排链表)
    // ==========================================
    std::priority_queue<std::pair<float, int>> global_topk;

    // 遍历选中的簇
    for (int centroid_idx : target_centroids) {
        const auto& list = ivf_lists[centroid_idx];
        
        // 遍历该簇下的所有原向量
        for (int global_vec_idx : list.ids) {
            const float* current_base = base + global_vec_idx * vecdim;
            float exact_dist = InnerProductSIMDNeon(query, current_base, vecdim);

            if (global_topk.size() < k) {
                global_topk.push({exact_dist, global_vec_idx});
            } else if (exact_dist < global_topk.top().first) {
                global_topk.pop();
                global_topk.push({exact_dist, global_vec_idx});
            }
        }
    }

    return global_topk;
}

// ==========================================
// 主函数
// ==========================================
int main(int argc, char *argv[])
{
    int ALGO_MODE = 3; // 锁死为 3，代表 IVF-SIMD Baseline
    
    size_t test_number = 0, base_number = 0;
    size_t test_gt_d = 0, vecdim = 0;

    std::string data_path = "/anndata/"; 
    auto test_query = LoadData<float>(data_path + "DEEP100K.query.fbin", test_number, vecdim);
    auto test_gt = LoadData<int>(data_path + "DEEP100K.gt.query.100k.top100.bin", test_number, test_gt_d);
    auto base = LoadData<float>(data_path + "DEEP100K.base.100k.fbin", base_number, vecdim);
    
    test_number = 10000;
    const size_t k = 10;
    int nprobe = 50; // 默认探测 50 个簇
    int K_ivf = 1000; // 默认 1000 个聚类中心

    // ==========================================
    // IVF 离线构建阶段
    // ==========================================
    std::vector<float> ivf_centroids(K_ivf * vecdim, 0.0f);
    std::cerr << "[IVF] Training " << K_ivf << " centroids...\n";
    train_ivf(base, base_number, vecdim, K_ivf, ivf_centroids);
    
    std::cerr << "[IVF] Building inverted lists...\n";
    auto ivf_lists = build_ivf(base, base_number, vecdim, K_ivf, ivf_centroids);

    std::cerr << "\n[Test] Starting Experiment Mode: " << ALGO_MODE << " (IVF-SIMD Single Core Baseline)\n";

    if (ALGO_MODE == 3) {
        std::cout << "\n=========================================================\n";
        std::cout << "🚀 IVF-SIMD 单核串行 Baseline 测试 (K="<< K_ivf << ", nprobe=" << nprobe << ")\n";
        std::cout << "| Threads  | Avg Latency (us)   | Avg Recall   |\n";
        std::cout << "---------------------------------------------------------\n";

        // Baseline 只测单核，不测多线程
        std::vector<int> thread_counts = {1}; 

        for (int threads : thread_counts) {
            float avg_recall = 0;
            int64_t total_latency = 0;

            for(int i = 0; i < test_number; ++i) {
                const unsigned long Converter = 1000 * 1000;
                struct timeval start_val, end_val;
                gettimeofday(&start_val, NULL);

                // 调用核心算法 (纯单核)
                auto res = ivf_simd_baseline_search(ivf_centroids, ivf_lists, base, test_query + i * vecdim, vecdim, k, nprobe);

                gettimeofday(&end_val, NULL);
                total_latency += (end_val.tv_sec * Converter + end_val.tv_usec) - (start_val.tv_sec * Converter + start_val.tv_usec);

                // 计算 Recall
                std::set<uint32_t> gtset;
                for(int j = 0; j < k; ++j){
                    gtset.insert(test_gt[j + i*test_gt_d]);
                }
                size_t acc = 0;
                while (res.size()) {   
                    if(gtset.find(res.top().second) != gtset.end()) {
                        ++acc;
                    }
                    res.pop();
                }
                avg_recall += (float)acc/k;
            }

            std::cout << "| " << threads << " core   | " 
                      << total_latency / test_number << "             | " 
                      << avg_recall / test_number << "      |\n";
        }
        std::cout << "=========================================================\n";
    }

    return 0;
}

/*
实验结果
[s2412351@master_ubss1 ann]$ bash test.sh 2 1
Submitted job with ID: 18691.master_ubss1
[1] 20:43:05 [SUCCESS] master_ubss2

Authorized users only. All activities may be monitored and reported.

Authorized users only. All activities may be monitored and reported.
[1] 20:43:07 [SUCCESS] master_ubss2
load data /anndata/DEEP100K.query.fbin
load data /anndata/DEEP100K.gt.query.100k.top100.bin
load data /anndata/DEEP100K.base.100k.fbin
[IVF] Training 1000 centroids...
[IVF] Training 1000 coarse centroids (rooms)...
[IVF] Building inverted lists...
[IVF] Building Inverted Lists (Distributing vectors into rooms)...
[IVF] Build Finished! 100,000 vectors successfully buckets!

[Test] Starting Experiment Mode: 3 (IVF-SIMD Single Core Baseline)

=========================================================
🚀 IVF-SIMD 单核串行 Baseline 测试 (K=1000, nprobe=50)
| Threads  | Avg Latency (us)   | Avg Recall   |
---------------------------------------------------------
| 1 core   | 795             | 0.97884      |
=========================================================

Authorized users only. All activities may be monitored and reported.

=========================================================

 Performance counter stats for './main':

   621,390,176,610      cpu-cycles:u                                                
 1,102,258,573,389      instructions:u            #    1.77  insn per cycle         
   311,998,970,507      L1-dcache-loads:u                                           
     4,673,709,613      L1-dcache-load-misses:u   #    1.50% of all L1-dcache accesses
     2,019,826,177      LLC-loads:u                                                 
       258,650,191      LLC-load-misses:u         #   12.81% of all LL-cache accesses

      38.538287640 seconds time elapsed

     241.757666000 seconds user
       0.343616000 seconds sys

*/


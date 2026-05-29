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
#include <omp.h>
#include "hnswlib/hnswlib/hnswlib.h"

#include <arm_neon.h>
#include <queue>

// ==========================================
// 自定义核心算法头文件
// ==========================================
#include "hnswlib/hnswlib/simd_utils.h"   
#include "hnswlib/hnswlib/ivf_train.h"    

using namespace hnswlib;

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
    return data;
}

// ===================================================================
// 尝试 1：粗排 (Centroid) 并行
// ===================================================================
inline std::priority_queue<std::pair<float, int>> search_attempt1_coarse_parallel(
    const std::vector<float>& ivf_centroids, const std::vector<IVFList>& ivf_lists,
    const float* base, const float* query, size_t vecdim, size_t k, int nprobe)
{
    int K_ivf = ivf_centroids.size() / vecdim;
    std::priority_queue<std::pair<float, int>> top_centroids;

    // 🔴 仅在粗排计算 1000 个簇中心时开启并行
    #pragma omp parallel
    {
        std::priority_queue<std::pair<float, int>> local_coarse;
        #pragma omp for schedule(static)
        for (int c = 0; c < K_ivf; ++c) {
            float dist = InnerProductSIMDNeon(query, ivf_centroids.data() + c * vecdim, vecdim);
            if (local_coarse.size() < nprobe) {
                local_coarse.push({dist, c});
            } else if (dist < local_coarse.top().first) {
                local_coarse.pop();
                local_coarse.push({dist, c});
            }
        }
        #pragma omp critical
        {
            while (!local_coarse.empty()) {
                top_centroids.push(local_coarse.top());
                local_coarse.pop();
            }
        }
    }
    while (top_centroids.size() > nprobe) top_centroids.pop();

    std::vector<int> target_centroids;
    while (!top_centroids.empty()) {
        target_centroids.push_back(top_centroids.top().second);
        top_centroids.pop();
    }

    // 精排保持串行
    std::priority_queue<std::pair<float, int>> global_topk;
    for (int centroid_idx : target_centroids) {
        const auto& list = ivf_lists[centroid_idx];
        for (int global_vec_idx : list.ids) {
            float exact_dist = InnerProductSIMDNeon(query, base + global_vec_idx * vecdim, vecdim);
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

// ===================================================================
// 尝试 2：精排 (Cluster) 簇划分并行 (使用 dynamic 动态调度)
// ===================================================================
inline std::priority_queue<std::pair<float, int>> search_attempt2_fine_parallel(
    const std::vector<float>& ivf_centroids, const std::vector<IVFList>& ivf_lists,
    const float* base, const float* query, size_t vecdim, size_t k, int nprobe)
{
    // 粗排保持串行
    int K_ivf = ivf_centroids.size() / vecdim;
    std::priority_queue<std::pair<float, int>> top_centroids;
    for (int c = 0; c < K_ivf; ++c) {
        float dist = InnerProductSIMDNeon(query, ivf_centroids.data() + c * vecdim, vecdim);
        if (top_centroids.size() < nprobe) top_centroids.push({dist, c});
        else if (dist < top_centroids.top().first) {
            top_centroids.pop(); top_centroids.push({dist, c});
        }
    }
    std::vector<int> target_centroids;
    while (!top_centroids.empty()) {
        target_centroids.push_back(top_centroids.top().second);
        top_centroids.pop();
    }

    std::priority_queue<std::pair<float, int>> global_topk;

    // 🟢 针对精排进行并行！指导书重点：簇大小不均匀，必须用 dynamic 调度！
    #pragma omp parallel
    {
        std::priority_queue<std::pair<float, int>> local_topk;
        
        #pragma omp for schedule(dynamic, 1)
        for (size_t i = 0; i < target_centroids.size(); ++i) {
            int centroid_idx = target_centroids[i];
            const auto& list = ivf_lists[centroid_idx];
            for (int global_vec_idx : list.ids) {
                float exact_dist = InnerProductSIMDNeon(query, base + global_vec_idx * vecdim, vecdim);
                if (local_topk.size() < k) local_topk.push({exact_dist, global_vec_idx});
                else if (exact_dist < local_topk.top().first) {
                    local_topk.pop(); local_topk.push({exact_dist, global_vec_idx});
                }
            }
        }
        
        #pragma omp critical
        {
            while (!local_topk.empty()) {
                global_topk.push(local_topk.top());
                local_topk.pop();
                if (global_topk.size() > k) global_topk.pop();
            }
        }
    }
    return global_topk;
}

// Baseline 纯串行函数 (给尝试3提供底层支持)
inline std::priority_queue<std::pair<float, int>> serial_baseline(
    const std::vector<float>& ivf_centroids, const std::vector<IVFList>& ivf_lists,
    const float* base, const float* query, size_t vecdim, size_t k, int nprobe) {
    int K_ivf = ivf_centroids.size() / vecdim;
    std::priority_queue<std::pair<float, int>> tc;
    for (int c=0; c<K_ivf; ++c) {
        float d = InnerProductSIMDNeon(query, ivf_centroids.data()+c*vecdim, vecdim);
        if(tc.size()<nprobe) tc.push({d,c});
        else if(d<tc.top().first) { tc.pop(); tc.push({d,c}); }
    }
    std::vector<int> tcs;
    while(!tc.empty()) { tcs.push_back(tc.top().second); tc.pop(); }

    std::priority_queue<std::pair<float, int>> gk;
    for (int c : tcs) {
        for (int id : ivf_lists[c].ids) {
            float d = InnerProductSIMDNeon(query, base+id*vecdim, vecdim);
            if(gk.size()<k) gk.push({d,id});
            else if(d<gk.top().first) { gk.pop(); gk.push({d,id}); }
        }
    }
    return gk;
}

// ==========================================
// 主函数
// ==========================================
int main(int argc, char *argv[])
{
    size_t test_number = 0, base_number = 0;
    size_t test_gt_d = 0, vecdim = 0;
    std::string data_path = "/anndata/"; 
    auto test_query = LoadData<float>(data_path + "DEEP100K.query.fbin", test_number, vecdim);
    auto test_gt = LoadData<int>(data_path + "DEEP100K.gt.query.100k.top100.bin", test_number, test_gt_d);
    auto base = LoadData<float>(data_path + "DEEP100K.base.100k.fbin", base_number, vecdim);
    
    test_number = 10000;
    const size_t k = 10;
    int nprobe = 50; 
    int K_ivf = 1000; 

    std::vector<float> ivf_centroids(K_ivf * vecdim, 0.0f);
    train_ivf(base, base_number, vecdim, K_ivf, ivf_centroids);
    auto ivf_lists = build_ivf(base, base_number, vecdim, K_ivf, ivf_centroids);

    std::vector<int> thread_counts = {1, 2, 4, 8};

    std::cout << "\n=========================================================\n";
    std::cout << "🗡️ 尝试 1: 单 Query 【粗排】簇中心并行 (Expected: Negative)\n";
    std::cout << "| Threads  | Avg Latency (us)   | Avg Recall   |\n";
    std::cout << "---------------------------------------------------------\n";
    for (int threads : thread_counts) {
        omp_set_num_threads(threads);
        float avg_recall = 0; int64_t total_latency = 0;
        for(int i = 0; i < test_number; ++i) {
            struct timeval s, e; gettimeofday(&s, NULL);
            auto res = search_attempt1_coarse_parallel(ivf_centroids, ivf_lists, base, test_query + i * vecdim, vecdim, k, nprobe);
            gettimeofday(&e, NULL);
            total_latency += (e.tv_sec*1000000 + e.tv_usec) - (s.tv_sec*1000000 + s.tv_usec);
            
            std::set<uint32_t> gt; for(int j=0; j<k; ++j) gt.insert(test_gt[j+i*test_gt_d]);
            size_t acc = 0; while(res.size()) { if(gt.find(res.top().second) != gt.end()) ++acc; res.pop(); }
            avg_recall += (float)acc/k;
        }
        std::cout << "| " << threads << " core   | " << std::setw(18) << std::left << total_latency / test_number << " | " << avg_recall / test_number << "      |\n";
    }

    std::cout << "\n=========================================================\n";
    std::cout << "🗡️ 尝试 2: 单 Query 【精排】簇划分并行 (dynamic 调度)\n";
    std::cout << "| Threads  | Avg Latency (us)   | Avg Recall   |\n";
    std::cout << "---------------------------------------------------------\n";
    for (int threads : thread_counts) {
        omp_set_num_threads(threads);
        float avg_recall = 0; int64_t total_latency = 0;
        for(int i = 0; i < test_number; ++i) {
            struct timeval s, e; gettimeofday(&s, NULL);
            auto res = search_attempt2_fine_parallel(ivf_centroids, ivf_lists, base, test_query + i * vecdim, vecdim, k, nprobe);
            gettimeofday(&e, NULL);
            total_latency += (e.tv_sec*1000000 + e.tv_usec) - (s.tv_sec*1000000 + s.tv_usec);
            
            std::set<uint32_t> gt; for(int j=0; j<k; ++j) gt.insert(test_gt[j+i*test_gt_d]);
            size_t acc = 0; while(res.size()) { if(gt.find(res.top().second) != gt.end()) ++acc; res.pop(); }
            avg_recall += (float)acc/k;
        }
        std::cout << "| " << threads << " core   | " << std::setw(18) << std::left << total_latency / test_number << " | " << avg_recall / test_number << "      |\n";
    }

    std::cout << "\n=========================================================\n";
    std::cout << "🗡️ 尝试 3: Query 级大满贯并行 (Batch 并发)\n";
    std::cout << "| Threads  | Avg Latency (us)   | Avg Recall   |\n";
    std::cout << "---------------------------------------------------------\n";
    for (int threads : thread_counts) {
        omp_set_num_threads(threads);
        struct timeval start_total, end_total; gettimeofday(&start_total, NULL);
        
        std::vector<float> recalls(test_number, 0.0f);
        
        // 🔵 最外层并发！每个线程处理不同的 Query
        #pragma omp parallel for schedule(dynamic)
        for (int i = 0; i < test_number; ++i) {
            auto res = serial_baseline(ivf_centroids, ivf_lists, base, test_query + i * vecdim, vecdim, k, nprobe);
            std::set<uint32_t> gt; for(int j=0; j<k; ++j) gt.insert(test_gt[j+i*test_gt_d]);
            size_t acc = 0; while(res.size()) { if(gt.find(res.top().second) != gt.end()) ++acc; res.pop(); }
            recalls[i] = (float)acc/k;
        }
        
        gettimeofday(&end_total, NULL);
        int64_t total_time = (end_total.tv_sec*1000000 + end_total.tv_usec) - (start_total.tv_sec*1000000 + start_total.tv_usec);
        
        float sum_recall = 0; for(float r : recalls) sum_recall += r;
        
        // Query 并发测的是吞吐量，所以平均延迟 = 总时间 / 总 Query 数
        std::cout << "| " << threads << " core   | " << std::setw(18) << std::left << total_time / test_number << " | " << sum_recall / test_number << "      |\n";
    }
    std::cout << "=========================================================\n";

    return 0;
}
/*
实验结果：
[s2412351@master_ubss1 ann]$ bash test.sh 2 1
Submitted job with ID: 18694.master_ubss1
[1] 20:52:10 [SUCCESS] master_ubss2

Authorized users only. All activities may be monitored and reported.

Authorized users only. All activities may be monitored and reported.
[1] 20:52:11 [SUCCESS] master_ubss2
[IVF] Training 1000 coarse centroids (rooms)...
[IVF] Building Inverted Lists (Distributing vectors into rooms)...
[IVF] Build Finished! 100,000 vectors successfully buckets!

=========================================================
🗡️ 尝试 1: 单 Query 【粗排】簇中心并行 (Expected: Negative)
| Threads  | Avg Latency (us)   | Avg Recall   |
---------------------------------------------------------
| 1 core   | 852                | 0.97884      |
| 2 core   | 808                | 0.97884      |
| 4 core   | 813                | 0.97884      |
| 8 core   | 928                | 0.97884      |

=========================================================
🗡️ 尝试 2: 单 Query 【精排】簇划分并行 (dynamic 调度)
| Threads  | Avg Latency (us)   | Avg Recall   |
---------------------------------------------------------
| 1 core   | 1059               | 0.97884      |
| 2 core   | 524                | 0.97884      |
| 4 core   | 325                | 0.97884      |
| 8 core   | 223                | 0.97884      |

=========================================================
🗡️ 尝试 3: Query 级大满贯并行 (Batch 并发)
| Threads  | Avg Latency (us)   | Avg Recall   |
---------------------------------------------------------
| 1 core   | 1028               | 0.97884      |
| 2 core   | 451                | 0.97884      |
| 4 core   | 250                | 0.97884      |
| 8 core   | 135                | 0.97884      |
=========================================================

=========================================================
🗡️ 尝试 1: 单 Query 【粗排】簇中心并行 (Expected: Negative)
| Threads  | Avg Latency (us)   | Avg Recall   |
---------------------------------------------------------
| 1 core   | 901                | 0.97884      |
| 2 core   | 836                | 0.97884      |
| 4 core   | 825                | 0.97884      |
| 8 core   | 1002               | 0.97884      |

=========================================================
🗡️ 尝试 2: 单 Query 【精排】簇划分并行 (dynamic 调度)
| Threads  | Avg Latency (us)   | Avg Recall   |
---------------------------------------------------------
| 1 core   | 973                | 0.97884      |
| 2 core   | 497                | 0.97884      |
| 4 core   | 321                | 0.97884      |
| 8 core   | 221                | 0.97884      |

=========================================================
🗡️ 尝试 3: Query 级大满贯并行 (Batch 并发)
| Threads  | Avg Latency (us)   | Avg Recall   |
---------------------------------------------------------
| 1 core   | 869                | 0.97884      |
| 2 core   | 430                | 0.97884      |
| 4 core   | 239                | 0.97884      |
| 8 core   | 134                | 0.97884      |
=========================================================


*/

/*
尝试二的perf数据
=========================================================
（1）
🗡️ 尝试 2: 单 Query 【精排】簇划分并行 (dynamic 调度)
| Threads  | Avg Latency (us)   | Avg Recall   |
---------------------------------------------------------
| 1 core   | 896                | 0.97884      |

 Performance counter stats for './main':

   623,596,482,390      cpu-cycles:u                                                
 1,102,442,055,773      instructions:u            #    1.77  insn per cycle         
   312,022,100,140      L1-dcache-loads:u                                           
     4,654,142,775      L1-dcache-load-misses:u   #    1.49% of all L1-dcache accesses
     2,331,669,102      LLC-loads:u                                                 
       179,288,050      LLC-load-misses:u         #    7.69% of all LL-cache accesses
                 0      context-switches:u                                          

      44.168670060 seconds time elapsed

     242.793289000 seconds user
       0.473633000 seconds sys

（2）
[s2412351@master_ubss1 ann]$ perf stat -e cpu-cycles,instructions,L1-dcache-loads,L1-dcache-load-misses,LLC-loads,LLC-load-misses,context-switches ./main
[IVF] Training 1000 coarse centroids (rooms)...
[IVF] Building Inverted Lists (Distributing vectors into rooms)...
[IVF] Build Finished! 100,000 vectors successfully buckets!

=========================================================
🗡️ 尝试 2: 单 Query 【精排】簇划分并行 (dynamic 调度)
| Threads  | Avg Latency (us)   | Avg Recall   |
---------------------------------------------------------
| 2 core   | 446                | 0.97884      |

 Performance counter stats for './main':

   621,917,549,115      cpu-cycles:u                                                
 1,108,705,409,833      instructions:u            #    1.78  insn per cycle         
   313,108,617,010      L1-dcache-loads:u                                           
     4,662,176,889      L1-dcache-load-misses:u   #    1.49% of all L1-dcache accesses
     2,172,912,366      LLC-loads:u                                                 
       210,520,687      LLC-load-misses:u         #    9.69% of all LL-cache accesses
                 0      context-switches:u                                          

      36.123096695 seconds time elapsed

     242.179176000 seconds user
       0.356066000 seconds sys

此时线程的关系
# Overhead      Pid:Command
# ........  ...............
#
    13.93%  1463726:main   
    13.86%  1463728:main   
    12.05%  1463732:main   
    12.05%  1463731:main   
    12.05%  1463730:main   
    12.04%  1463733:main   
    12.01%  1463734:main   
    12.00%  1463729:main   

（3）用八核离线
[s2412351@master_ubss1 ann]$ perf stat -e cpu-cycles,instructions,L1-dcache-loads,L1-dcache-load-misses,LLC-loads,LLC-load-misses,context-switches ./main
[IVF] Training 1000 coarse centroids (rooms)...
[IVF] Building Inverted Lists (Distributing vectors into rooms)...
[IVF] Build Finished! 100,000 vectors successfully buckets!

=========================================================
🗡️ 尝试 2: 单 Query 【精排】簇划分并行 (dynamic 调度)
| Threads  | Avg Latency (us)   | Avg Recall   |
---------------------------------------------------------
| 8 core   | 326                | 0.97884      |

 Performance counter stats for './main':

   654,896,583,764      cpu-cycles:u                                                
 1,174,838,739,744      instructions:u            #    1.79  insn per cycle         
   324,343,231,666      L1-dcache-loads:u                                           
     4,671,650,297      L1-dcache-load-misses:u   #    1.44% of all L1-dcache accesses
     2,394,559,502      LLC-loads:u                                                 
       306,961,086      LLC-load-misses:u         #   12.82% of all LL-cache accesses
                 0      context-switches:u                                          

      33.797049968 seconds time elapsed

     254.903977000 seconds user
       2.566529000 seconds sys

用八核离线
[s2412351@master_ubss1 ann]$ perf stat -e cpu-cycles,instructions,L1-dcache-loads,L1-dcache-load-misses,LLC-loads,LLC-load-misses,context-switches ./main
[IVF] Training 1000 coarse centroids (rooms) with 8 threads...
[IVF] Building Inverted Lists with 8 threads...
[IVF] Build Finished! 100,000 vectors successfully buckets!

=========================================================
🗡️ 尝试 2: 单 Query 【精排】簇划分并行 (dynamic 调度)
| Threads  | Avg Latency (us)   | Avg Recall   |
---------------------------------------------------------
| 8 core   | 326                | 0.97884      |

 Performance counter stats for './main':

   755,608,010,124      cpu-cycles:u                                                
 1,473,403,226,352      instructions:u            #    1.95  insn per cycle         
   373,887,899,785      L1-dcache-loads:u                                           
     4,688,293,874      L1-dcache-load-misses:u   #    1.25% of all L1-dcache accesses
     3,076,876,548      LLC-loads:u                                                 
       259,777,246      LLC-load-misses:u         #    8.44% of all LL-cache accesses
                 0      context-switches:u                                          

     273.475458547 seconds time elapsed

     312.841513000 seconds user
       8.814901000 seconds sys


用单核离线
=========================================================
🗡️ 尝试 2: 单 Query 【精排】簇划分并行 (dynamic 调度)
| Threads  | Avg Latency (us)   | Avg Recall   |
---------------------------------------------------------
| 8 core   | 259                | 0.97884      |

 Performance counter stats for './main':

   642,504,040,945      cpu-cycles:u                                                
 1,159,946,740,558      instructions:u            #    1.81  insn per cycle         
   321,854,783,726      L1-dcache-loads:u                                           
     4,686,148,190      L1-dcache-load-misses:u   #    1.46% of all L1-dcache accesses
     1,079,325,690      LLC-loads:u                                                 
       266,049,558      LLC-load-misses:u         #   24.65% of all LL-cache accesses
                 0      context-switches:u                                          

     235.504936306 seconds time elapsed

     251.727879000 seconds user
       0.594535000 seconds sys


    # Overhead      Pid:Command
# ........  ...............
#   用8核离线
    13.93%  1463726:main   
[s2412351@master_ubss1 ann]$ perf report --sort=pid --stdio
# To display the perf.data header info, please use --header/--header-only options.
#
#
# Total Lost Samples: 0
#
# Samples: 67K of event 'cpu-cycles:u'
# Event count (approx.): 746683440654
#
# Overhead      Pid:Command
# ........  ...............
#
    12.82%  1758125:main   
    12.55%  1758127:main   
    12.52%  1758130:main   
    12.45%  1758131:main   
    12.43%  1758132:main   
    12.42%  1758129:main   
    12.41%  1758133:main   
    12.40%  1758128:main   
    用单核离线
    # Overhead      Pid:Command
# ........  ...............
#
    93.32%  1722496:main   
     0.97%  1723969:main   
     0.96%  1723972:main   
     0.96%  1723973:main   
     0.96%  1723971:main   
     0.95%  1723974:main   
     0.94%  1723970:main   
     0.94%  1723968:main   



     此后为了时间更快，均采用8核离线
*/


/*
负优化组别分析
(1)8线程
尝试 1: 单 Query 【粗排】簇中心并行 (负优化)\n
[s2412351@master_ubss1 ann]$ perf stat -e cpu-cycles,instructions,L1-dcache-loads,L1-dcache-load-misses,LLC-loads,LLC-load-misses,context-switches ./main
[IVF] Training 1000 coarse centroids (rooms) with 8 threads...
[IVF] Building Inverted Lists with 8 threads...
[IVF] Build Finished! 100,000 vectors successfully buckets!

=========================================================
🗡️ 尝试 1: 单 Query 【粗排】簇中心并行 (Expected: Negative)
| Threads  | Avg Latency (us)   | Avg Recall   |
---------------------------------------------------------
| 8 core   | 928              | 0.97884      |

 Performance counter stats for './main':

   758,361,650,552      cpu-cycles:u                                                
 1,478,101,295,010      instructions:u            #    1.95  insn per cycle         
   375,055,199,208      L1-dcache-loads:u                                           
     4,726,451,584      L1-dcache-load-misses:u   #    1.26% of all L1-dcache accesses
     2,192,827,167      LLC-loads:u                                                 
       258,009,376      LLC-load-misses:u         #   11.77% of all LL-cache accesses
                 0      context-switches:u                                          

     261.027081567 seconds time elapsed

     310.670027000 seconds user
      11.119616000 seconds sys

[s2412351@master_ubss1 ann]$ perf report --sort=pid --stdio
# To display the perf.data header info, please use --header/--header-only options.
#
#
# Total Lost Samples: 0
#
# Samples: 68K of event 'cpu-cycles:u'
# Event count (approx.): 746456706414
#
# Overhead      Pid:Command
# ........  ...............
#
    16.56%  1917793:main   
    12.06%  1917817:main   
    11.99%  1917820:main   




*/


/*
尝试三：
[s2412351@master_ubss1 ann]$ perf stat -e cpu-cycles,instructions,L1-dcache-loads,L1-dcache-load-misses ./main
[IVF] Training 1000 coarse centroids (rooms) with 8 threads...
[IVF] Building Inverted Lists with 8 threads...
[IVF] Build Finished! 100,000 vectors successfully buckets!

=========================================================
🗡️ 尝试 3: Query 级大满贯并行 (Batch 并发)
| Threads  | Avg Latency (us)   | Avg Recall   |
---------------------------------------------------------
| 8 core   | 134            | 0.97884      |
=========================================================

 Performance counter stats for './main':

   644,968,004,667      cpu-cycles:u                                                
 1,102,292,457,708      instructions:u            #    1.71  insn per cycle         
   312,004,995,346      L1-dcache-loads:u                                           
     4,709,747,125      L1-dcache-load-misses:u   #    1.51% of all L1-dcache accesses

      59.396123596 seconds time elapsed

     251.326039000 seconds user
       2.565417000 seconds sys



*/
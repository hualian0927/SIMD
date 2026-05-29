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
#include "flat_scan.h"

#include <arm_neon.h>
#include <queue>
#include "hnswlib/hnswlib/simd_utils.h"
#include "hnswlib/hnswlib/pq_train.h"

using namespace hnswlib;

template<typename T>
T *LoadData(std::string data_path, size_t& n, size_t& d)
{
    std::ifstream fin;
    fin.open(data_path, std::ios::in | std::ios::binary);
    if (!fin.is_open()) {
        std::cerr << "Failed to open " << data_path << std::endl;
        exit(1);
    }
    fin.read((char*)&n,4);
    fin.read((char*)&d,4);
    T* data = new T[n*d];
    int sz = sizeof(T);
    for(int i = 0; i < n; ++i){
        fin.read(((char*)data + i*d*sz), d*sz);
    }
    fin.close();
    std::cerr<<"load data "<<data_path<<"\n";
    return data;
}

struct SearchResult
{
    float recall;
    int64_t latency; 
};

int main(int argc, char *argv[])
{
    size_t test_number = 0, base_number = 0;
    size_t test_gt_d = 0, vecdim = 0;

    std::string data_path = "/anndata/"; 
    auto test_query = LoadData<float>(data_path + "DEEP100K.query.fbin", test_number, vecdim);
    auto test_gt = LoadData<int>(data_path + "DEEP100K.gt.query.100k.top100.bin", test_number, test_gt_d);
    auto base = LoadData<float>(data_path + "DEEP100K.base.100k.fbin", base_number, vecdim);
    
    test_number = 2000; 
    const size_t k = 10;
    const size_t P_size = 2500; 

    // 离线建库阶段
    const int M = 4;        
    const int K_pq = 256;   
    std::vector<float> codebooks(M * K_pq * (vecdim / M), 0.0f);
    train_pq(base, base_number, vecdim, M, K_pq, codebooks);
    uint8_t* pq_base = encode_pq(base, base_number, vecdim, M, K_pq, codebooks);

    // AoS -> SoA 重排
    std::vector<float> codebooks_SoA(codebooks.size(), 0.0f);
    size_t sub_dim = vecdim / M;
    for (int m = 0; m < M; ++m) {
        for (int c = 0; c < K_pq; ++c) {
            for (size_t d = 0; d < sub_dim; ++d) {
                codebooks_SoA[m * K_pq * sub_dim + d * K_pq + c] = codebooks[m * K_pq * sub_dim + c * sub_dim + d];
            }
        }
    }

    std::vector<int> thread_counts = {1, 2, 4, 8};

    std::cout << "\n=========================================================\n";
    std::cout << "🚀 2.1.2 查表并行策略 A：【单查询内部 Pthread 分块扫描】\n";
    std::cout << "=========================================================\n";
    for(int threads : thread_counts) {
        omp_set_num_threads(threads);
        std::vector<SearchResult> results(test_number);
        
        // ⚠️ 外层严格串行
        for(int i = 0; i < test_number; ++i) {
            const unsigned long Converter = 1000 * 1000;
            struct timeval val; gettimeofday(&val, NULL);

            // 🌟 内部使用无锁 Pthread 静态分块扫描！
            auto res = pq_adc_search_chunk_parallel(pq_base, base, test_query + i * vecdim, base_number, vecdim, k, M, K_pq, codebooks_SoA, P_size);

            struct timeval newVal; gettimeofday(&newVal, NULL);
            int64_t diff = (newVal.tv_sec * Converter + newVal.tv_usec) - (val.tv_sec * Converter + val.tv_usec);
            std::set<uint32_t> gtset; for(int j = 0; j < k; ++j) gtset.insert(test_gt[j + i*test_gt_d]);
            size_t acc = 0; while (res.size()) { if(gtset.find(res.top().second) != gtset.end()) ++acc; res.pop(); }
            
            results[i] = {(float)acc/k, diff};
        }
        float avg_recall = 0, avg_latency = 0;
        for(int i = 0; i < test_number; ++i) { avg_recall += results[i].recall; avg_latency += results[i].latency; }
        std::cout << "| Threads: " << threads << " (Chunking) | latency: " << avg_latency / test_number << " us | recall: " << avg_recall / test_number << " |\n";
    }

    std::cout << "\n=========================================================\n";
    std::cout << "🚀 2.1.2 查表并行策略 B：【Batch Query 批量并行处理】(见证奇迹)\n";
    std::cout << "=========================================================\n";
    for(int threads : thread_counts) {
        omp_set_num_threads(threads);
        std::vector<SearchResult> results(test_number);
        
        // 🌟 奇迹发生点：多线程加在最外层！每个核心处理不同的 Query
        #pragma omp parallel for schedule(dynamic)
        for(int i = 0; i < test_number; ++i) {
            const unsigned long Converter = 1000 * 1000;
            struct timeval val; gettimeofday(&val, NULL);

            // 内部调用极速无锁串行版，没有任何线程干预
            auto res = pq_adc_search_pure_serial(pq_base, base, test_query + i * vecdim, base_number, vecdim, k, M, K_pq, codebooks_SoA, P_size);

            struct timeval newVal; gettimeofday(&newVal, NULL);
            int64_t diff = (newVal.tv_sec * Converter + newVal.tv_usec) - (val.tv_sec * Converter + val.tv_usec);
            std::set<uint32_t> gtset; for(int j = 0; j < k; ++j) gtset.insert(test_gt[j + i*test_gt_d]);
            size_t acc = 0; while (res.size()) { if(gtset.find(res.top().second) != gtset.end()) ++acc; res.pop(); }
            
            // 并发写入是安全的，因为 i 是相互独立的
            results[i] = {(float)acc/k, diff};
        }
        float avg_recall = 0, avg_latency = 0;
        for(int i = 0; i < test_number; ++i) { avg_recall += results[i].recall; avg_latency += results[i].latency; }
        std::cout << "| Threads: " << threads << " (Batch Q)  | latency: " << avg_latency / test_number << " us | recall: " << avg_recall / test_number << " |\n";
    }
    std::cout << "=========================================================\n";

    delete[] base; delete[] test_query; delete[] test_gt; delete[] pq_base;
    return 0;
}

/*
指导书原文：
2.1.2 PQ-SIMD + 多线程优化（2 分） 
PQ-SIMD 分成两个阶段。 
第一阶段是 PQ 编码阶段，主要是 KMeans/KMeans++ 聚类与向量编 
码。如果在 SIMD 实验中已经实现了相关优化，也可以继续在此基础上进 
行多线程优化。这一部分不作为性能考核重点，但如果实现了较高质量的并 
行优化，可以作为进阶要求加分。 
第二阶段是查询阶段（默认使用 ADC），又可以分成两个子阶段。 
（1）LUT 构建阶段 
LUT 构建阶段本质上仍然属于 dense compute。每个子空间中，需要 
分别计算每个子查询向量到所有类中心的距离，因此可以考虑： 
• 子空间并行； 
• 子查询向量并行； 
• 类中心集合并行； 
如果 SIMD 实验中已经实现了跨 centroid 并行，那么这里也可以进一 
步结合 Pthread/OpenMP 进行优化。这一部分整体计算较规则，通常能够 
获得比较稳定的并行加速效果。 
（2）查表累加阶段
查表累加阶段从“计算距离”转变为“查表 + 累加”，瓶颈逐渐从
compute-bound 转向 memory-bound。由于 PQ code 对 LUT 的访问通常
是随机的，因此 cache miss 与内存带宽会逐渐成为主要限制因素。
在这一阶段，推荐探索 batch query 并行，即不同线程分别处理不同
query；或者，对于单个 query 的查表扫描，也可以尝试对 base 向量集合进
行分块并行扫描，并由每个线程维护局部 top-p，最后再进行 merge；但由
于这一阶段通常已经受到 memory bandwidth 限制，因此线程数并不一定
越多越好，可能导致负优化，在报告中分析清楚就可以。
如果 SIMD 中实现了 gather、shuffle（FastScan）、批量 gather 等进阶
方法，进一步结合这些方法探索与多线程结合下的性能优化。

《我用了thread，报告中强调一下》
《报告中只需要写效果好的那一组优化并进行分析即可》


结果：
=========================================================
🚀 聚焦测试：【单查询内部 Pthread 分块扫描】(观察微弱正优化与内存墙)
=========================================================
| Threads: 1 | Avg Latency: 1700.22 us | Recall: 0.976003 |
| Threads: 2 | Avg Latency: 1590.63 us | Recall: 0.976003 |
| Threads: 4 | Avg Latency: 1424.7 us | Recall: 0.976003 |
| Threads: 8 | Avg Latency: 1411.51 us | Recall: 0.976003 |
=========================================================

perf相关数据：
  Children      Self  Command  Shared Object          Symbol
+   64.51%     0.00%  main     main                   [.] _start
+   64.51%     0.00%  main     libc.so.6              [.] __libc_start_main
+   64.51%     0.00%  main     libc.so.6              [.] 0x0000ffff95c0b000
+   64.49%     0.00%  main     main                   [.] main
+   37.53%    23.56%  main     main                   [.] pq_adc_search_chunk_parallel
+   35.49%     0.00%  main     libc.so.6              [.] 0x0000ffff95cc9d5c
+   35.49%     0.00%  main     libc.so.6              [.] 0x0000ffff95c62518
+   35.32%     0.00%  main     libgomp.so.1.0.0       [.] 0x0000ffff95de97e0
+   28.37%    28.37%  main     main                   [.] pq_adc_search_chunk_parallel
+   23.81%    23.79%  main     main                   [.] std::__introselect<__gnu_cxx::__normal_iterator<std::pair<float, int>*, std::vector<std::pair<float, int>, std::alloc
+   19.44%    19.44%  main     main                   [.] encode_pq
+   16.62%     0.00%  main     libgomp.so.1.0.0       [.] GOMP_parallel
+    3.73%     3.73%  main     main                   [.] train_pq
+    0.52%     0.01%  main     main                   [.] train_pq

Percent│      add  x6, x6, #0x100                                                                                                                                             ▒
  2.29 │      ldrb w5, [x0, #2]                                                                                                                                               ▒
  3.67 │      ldrb w3, [x0, #3]                                                                                                                                               ▒
  0.31 │      add  x0, x0, x9                                                                                                                                                 ▒
  0.18 │      add  x5, x5, #0x200                                                                                                                                             ▒
  3.78 │      ldr  s3, [x4, x6, lsl #2]                                                                                                                                       ▒
  0.07 │      add  x3, x3, #0x300                                                                                                                                             ▒
 34.51 │      ldr  s0, [x4, x7, lsl #2]                                                                                                                                       ▒
 10.38 │      ldr  s2, [x4, x5, lsl #2]                                                                                                                                       ▒
  9.28 │      ldr  s1, [x4, x3, lsl #2]                                                                                                                                       ▒
  0.03 │      fadd s0, s0, s3                                                                                                                                                 ▒
  7.88 │      stur w2, [x1, #-4]                                                                                                                                              ▒
       │      add  x2, x2, #0x1                                                                                                                                               ▒
       │      fadd s0, s0, s2                                                                                                                                                 ▒
       │      fadd s0, s0, s1                                                                                                                                                 ▒
 13.58 │      fsub s0, s4, s0                                                                                                                                                 ▒
  1.88 │      stur s0, [x1, #-8]                                                                                                                                              ▒
  0.37 │      cmp  x8, x2                                                                                                                                                     ▒
       │    ↑ b.ne 68                                                                                                                                                         ▒
       │c0:   ldp  x19, x20, [sp, #16]                                                                                                                                        ▒
  0.04 │      ldp  x29, x30, [sp], #32  


=========================================================
🚀 2.1.2 查表并行策略 B：【Batch Query 批量并行处理】(见证奇迹)
=========================================================
| Threads: 1 (Batch Q)  | latency: 1607.25 us | recall: 0.976003 |
| Threads: 2 (Batch Q)  | latency: 1608.55 us | recall: 0.976003 |
| Threads: 4 (Batch Q)  | latency: 1678.37 us | recall: 0.976003 |
| Threads: 8 (Batch Q)  | latency: 1727.71 us | recall: 0.976003 |
=========================================================
*/
// ===========================================================================
// Lab3 Pthread — PQ-SIMD 查表扫描 pthread 并行
//
// 与原有 OpenMP 版本 (pq_main.cc + pq_train.h) 对照:
//   原版: #pragma omp parallel / omp_get_thread_num → 本质是 OpenMP
//   本版: pthread_create / pthread_join / atomic fetch_add → 真正的 Pthread
//
// 策略 A: intra-query 底库分块 (pthread 均分 100K base, 无锁写 dist_array)
// 策略 B: inter-query 批量并行 (atomic fetch_add 分发 query, 零互斥)
//
// 编译: g++ main_pq_pthread.cc -o main_pq_pthread -O2 -lpthread -std=c++17 -I..
//        (鲲鹏 ARM NEON 自动激活)
// ===========================================================================

#include <chrono>
#include <cstring>
#include <fstream>
#include <iomanip>
#include <iostream>
#include <queue>
#include <set>
#include <string>
#include <sys/time.h>
#include <vector>

#include "hnswlib/hnswlib/simd_utils.h"
#include "pq_pthread.h"

template<typename T>
T* LoadData(std::string data_path, size_t& n, size_t& d) {
    std::ifstream fin;
    fin.open(data_path, std::ios::in | std::ios::binary);
    if (!fin.is_open()) { std::cerr << "Failed to open " << data_path << "\n"; exit(1); }
    fin.read((char*)&n, 4);
    fin.read((char*)&d, 4);
    T* data = new T[n * d];
    int sz = sizeof(T);
    for (size_t i = 0; i < n; ++i)
        fin.read(((char*)data + i * d * sz), d * sz);
    fin.close();
    std::cerr << "load data " << data_path << "\n";
    return data;
}

struct SearchResult { float recall; int64_t latency; };

static bool FileExists(const std::string& p) { std::ifstream t(p); return t.good(); }

int main(int /*argc*/, char** /*argv*/) {
    size_t test_number = 0, base_number = 0;
    size_t test_gt_d = 0, vecdim = 0;
    std::string data_path = "/anndata/";

    float* test_query = LoadData<float>(
        data_path + "DEEP100K.query.fbin", test_number, vecdim);
    int*   test_gt = LoadData<int>(
        data_path + "DEEP100K.gt.query.100k.top100.bin", test_number, test_gt_d);
    float* base = LoadData<float>(
        data_path + "DEEP100K.base.100k.fbin", base_number, vecdim);

    test_number = 2000;
    const size_t k = 10;
    const size_t P_size = 2500;
    const int M = 4;
    const int K_pq = 256;
    size_t sub_dim = vecdim / M;

    // ---- 离线: 优先加载缓存, 否则训练 + 编码 + 持久化 ----
    const std::string pq_path = "files/pq_index.bin";
    std::vector<float> codebooks_SoA;
    uint8_t* pq_base = nullptr;
    int loaded_M = 0, loaded_K = 0;
    size_t loaded_base = 0, loaded_sub = 0;

    if (FileExists(pq_path)) {
        pq_base = pq_load(pq_path, codebooks_SoA, loaded_base, loaded_M, loaded_K, loaded_sub);
        if (pq_base && loaded_base == base_number && loaded_M == M && loaded_K == K_pq) {
            // cache hit
        } else {
            delete[] pq_base; pq_base = nullptr; codebooks_SoA.clear();
        }
    }
    if (!pq_base) {
        std::vector<float> codebooks;
        train_pq_pthread(base, base_number, vecdim, M, K_pq, codebooks, /*nthreads=*/8);
        // SoA 重排
        codebooks_SoA.resize(codebooks.size(), 0.0f);
        for (int m = 0; m < M; ++m)
            for (int c = 0; c < K_pq; ++c)
                for (size_t d = 0; d < sub_dim; ++d)
                    codebooks_SoA[m * K_pq * sub_dim + d * K_pq + c] =
                        codebooks[m * K_pq * sub_dim + c * sub_dim + d];
        pq_base = encode_pq_pthread(base, base_number, vecdim, M, K_pq,
                                     codebooks, /*nthreads=*/8);
        pq_save(pq_path, codebooks_SoA, pq_base, base_number, M, K_pq, sub_dim);
    }

    // ================================================================
    // 策略 A: intra-query pthread 分块扫描
    // ================================================================
    std::cout << "\n=========================================================\n";
    std::cout << "Strategy A: intra-query pthread chunking\n";
    std::cout << "  (pthread_create/join per query, base split across threads)\n";
    std::cout << "=========================================================\n";

    for (int nthreads : {1, 2, 4, 8}) {
        std::vector<SearchResult> results(test_number);
        for (size_t i = 0; i < test_number; ++i) {
            struct timeval val; gettimeofday(&val, nullptr);

            auto res = pq_adc_search_intra_pthread(
                pq_base, base, test_query + i * vecdim,
                base_number, vecdim, k, M, K_pq,
                codebooks_SoA, P_size, nthreads);

            struct timeval newVal; gettimeofday(&newVal, nullptr);
            int64_t diff = (newVal.tv_sec * 1000000UL + newVal.tv_usec)
                         - (val.tv_sec * 1000000UL + val.tv_usec);

            std::set<uint32_t> gtset;
            for (size_t j = 0; j < k; ++j)
                gtset.insert(static_cast<uint32_t>(test_gt[j + i * test_gt_d]));
            size_t hits = 0;
            while (!res.empty()) {
                if (gtset.find(static_cast<uint32_t>(res.top().second)) != gtset.end())
                    ++hits;
                res.pop();
            }
            results[i] = {(float)hits / k, diff};
        }
        float avg_lat = 0, avg_rec = 0;
        for (auto& r : results) { avg_lat += r.latency; avg_rec += r.recall; }
        avg_lat /= test_number; avg_rec /= test_number;
        std::cout << "| pthreads=" << nthreads
                  << " | latency=" << avg_lat << " us"
                  << " | recall=" << avg_rec << " |\n";
    }

    // ================================================================
    // 策略 B: inter-query pthread 批量并行
    // ================================================================
    std::cout << "\n=========================================================\n";
    std::cout << "Strategy B: inter-query batch pthread\n";
    std::cout << "  (atomic fetch_add dispatch, one pthread_create/join total)\n";
    std::cout << "=========================================================\n";

    for (int nthreads : {1, 2, 4, 8}) {
        std::vector<float> latencies, recalls;
        const auto t0 = std::chrono::high_resolution_clock::now();

        pq_adc_search_batch_pthread(pq_base, base, test_query,
            base_number, vecdim, test_number, k, M, K_pq,
            codebooks_SoA, P_size, nthreads,
            latencies, recalls, test_gt, test_gt_d);

        const auto t1 = std::chrono::high_resolution_clock::now();
        double wall_ms = std::chrono::duration<double, std::milli>(t1 - t0).count();

        float avg_lat = 0, avg_rec = 0;
        for (size_t i = 0; i < test_number; ++i) {
            avg_lat += latencies[i];
            avg_rec += recalls[i];
        }
        avg_lat /= test_number; avg_rec /= test_number;
        std::cout << "| pthreads=" << nthreads
                  << " | wall=" << wall_ms << " ms"
                  << " | avg_latency=" << avg_lat << " us"
                  << " | recall=" << avg_rec << " |\n";
    }
    std::cout << "=========================================================\n";

    delete[] base; delete[] test_query; delete[] test_gt; delete[] pq_base;
    return 0;
}

/*
============================================================================
指导书对照 (§2.1.2 PQ-SIMD + 多线程优化)

原 OpenMP 版本 (pq_train.h):
  - train_pq:     #pragma omp parallel for  (assign)
  - encode_pq:    #pragma omp parallel for
  - 策略A:        #pragma omp parallel + omp_get_thread_num 手动分块
  - 策略B:        #pragma omp parallel for schedule(dynamic)

本 pthread 版本 (pq_pthread.h):
  - train_pq_pthread:             pthread_create × N + pthread_join
  - encode_pq_pthread:            pthread_create × N + pthread_join
  - 策略A intra_chunk_worker:     pthread 均分 base, 无锁写入 dist_array
  - 策略B batch_worker:           atomic fetch_add 分发 query, 零互斥

预期结果 (根据指导书分析):
  - 策略A (intra-query): 线程数增加受 memory bandwidth 限制, >4 线程后加速递减
  - 策略B (inter-query): 单 query 延迟可能增加 (无内层并行), 但总吞吐量最优
    因为消除了 per-query 的 pthread_create/join 开销

perf 分析命令:
  # 整体计数
  perf stat -e cpu-cycles,instructions,cache-misses,L1-dcache-load-misses \
            -e context-switches,cpu-migrations \
            ./main_pq_pthread

  # 采样热点
  perf record -g --call-graph dwarf ./main_pq_pthread
  perf report --stdio --sort=symbol | head -30

  # 汇编分析最热函数
  perf annotate --stdio intra_chunk_worker
  perf annotate --stdio batch_worker

  # 对比: 原子分发 vs OpenMP schedule(dynamic)
  perf stat -e cpu-cycles,instructions,cache-misses ./main_pq_pthread
============================================================================
*/

/*
[s2412351@master_ubss1 ann]$ bash test.sh 2 1
Submitted job with ID: 20890.master_ubss1
[1] 10:36:49 [SUCCESS] master_ubss6

Authorized users only. All activities may be monitored and reported.

Authorized users only. All activities may be monitored and reported.
[1] 10:36:51 [SUCCESS] master_ubss6
load data /anndata/DEEP100K.query.fbin
load data /anndata/DEEP100K.gt.query.100k.top100.bin
load data /anndata/DEEP100K.base.100k.fbin
[PQ-Pthread] Training 4 sub-spaces, 256 centroids, 8 threads...
[PQ-Pthread] Encoding Finished!

=========================================================
Strategy A: intra-query pthread chunking
  (pthread_create/join per query, base split across threads)
=========================================================
| pthreads=1 | latency=2021.55 us | recall=0.976003 |
| pthreads=2 | latency=1898.78 us | recall=0.976003 |
| pthreads=4 | latency=1911.8 us | recall=0.976003 |
| pthreads=8 | latency=2158.13 us | recall=0.976003 |

=========================================================
Strategy B: inter-query batch pthread
  (atomic fetch_add dispatch, one pthread_create/join total)
=========================================================
| pthreads=1 | wall=3607.24 ms | avg_latency=1800.51 us | recall=0.976003 |
| pthreads=2 | wall=1817.24 ms | avg_latency=1813.46 us | recall=0.976003 |
| pthreads=4 | wall=890.367 ms | avg_latency=1775.82 us | recall=0.976003 |
| pthreads=8 | wall=515.342 ms | avg_latency=2042.8 us | recall=0.976003 |
=========================================================

Authorized users only. All activities may be monitored and reported.

*/
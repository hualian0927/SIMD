// ===========================================================================
// Lab3 Pthread — IVF-SIMD 纯倒排索引 pthread 并行
//
// 与原有 OpenMP 版本 (IVF-baseline 优化.cc + ivf_train.h) 对照:
//   原版: #pragma omp parallel for / omp critical / omp for schedule(dynamic)
//   本版: pthread_create / pthread_join / pthread_mutex / atomic fetch_add
//
// 三种策略:
//   策略 A: intra-query 精排簇并行 (pthread 均分选中的簇, 局部堆 + merge)
//   策略 B: inter-query 批量并行 (atomic fetch_add 分发, 零互斥)  ← 效果最好
//   策略 C: 纯串行 baseline (供对照)
//
// 编译: g++ main_ivf_baseline_pthread.cc -o main_ivf_pthread -O2 -lpthread -std=c++17 -I..
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
#include "ivf_pthread.h"

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

    test_number = 10000;
    const size_t k = 10;
    const int nprobe = 50;
    const int K_ivf = 1000;

    // ---- 离线: 优先加载缓存, 否则训练 + 构建 + 持久化 ----
    const std::string ivf_path = "files/ivf_index.bin";
    std::vector<float> ivf_centroids;
    std::vector<IVFList> ivf_lists;
    int loaded_K = 0; size_t loaded_dim = 0;

    if (FileExists(ivf_path)) {
        ivf_lists = ivf_load(ivf_path, ivf_centroids, loaded_dim, loaded_K);
        if (ivf_lists.empty() || loaded_K != K_ivf || loaded_dim != vecdim) {
            ivf_lists.clear(); ivf_centroids.clear();
        }
    }
    if (ivf_lists.empty()) {
        train_ivf_pthread(base, base_number, vecdim, K_ivf, ivf_centroids, /*nthreads=*/8);
        ivf_lists = build_ivf_pthread(base, base_number, vecdim, K_ivf,
                                       ivf_centroids, /*nthreads=*/8);
        ivf_save(ivf_path, ivf_centroids, ivf_lists, vecdim, K_ivf);
    }

    // ================================================================
    // 策略 A: intra-query 精排簇并行 (替代 OpenMP schedule(dynamic))
    // ================================================================
    std::cout << "\n=========================================================\n";
    std::cout << "Strategy A: intra-query fine (cluster) parallel [pthread]\n";
    std::cout << "  (pthread_create/join per query, clusters split across threads)\n";
    std::cout << "=========================================================\n";

    for (int nthreads : {1, 2, 4, 8}) {
        int64_t total_lat = 0;
        float total_rec = 0;
        for (size_t i = 0; i < test_number; ++i) {
            struct timeval tv; gettimeofday(&tv, nullptr);

            auto res = ivf_simd_fine_pthread(ivf_centroids, ivf_lists, base,
                test_query + i * vecdim, vecdim, k, nprobe, nthreads);

            struct timeval tv2; gettimeofday(&tv2, nullptr);
            total_lat += (tv2.tv_sec * 1000000UL + tv2.tv_usec)
                       - (tv.tv_sec * 1000000UL + tv.tv_usec);

            std::set<uint32_t> gt;
            for (size_t j = 0; j < k; ++j)
                gt.insert(static_cast<uint32_t>(test_gt[j + i * test_gt_d]));
            size_t hits = 0;
            while (!res.empty()) {
                if (gt.find(static_cast<uint32_t>(res.top().second)) != gt.end()) ++hits;
                res.pop();
            }
            total_rec += (float)hits / k;
        }
        std::cout << "| pthreads=" << nthreads
                  << " | latency=" << total_lat / test_number << " us"
                  << " | recall=" << total_rec / test_number << " |\n";
    }

    // ================================================================
    // 策略 B: inter-query 批量并行 (替代 OpenMP parallel for)
    // ================================================================
    std::cout << "\n=========================================================\n";
    std::cout << "Strategy B: inter-query batch parallel [pthread]\n";
    std::cout << "  (atomic fetch_add dispatch, one pthread_create/join total)\n";
    std::cout << "=========================================================\n";

    for (int nthreads : {1, 2, 4, 8}) {
        std::vector<float> latencies, recalls;
        const auto t0 = std::chrono::high_resolution_clock::now();

        ivf_simd_batch_pthread(ivf_centroids, ivf_lists, base, test_query,
            vecdim, test_number, k, nprobe, nthreads,
            latencies, recalls, test_gt, test_gt_d);

        const auto t1 = std::chrono::high_resolution_clock::now();
        double wall_ms = std::chrono::duration<double, std::milli>(t1 - t0).count();

        float sum_lat = 0, sum_rec = 0;
        for (size_t i = 0; i < test_number; ++i) {
            sum_lat += latencies[i];
            sum_rec  += recalls[i];
        }
        std::cout << "| pthreads=" << nthreads
                  << " | wall=" << wall_ms << " ms"
                  << " | avg_latency=" << sum_lat / test_number << " us"
                  << " | recall=" << sum_rec / test_number << " |\n";
    }
    std::cout << "=========================================================\n";

    delete[] base; delete[] test_query; delete[] test_gt;
    return 0;
}

/*
============================================================================
与 OpenMP 原版 (IVF-baseline 优化.cc) 的结果对照:

原版 OpenMP:
  尝试 1 (粗排并行):  8 core → 928 μs  [负优化]
  尝试 2 (精排并行):  8 core → 223 μs  [~4x 加速, dynamic 调度]
  尝试 3 (批量并行):  8 core → 134 μs  [~8x 加速, 最优]

本版 Pthread (预期):
  策略 A (精排并行):  pthread 均分簇 → 与 OpenMP 尝试 2 相近
  策略 B (批量并行):  atomic fetch_add → 与 OpenMP 尝试 3 相近, 原子开销更低

perf 分析:
  perf stat -e cpu-cycles,instructions,cache-misses,context-switches ./main_ivf_pthread
  perf record -g --call-graph dwarf ./main_ivf_pthread
  perf annotate --stdio fine_parallel_worker
  perf annotate --stdio batch_ivf_worker
============================================================================
*/

/*
=========================================================
Strategy A: intra-query fine (cluster) parallel [pthread]
  (pthread_create/join per query, clusters split across threads)
=========================================================
| pthreads=1 | latency=1440 us | recall=0.97884 |
| pthreads=2 | latency=766 us | recall=0.97884 |
| pthreads=4 | latency=564 us | recall=0.97884 |
| pthreads=8 | latency=903 us | recall=0.97884 |

=========================================================
Strategy B: inter-query batch parallel [pthread]
  (atomic fetch_add dispatch, one pthread_create/join total)
=========================================================
| pthreads=1 | wall=8070.62 ms | avg_latency=804.291 us | recall=0.97884 |
| pthreads=2 | wall=3851.82 ms | avg_latency=767.637 us | recall=0.97884 |
| pthreads=4 | wall=2716.35 ms | avg_latency=1083.06 us | recall=0.97884 |
| pthreads=8 | wall=1603.96 ms | avg_latency=1277.75 us | recall=0.97884 |
=========================================================




*/
// ===========================================================================
// ANN Pthread + OpenMP 代表性入口
//
// 选择: 鲲鹏 ARM NEON 主线平台上端到端速度最快的配置
//   ivfpq_local + pthread_dynamic_inter + t=8, nlist=16, nprobe=4, p=1000
//   单 query 延迟 134.48 μs, Recall@10=0.9597 (见报告 §6.1 表 tab:best)
//
// 逻辑直接展开自 mains/ivf/pthread/dynamic/inter/main_ivfpq.cc 与
// mains/ivfpq_bench_common.h 的 RunInter, 所有参数硬编码以确保
// 在课程框架 `bash test.sh 2 1` 工作流下 (qsub 调用时无 argv) 仍按最快
// 配置运行.
//
// 编译: g++ main.cc -o main -O2 -fopenmp -lpthread -std=c++17 -I.
//        (鲲鹏 GCC 13 NEON 自动激活; 本地 x86 需追加 -mavx2 -mfma)
// 运行: bash test.sh 2 1  (会经 qsub 在单节点上提交并执行 ./main)
// 数据: /anndata/DEEP100K.{base.100k.fbin, query.fbin, gt.query.100k.top100.bin}
// ===========================================================================

#include <chrono>
#include <cstdint>
#include <iomanip>
#include <iostream>
#include <queue>
#include <set>
#include <string>
#include <utility>
#include <vector>

#include "simd/ann_bench_common.h"
#include "ivf/ivf_index.h"
#include "ivf/ivf_pq_simd.h"
#include "ivf/ivf_pq_pthread.h"

using SearchHeap = ann_ivf::SearchHeap;

int main(int /*argc*/, char** /*argv*/) {
    // 鲲鹏侧实测最快配置 (Recall@10>0.95 准入下端到端最低延迟)
    const int    nthreads = 8;
    const size_t nlist    = 16;
    const size_t nprobe   = 4;
    const size_t rerank_p = 1000;
    const auto   mode     = ann_ivfpq::BuildMode::IVFLocalPQ;
    const size_t k        = 10;

    // ---------------- 数据加载 ----------------
    size_t query_n = 0, query_d = 0;
    size_t gt_n    = 0, gt_dim  = 0;
    size_t base_n  = 0, base_d  = 0;
    const std::string data_path = ann_bench::DefaultDataPath();

    auto queries = ann_bench::LoadData<float>(
        data_path + "DEEP100K.query.fbin", query_n, query_d);
    auto gt = ann_bench::LoadData<int>(
        data_path + "DEEP100K.gt.query.100k.top100.bin", gt_n, gt_dim);
    auto base = ann_bench::LoadData<float>(
        data_path + "DEEP100K.base.100k.fbin", base_n, base_d);

    if (base_d != query_d) {
        std::cerr << "base/query dimension mismatch\n";
        return 1;
    }
    // 只测试前 2000 条查询 (与 SIMD 实验、课程框架保持一致)
    query_n = std::min<size_t>(query_n, 2000);
    const size_t d = query_d;

    // ---------------- 离线索引构建: IVF-PQ local ----------------
    ann_ivfpq::IVFPQIndex index;
    index.build(base.get(), base_n, d, nlist, mode, 8, 8);

    // ---------------- 在线查询: pthread_dynamic_inter ----------------
    std::vector<SearchHeap> results;
    const auto t_begin = std::chrono::high_resolution_clock::now();
    ivf_pq_search_inter_dynamic(index, queries.get(), query_n, k, nprobe,
                                rerank_p, nthreads, results);
    const auto t_end = std::chrono::high_resolution_clock::now();
    const double total_us =
        std::chrono::duration<double, std::micro>(t_end - t_begin).count();

    // ---------------- Recall@10 ----------------
    double total_recall = 0.0;
    for (size_t i = 0; i < query_n; ++i) {
        std::set<uint32_t> gtset;
        for (size_t j = 0; j < k; ++j) {
            gtset.insert(static_cast<uint32_t>(gt[i * gt_dim + j]));
        }
        size_t hits = 0;
        SearchHeap& heap = results[i];
        while (!heap.empty()) {
            const uint32_t id = heap.top().second;
            if (gtset.find(id) != gtset.end()) {
                ++hits;
            }
            heap.pop();
        }
        total_recall += static_cast<double>(hits) / static_cast<double>(k);
    }
    const double avg_recall  = total_recall / static_cast<double>(query_n);
    const double avg_latency = total_us / static_cast<double>(query_n);

    // ---------------- 输出 (与 ann_original/main.cc 一致) ----------------
    std::cout << std::fixed << std::setprecision(5);
    std::cout << "ivfpq_local_pthread_dynamic_inter"
              << ", nthreads=" << nthreads
              << ", nlist=" << nlist
              << ", nprobe=" << nprobe
              << ", p=" << rerank_p
              << ", mode=local\n";
    std::cout << "average recall: " << avg_recall << "\n";
    std::cout << "average latency (us): " << avg_latency << "\n";
    return 0;
}
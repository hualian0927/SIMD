
// //只测v2
// #include <vector>
// #include <cstring>
// #include <string>
// #include <iostream>
// #include <fstream>
// #include <set>
// #include <chrono>
// #include <iomanip>
// #include <sstream>
// #include <sys/time.h>
// #include <omp.h>
// #include "hnswlib/hnswlib/hnswlib.h"
// #include "flat_scan.h"
// // 可以自行添加需要的头文件

// #include<arm_neon.h>
// #include<queue>
// #include "hnswlib/hnswlib/simd_utils.h"
// #include "hnswlib/hnswlib/pq_train.h"
// #include "hnswlib/hnswlib/ivf_train.h"
// #include <arm_neon.h>


// using namespace hnswlib;


// template<typename T>
// T *LoadData(std::string data_path, size_t& n, size_t& d)
// {
//     std::ifstream fin;
//     fin.open(data_path, std::ios::in | std::ios::binary);
//     fin.read((char*)&n,4);
//     fin.read((char*)&d,4);
//     T* data = new T[n*d];
//     int sz = sizeof(T);
//     for(int i = 0; i < n; ++i){
//         fin.read(((char*)data + i*d*sz), d*sz);
//     }
//     fin.close();

//     std::cerr<<"load data "<<data_path<<"\n";
//     std::cerr<<"dimension: "<<d<<"  number:"<<n<<"  size_per_element:"<<sizeof(T)<<"\n";

//     return data;
// }

// struct SearchResult
// {
//     float recall;
//     int64_t latency; // 单位us
// };

// void build_index(float* base, size_t base_number, size_t vecdim)
// {
//     const int efConstruction = 150; // 为防止索引构建时间过长，efc建议设置200以下
//     const int M = 16; // M建议设置为16以下

//     HierarchicalNSW<float> *appr_alg;
//     InnerProductSpace ipspace(vecdim);
//     appr_alg = new HierarchicalNSW<float>(&ipspace, base_number, M, efConstruction);

//     appr_alg->addPoint(base, 0);
//     #pragma omp parallel for
//     for(int i = 1; i < base_number; ++i) {
//         appr_alg->addPoint(base + 1ll*vecdim*i, i);
//     }

//     char path_index[1024] = "files/hnsw.index";
//     appr_alg->saveIndex(path_index);
// }

// inline float InnerProduct_SIMD(const float* a, const float* b, size_t vecdim)
// {
//     float32x4_t sum4 = vdupq_n_f32(0.0f);

//     for (size_t i = 0; i < vecdim; i += 4) {
//         float32x4_t va = vld1q_f32(a + i);
//         float32x4_t vb = vld1q_f32(b + i);
//         sum4 = vmlaq_f32(sum4, va, vb); 
//     }

//     float tmp[4];
//     vst1q_f32(tmp, sum4);

//     return 1.0f - (tmp[0] + tmp[1] + tmp[2] + tmp[3]);


// }


// // 自定义的 SIMD 搜索逻辑（封装好的 InnerProductSIMDNeon）
// inline std::priority_queue<std::pair<float, int>> my_simd_search(
//     const float* base, const float* query, size_t base_number, size_t vecdim, size_t k) {
    
//     std::priority_queue<std::pair<float, int>> topk;

//     for (size_t i = 0; i < base_number; ++i) {
//         const float* current_base = base + i * vecdim;
        
//         // 直接调用 simd_utils.h 里的优雅版本函数
//         float dist = InnerProductSIMDNeon(query, current_base, vecdim);

//         if (topk.size() < k) {
//             topk.push({dist, i});
//         } else if (dist < topk.top().first) {
//             topk.pop();
//             topk.push({dist, i});
//         }
//     }
//     return topk;
// }

// const size_t P = 200;


// // 在参数列表最后增加 size_t P_size
// inline std::priority_queue<std::pair<float, int>> sq_simd_search(
//     const int8_t* sq_base, const int8_t* sq_query, 
//     const float* base, const float* query, 
//     size_t base_number, size_t vecdim, size_t k,
//     size_t P_size) {   // <--- 1. 修改这里，接收 P 参数 
    
//     // 粗排
//     std::priority_queue<std::pair<int32_t, int>> coarse_top_p;
    
//     // 遍历
//     for (size_t i = 0; i < base_number; ++i) {
//         int32_t proxy_dist = InnerProductSIMD_SQ(sq_query, sq_base + i * vecdim, vecdim);
        
//         // 2. 将原本的全局变量 P 替换为传入的 P_size [cite: 573-575]
//         if (coarse_top_p.size() < P_size) {
//             coarse_top_p.push({proxy_dist, i});
//         } else if (proxy_dist < coarse_top_p.top().first) {
//             coarse_top_p.pop();
//             coarse_top_p.push({proxy_dist, i});
//         }
//     }

//     // 精排逻辑保持不变...
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



// int main(int argc, char *argv[])
// {
//     size_t test_number = 0, base_number = 0;
//     size_t test_gt_d = 0, vecdim = 0;

//     std::string data_path = "/anndata/"; 
//     auto test_query = LoadData<float>(data_path + "DEEP100K.query.fbin", test_number, vecdim);
//     auto test_gt = LoadData<int>(data_path + "DEEP100K.gt.query.100k.top100.bin", test_number, test_gt_d);
//     auto base = LoadData<float>(data_path + "DEEP100K.base.100k.fbin", base_number, vecdim);
//     // 只测试前2000条查询
//     test_number = 10000;
//     // test_number = 10000;
//     const size_t k = 10;

//     std::vector<SearchResult> results;
//     results.resize(test_number);

//     // 如果你需要保存索引，可以在这里添加你需要的函数，你可以将下面的注释删除来查看pbs是否将build.index返回到你的files目录中
//     // 要保存的目录必须是files/*
//     // 每个人的目录空间有限，不需要的索引请及时删除，避免占空间太大
//     // 不建议在正式测试查询时同时构建索引，否则性能波动会较大
//     // 下面是一个构建hnsw索引的示例
//     // build_index(base, base_number, vecdim);

//     std::cerr << "[SQ] Start Symmetric Quantizing Datasets..." << std::endl;
//     size_t total_base_elements = base_number * vecdim;
    
//     // 1. 寻找全局最大绝对值
//     float global_max_abs = 0.0f;
//     for (size_t i = 0; i < total_base_elements; ++i) {
//         float abs_val = std::abs(base[i]);
//         if (abs_val > global_max_abs) global_max_abs = abs_val;
//     }
//     // 映射到 -127 ~ 127 的有符号空间
//     float scale = 127.0f / (global_max_abs + 1e-6f); 

//     // 2. 这里定义了有符号的 sq_base！
//     int8_t* sq_base = new int8_t[total_base_elements];
//     for (size_t i = 0; i < total_base_elements; ++i) {
//         float val = base[i] * scale;
//         if (val < -127.0f) val = -127.0f;
//         if (val > 127.0f) val = 127.0f;
//         sq_base[i] = static_cast<int8_t>(val);
//     }

//     // 3. 定义有符号的 sq_query！
//     size_t total_query_elements = test_number * vecdim;
//     int8_t* sq_query = new int8_t[total_query_elements];
//     for (size_t i = 0; i < total_query_elements; ++i) {
//         float val = test_query[i] * scale;
//         if (val < -127.0f) val = -127.0f;
//         if (val > 127.0f) val = 127.0f;
//         sq_query[i] = static_cast<int8_t>(val);
//     }
//     std::cerr << "[SQ] Symmetric Quantization Finished!" << std::endl;


  

 

//     // 查询测试代码
//     for(int i = 0; i < test_number; ++i) {
//         const unsigned long Converter = 1000 * 1000;
//         struct timeval val;
//         int ret = gettimeofday(&val, NULL);

//         // 该文件已有代码中你只能修改该函数的调用方式
//         // 可以任意修改函数名，函数参数或者改为调用成员函数，但是不能修改函数返回值。
        
//         // auto res = flat_search(base, test_query + i*vecdim, base_number, vecdim, k);

//         // auto res = my_simd_search(base, test_query + i*vecdim, base_number, vecdim, k);

//         // auto res = sq_simd_search(sq_base, sq_query + i * vecdim, base, test_query + i * vecdim, base_number, vecdim, k);

//         // auto res = pq_adc_search(pq_base, base, test_query + i * vecdim, base_number, vecdim, k,  M, K_pq, codebooks);

//         // auto res = ivf_pq_search(ivf_centroids, ivf_lists, pq_base, base, test_query + i * vecdim, vecdim, k, M, K_pq, codebooks);    
        
//         // 🎯 在这里设置你想测试的 P 值 (50, 100, 200, 500, 1000)
//         // auto res = ivf_pq_search(ivf_centroids, ivf_lists, pq_base, base, test_query + i * vecdim, vecdim, k, M, K_pq, codebooks_SoA);
//          size_t current_P = 200;
//         //auto res = ivf_pq_search(ivf_centroids, ivf_lists, pq_base, base, test_query + i * vecdim, vecdim, k, M, K_pq, codebooks_SoA,current_P);


//         // [测试 V2 时解开下面这行，注意 current_P 参数]
//          auto res = sq_simd_search(sq_base, sq_query + i * vecdim, base, test_query + i * vecdim, base_number, vecdim, k, current_P);
       
       
//         struct timeval newVal;
//         ret = gettimeofday(&newVal, NULL);
//         int64_t diff = (newVal.tv_sec * Converter + newVal.tv_usec) - (val.tv_sec * Converter + val.tv_usec);

//         std::set<uint32_t> gtset;
//         for(int j = 0; j < k; ++j){
//             int t = test_gt[j + i*test_gt_d];
//             gtset.insert(t);
//         }

//         size_t acc = 0;
//         while (res.size()) {   
//             int x = res.top().second;
//             if(gtset.find(x) != gtset.end()){
//                 ++acc;
//             }
//             res.pop();
//         }
//         float recall = (float)acc/k;

//         results[i] = {recall, diff};
//     }

//     float avg_recall = 0, avg_latency = 0;
//     for(int i = 0; i < test_number; ++i) {
//         avg_recall += results[i].recall;
//         avg_latency += results[i].latency;
//     }

//     // 浮点误差可能导致一些精确算法平均recall不是1
//     std::cout << "average recall: "<<avg_recall / test_number<<"\n";
//     std::cout << "average latency (us): "<<avg_latency / test_number<<"\n";
//     return 0;
// }













// 只测V5
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
// 可以自行添加需要的头文件

#include<arm_neon.h>
#include<queue>
#include "hnswlib/hnswlib/simd_utils.h"
#include "hnswlib/hnswlib/pq_train.h"
#include "hnswlib/hnswlib/ivf_train.h"
#include <arm_neon.h>


using namespace hnswlib;


template<typename T>
T *LoadData(std::string data_path, size_t& n, size_t& d)
{
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

    std::cerr<<"load data "<<data_path<<"\n";
    std::cerr<<"dimension: "<<d<<"  number:"<<n<<"  size_per_element:"<<sizeof(T)<<"\n";

    return data;
}

struct SearchResult
{
    float recall;
    int64_t latency; // 单位us
};

void build_index(float* base, size_t base_number, size_t vecdim)
{
    const int efConstruction = 150; // 为防止索引构建时间过长，efc建议设置200以下
    const int M = 16; // M建议设置为16以下

    HierarchicalNSW<float> *appr_alg;
    InnerProductSpace ipspace(vecdim);
    appr_alg = new HierarchicalNSW<float>(&ipspace, base_number, M, efConstruction);

    appr_alg->addPoint(base, 0);
    #pragma omp parallel for
    for(int i = 1; i < base_number; ++i) {
        appr_alg->addPoint(base + 1ll*vecdim*i, i);
    }

    char path_index[1024] = "files/hnsw.index";
    appr_alg->saveIndex(path_index);
}

inline float InnerProduct_SIMD(const float* a, const float* b, size_t vecdim)
{
    float32x4_t sum4 = vdupq_n_f32(0.0f);

    for (size_t i = 0; i < vecdim; i += 4) {
        float32x4_t va = vld1q_f32(a + i);
        float32x4_t vb = vld1q_f32(b + i);
        sum4 = vmlaq_f32(sum4, va, vb); 
    }

    float tmp[4];
    vst1q_f32(tmp, sum4);

    return 1.0f - (tmp[0] + tmp[1] + tmp[2] + tmp[3]);

    // // 假设维度是 8 的倍数，这是为了保证向量化操作不越界
    // assert(vecdim % 8 == 0); 

    // // 初始化两个 128-bit 累加寄存器（分别负责前 4 个和后 4 个 float），清零
    // float32x4_t sum_vec0 = vdupq_n_f32(0.0f);
    // float32x4_t sum_vec1 = vdupq_n_f32(0.0f);

    // // 循环展开：每次跨越 8 个浮点数
    // for (size_t i = 0; i < vecdim; i += 8) {
    //     // 从 b1 加载 8 个浮点数到两个 128-bit 寄存器
    //     float32x4_t b1_vec0 = vld1q_f32(b1 + i);
    //     float32x4_t b1_vec1 = vld1q_f32(b1 + i + 4);

    //     // 从 b2 加载 8 个浮点数到两个 128-bit 寄存器
    //     float32x4_t b2_vec0 = vld1q_f32(b2 + i);
    //     float32x4_t b2_vec1 = vld1q_f32(b2 + i + 4);

    //     // 核心优化 1：FMA 融合乘加指令！单周期完成乘法和累加
    //     // 等价于: sum_vec0 = sum_vec0 + (b1_vec0 * b2_vec0)
    //     sum_vec0 = vmlaq_f32(sum_vec0, b1_vec0, b2_vec0); 
        
    //     // 核心优化 2：指令级并行 (ILP)。
    //     // 现代 CPU 是超标量乱序执行的，sum_vec0 和 sum_vec1 的计算互相独立，
    //     // CPU 的多个运算单元可以同时“并发”处理这两条乘加指令！
    //     sum_vec1 = vmlaq_f32(sum_vec1, b1_vec1, b2_vec1);
    // }

    // // 将两个 128-bit 结果合并成一个 128-bit
    // float32x4_t final_sum_vec = vaddq_f32(sum_vec0, sum_vec1);

    // // 将最终的 4 个 float 结果写回内存数组
    // float tmp[4];
    // vst1q_f32(tmp, final_sum_vec);

    // // 在标量单元完成最后的水平累加 (极小开销)
    // float dot_product = tmp[0] + tmp[1] + tmp[2] + tmp[3];

    // return 1.0f - dot_product;
}


// 自定义的 SIMD 搜索逻辑（封装好的 InnerProductSIMDNeon）
inline std::priority_queue<std::pair<float, int>> my_simd_search(
    const float* base, const float* query, size_t base_number, size_t vecdim, size_t k) {
    
    std::priority_queue<std::pair<float, int>> topk;

    for (size_t i = 0; i < base_number; ++i) {
        const float* current_base = base + i * vecdim;
        
        // 直接调用 simd_utils.h 里的优雅版本函数
        float dist = InnerProductSIMDNeon(query, current_base, vecdim);

        if (topk.size() < k) {
            topk.push({dist, i});
        } else if (dist < topk.top().first) {
            topk.pop();
            topk.push({dist, i});
        }
    }
    return topk;
}

const size_t P = 200;

// inline std::priority_queue<std::pair<float, int>> sq_simd_search(
//     const int8_t* sq_base, const int8_t* sq_query, 
//     const float* base, const float* query, 
//     size_t base_number, size_t vecdim, size_t k) {   
//     // 粗排
//     std::priority_queue<std::pair<int32_t, int>> coarse_top_p;
    
//     // 遍历
//     for (size_t i = 0; i < base_number; ++i) {
//         int32_t proxy_dist = InnerProductSIMD_SQ(sq_query, sq_base + i * vecdim, vecdim);
        
//         if (coarse_top_p.size() < P) {
//             coarse_top_p.push({proxy_dist, i});
//         } else if (proxy_dist < coarse_top_p.top().first) {
//             coarse_top_p.pop();
//             coarse_top_p.push({proxy_dist, i});
//         }
//     }

//     // 精排
//     std::priority_queue<std::pair<float, int>> fine_top_k;
    
//     // 只计算P个候选人真实距离
//     while (!coarse_top_p.empty()) {
//         int candidate_idx = coarse_top_p.top().second;
//         coarse_top_p.pop();

//         // 计算真实距离
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
// 在参数列表最后增加 size_t P_size
inline std::priority_queue<std::pair<float, int>> sq_simd_search(
    const int8_t* sq_base, const int8_t* sq_query, 
    const float* base, const float* query, 
    size_t base_number, size_t vecdim, size_t k,
    size_t P_size) {   // <--- 1. 修改这里，接收 P 参数 
    
    // 粗排
    std::priority_queue<std::pair<int32_t, int>> coarse_top_p;
    
    // 遍历
    for (size_t i = 0; i < base_number; ++i) {
        int32_t proxy_dist = InnerProductSIMD_SQ(sq_query, sq_base + i * vecdim, vecdim);
        
        // 2. 将原本的全局变量 P 替换为传入的 P_size [cite: 573-575]
        if (coarse_top_p.size() < P_size) {
            coarse_top_p.push({proxy_dist, i});
        } else if (proxy_dist < coarse_top_p.top().first) {
            coarse_top_p.pop();
            coarse_top_p.push({proxy_dist, i});
        }
    }

    // 精排逻辑保持不变...
    std::priority_queue<std::pair<float, int>> fine_top_k;
    while (!coarse_top_p.empty()) {
        int candidate_idx = coarse_top_p.top().second;
        coarse_top_p.pop();
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



int main(int argc, char *argv[])
{
    size_t test_number = 0, base_number = 0;
    size_t test_gt_d = 0, vecdim = 0;

    std::string data_path = "/anndata/"; 
    auto test_query = LoadData<float>(data_path + "DEEP100K.query.fbin", test_number, vecdim);
    auto test_gt = LoadData<int>(data_path + "DEEP100K.gt.query.100k.top100.bin", test_number, test_gt_d);
    auto base = LoadData<float>(data_path + "DEEP100K.base.100k.fbin", base_number, vecdim);
    // 只测试前2000条查询
    test_number = 10000;
    // test_number = 10000;
    const size_t k = 10;

    std::vector<SearchResult> results;
    results.resize(test_number);

    // 如果你需要保存索引，可以在这里添加你需要的函数，你可以将下面的注释删除来查看pbs是否将build.index返回到你的files目录中
    // 要保存的目录必须是files/*
    // 每个人的目录空间有限，不需要的索引请及时删除，避免占空间太大
    // 不建议在正式测试查询时同时构建索引，否则性能波动会较大
    // 下面是一个构建hnsw索引的示例
    // build_index(base, base_number, vecdim);




    // // ====================乘积量化 PQ=====================
    // const int M = 4;        // 切分为 4 个子段 (每个子段 24 维)
    // const int K_pq = 256;   // 每个子段 256 个聚类中心 (刚好用 uint8_t 存)
    
    // // codebooks 存放所有的聚类中心数据
    // std::vector<float> codebooks(M * K_pq * (vecdim / M), 0.0f);
    
    // // 1. 训练 Codebooks (耗时操作，大约需要几秒钟)
    // train_pq(base, base_number, vecdim, M, K_pq, codebooks);
    
    // // 2. 将十万条 base 底库编码为极度压缩的 pq_base (每个向量只有 4 个 uint8_t！)
    // uint8_t* pq_base = encode_pq(base, base_number, vecdim, M, K_pq, codebooks);
    // // ==========================================


    // ==========================================
    // 离线阶段：IVF-PQ (倒排索引 + 乘积量化)
    // ==========================================

    // 1. 训练倒排表 (分 1000 个桶)
    const int K_ivf = 1000; 
    std::vector<float> ivf_centroids(K_ivf * vecdim, 0.0f);
    train_ivf(base, base_number, vecdim, K_ivf, ivf_centroids);
    std::vector<IVFList> ivf_lists = build_ivf(base, base_number, vecdim, K_ivf, ivf_centroids);

    // 2. 训练乘积量化 PQ (切 4 段)
    const int M = 4;        
    const int K_pq = 256;   
    std::vector<float> codebooks(M * K_pq * (vecdim / M), 0.0f);
    train_pq(base, base_number, vecdim, M, K_pq, codebooks);
    
    // 把所有人变成小巧的条形码
    uint8_t* pq_base = encode_pq(base, base_number, vecdim, M, K_pq, codebooks);

    // 🚀 【新增大招：AoS 转 SoA 数据布局】🚀
    std::vector<float> codebooks_SoA(codebooks.size(), 0.0f);
    size_t sub_dim = vecdim / M;
    for (int m = 0; m < M; ++m) {
        for (int c = 0; c < K_pq; ++c) {
            for (size_t d = 0; d < sub_dim; ++d) {
                // AoS 物理偏移: m * (K_pq * sub_dim) + c * sub_dim + d
                // SoA 物理偏移: m * (K_pq * sub_dim) + d * K_pq + c
                codebooks_SoA[m * K_pq * sub_dim + d * K_pq + c] = 
                    codebooks[m * K_pq * sub_dim + c * sub_dim + d];
            }
        }
    }
    // ==========================================

 

    // 查询测试代码
    for(int i = 0; i < test_number; ++i) {
        const unsigned long Converter = 1000 * 1000;
        struct timeval val;
        int ret = gettimeofday(&val, NULL);

        // 该文件已有代码中你只能修改该函数的调用方式
        // 可以任意修改函数名，函数参数或者改为调用成员函数，但是不能修改函数返回值。
        
        // auto res = flat_search(base, test_query + i*vecdim, base_number, vecdim, k);

        // auto res = my_simd_search(base, test_query + i*vecdim, base_number, vecdim, k);

        // auto res = sq_simd_search(sq_base, sq_query + i * vecdim, base, test_query + i * vecdim, base_number, vecdim, k);

        // auto res = pq_adc_search(pq_base, base, test_query + i * vecdim, base_number, vecdim, k,  M, K_pq, codebooks);

        // auto res = ivf_pq_search(ivf_centroids, ivf_lists, pq_base, base, test_query + i * vecdim, vecdim, k, M, K_pq, codebooks);    
        
        // 🎯 在这里设置你想测试的 P 值 (50, 100, 200, 500, 1000)
        // auto res = ivf_pq_search(ivf_centroids, ivf_lists, pq_base, base, test_query + i * vecdim, vecdim, k, M, K_pq, codebooks_SoA);
         size_t current_P = 2000;
        auto res = ivf_pq_search(ivf_centroids, ivf_lists, pq_base, base, test_query + i * vecdim, vecdim, k, M, K_pq, codebooks_SoA,current_P);


        // [测试 V2 时解开下面这行，注意 current_P 参数]
         //  res = sq_simd_search(sq_base, sq_query + i * vecdim, base, test_query + i * vecdim, base_number, vecdim, k, current_P);
       
       
        struct timeval newVal;
        ret = gettimeofday(&newVal, NULL);
        int64_t diff = (newVal.tv_sec * Converter + newVal.tv_usec) - (val.tv_sec * Converter + val.tv_usec);

        std::set<uint32_t> gtset;
        for(int j = 0; j < k; ++j){
            int t = test_gt[j + i*test_gt_d];
            gtset.insert(t);
        }

        size_t acc = 0;
        while (res.size()) {   
            int x = res.top().second;
            if(gtset.find(x) != gtset.end()){
                ++acc;
            }
            res.pop();
        }
        float recall = (float)acc/k;

        results[i] = {recall, diff};
    }

    float avg_recall = 0, avg_latency = 0;
    for(int i = 0; i < test_number; ++i) {
        avg_recall += results[i].recall;
        avg_latency += results[i].latency;
    }

    // 浮点误差可能导致一些精确算法平均recall不是1
    std::cout << "average recall: "<<avg_recall / test_number<<"\n";
    std::cout << "average latency (us): "<<avg_latency / test_number<<"\n";
    return 0;
}


// // 只测改良后的flat
// #include <vector>
// #include <cstring>
// #include <string>
// #include <iostream>
// #include <fstream>
// #include <set>
// #include <chrono>
// #include <iomanip>
// #include <sstream>
// #include <sys/time.h>
// #include <omp.h>
// #include "hnswlib/hnswlib/hnswlib.h"
// #include "flat_scan.h"
// // 可以自行添加需要的头文件

// #include<arm_neon.h>
// #include<queue>
// #include "hnswlib/hnswlib/simd_utils.h"
// #include "hnswlib/hnswlib/pq_train.h"
// #include "hnswlib/hnswlib/ivf_train.h"
// #include <arm_neon.h>


// using namespace hnswlib;


// template<typename T>
// T *LoadData(std::string data_path, size_t& n, size_t& d)
// {
//     std::ifstream fin;
//     fin.open(data_path, std::ios::in | std::ios::binary);
//     fin.read((char*)&n,4);
//     fin.read((char*)&d,4);
//     T* data = new T[n*d];
//     int sz = sizeof(T);
//     for(int i = 0; i < n; ++i){
//         fin.read(((char*)data + i*d*sz), d*sz);
//     }
//     fin.close();

//     std::cerr<<"load data "<<data_path<<"\n";
//     std::cerr<<"dimension: "<<d<<"  number:"<<n<<"  size_per_element:"<<sizeof(T)<<"\n";

//     return data;
// }

// struct SearchResult
// {
//     float recall;
//     int64_t latency; // 单位us
// };

// void build_index(float* base, size_t base_number, size_t vecdim)
// {
//     const int efConstruction = 150; // 为防止索引构建时间过长，efc建议设置200以下
//     const int M = 16; // M建议设置为16以下

//     HierarchicalNSW<float> *appr_alg;
//     InnerProductSpace ipspace(vecdim);
//     appr_alg = new HierarchicalNSW<float>(&ipspace, base_number, M, efConstruction);

//     appr_alg->addPoint(base, 0);
//     #pragma omp parallel for
//     for(int i = 1; i < base_number; ++i) {
//         appr_alg->addPoint(base + 1ll*vecdim*i, i);
//     }

//     char path_index[1024] = "files/hnsw.index";
//     appr_alg->saveIndex(path_index);
// }

// inline float InnerProduct_SIMD(const float* a, const float* b, size_t vecdim)
// {
//     float32x4_t sum4 = vdupq_n_f32(0.0f);

//     for (size_t i = 0; i < vecdim; i += 4) {
//         float32x4_t va = vld1q_f32(a + i);
//         float32x4_t vb = vld1q_f32(b + i);
//         sum4 = vmlaq_f32(sum4, va, vb); 
//     }

//     float tmp[4];
//     vst1q_f32(tmp, sum4);

//     return 1.0f - (tmp[0] + tmp[1] + tmp[2] + tmp[3]);

// }


// // 自定义的 SIMD 搜索逻辑（封装好的 InnerProductSIMDNeon）
// inline std::priority_queue<std::pair<float, int>> my_simd_search(
//     const float* base, const float* query, size_t base_number, size_t vecdim, size_t k) {
    
//     std::priority_queue<std::pair<float, int>> topk;

//     for (size_t i = 0; i < base_number; ++i) {
//         const float* current_base = base + i * vecdim;
        
//         // 直接调用 simd_utils.h 里的优雅版本函数
//         float dist = InnerProductSIMDNeon(query, current_base, vecdim);

//         if (topk.size() < k) {
//             topk.push({dist, i});
//         } else if (dist < topk.top().first) {
//             topk.pop();
//             topk.push({dist, i});
//         }
//     }
//     return topk;
// }

// const size_t P = 200;


// int main(int argc, char *argv[])
// {
//     size_t test_number = 0, base_number = 0;
//     size_t test_gt_d = 0, vecdim = 0;

//     std::string data_path = "/anndata/"; 
//     auto test_query = LoadData<float>(data_path + "DEEP100K.query.fbin", test_number, vecdim);
//     auto test_gt = LoadData<int>(data_path + "DEEP100K.gt.query.100k.top100.bin", test_number, test_gt_d);
//     auto base = LoadData<float>(data_path + "DEEP100K.base.100k.fbin", base_number, vecdim);
//     // 只测试前2000条查询
//     test_number = 3000;
//     // test_number = 10000;
//     const size_t k = 10;

//     std::vector<SearchResult> results;
//     results.resize(test_number);

//     // 如果你需要保存索引，可以在这里添加你需要的函数，你可以将下面的注释删除来查看pbs是否将build.index返回到你的files目录中
//     // 要保存的目录必须是files/*
//     // 每个人的目录空间有限，不需要的索引请及时删除，避免占空间太大
//     // 不建议在正式测试查询时同时构建索引，否则性能波动会较大
//     // 下面是一个构建hnsw索引的示例
//     // build_index(base, base_number, vecdim);

 
//     // 查询测试代码
//     for(int i = 0; i < test_number; ++i) {
//         const unsigned long Converter = 1000 * 1000;
//         struct timeval val;
//         int ret = gettimeofday(&val, NULL);

//         // 该文件已有代码中你只能修改该函数的调用方式
//         // 可以任意修改函数名，函数参数或者改为调用成员函数，但是不能修改函数返回值。
        
//         // auto res = flat_search(base, test_query + i*vecdim, base_number, vecdim, k);

//          auto res = my_simd_search(base, test_query + i*vecdim, base_number, vecdim, k);
       
//         struct timeval newVal;
//         ret = gettimeofday(&newVal, NULL);
//         int64_t diff = (newVal.tv_sec * Converter + newVal.tv_usec) - (val.tv_sec * Converter + val.tv_usec);

//         std::set<uint32_t> gtset;
//         for(int j = 0; j < k; ++j){
//             int t = test_gt[j + i*test_gt_d];
//             gtset.insert(t);
//         }

//         size_t acc = 0;
//         while (res.size()) {   
//             int x = res.top().second;
//             if(gtset.find(x) != gtset.end()){
//                 ++acc;
//             }
//             res.pop();
//         }
//         float recall = (float)acc/k;

//         results[i] = {recall, diff};
//     }

//     float avg_recall = 0, avg_latency = 0;
//     for(int i = 0; i < test_number; ++i) {
//         avg_recall += results[i].recall;
//         avg_latency += results[i].latency;
//     }

//     // 浮点误差可能导致一些精确算法平均recall不是1
//     std::cout << "average recall: "<<avg_recall / test_number<<"\n";
//     std::cout << "average latency (us): "<<avg_latency / test_number<<"\n";
//     return 0;
// }


// // 只测初始版本
// #include <vector>
// #include <cstring>
// #include <string>
// #include <iostream>
// #include <fstream>
// #include <set>
// #include <chrono>
// #include <iomanip>
// #include <sstream>
// #include <sys/time.h>
// #include <omp.h>
// #include "hnswlib/hnswlib/hnswlib.h"
// #include "flat_scan.h"
// // 可以自行添加需要的头文件

// #include<arm_neon.h>
// #include<queue>
// #include "hnswlib/hnswlib/simd_utils.h"
// #include "hnswlib/hnswlib/pq_train.h"
// #include "hnswlib/hnswlib/ivf_train.h"
// #include <arm_neon.h>


// using namespace hnswlib;


// template<typename T>
// T *LoadData(std::string data_path, size_t& n, size_t& d)
// {
//     std::ifstream fin;
//     fin.open(data_path, std::ios::in | std::ios::binary);
//     fin.read((char*)&n,4);
//     fin.read((char*)&d,4);
//     T* data = new T[n*d];
//     int sz = sizeof(T);
//     for(int i = 0; i < n; ++i){
//         fin.read(((char*)data + i*d*sz), d*sz);
//     }
//     fin.close();

//     std::cerr<<"load data "<<data_path<<"\n";
//     std::cerr<<"dimension: "<<d<<"  number:"<<n<<"  size_per_element:"<<sizeof(T)<<"\n";

//     return data;
// }

// struct SearchResult
// {
//     float recall;
//     int64_t latency; // 单位us
// };

// void build_index(float* base, size_t base_number, size_t vecdim)
// {
//     const int efConstruction = 150; // 为防止索引构建时间过长，efc建议设置200以下
//     const int M = 16; // M建议设置为16以下

//     HierarchicalNSW<float> *appr_alg;
//     InnerProductSpace ipspace(vecdim);
//     appr_alg = new HierarchicalNSW<float>(&ipspace, base_number, M, efConstruction);

//     appr_alg->addPoint(base, 0);
//     #pragma omp parallel for
//     for(int i = 1; i < base_number; ++i) {
//         appr_alg->addPoint(base + 1ll*vecdim*i, i);
//     }

//     char path_index[1024] = "files/hnsw.index";
//     appr_alg->saveIndex(path_index);
// }

// inline float InnerProduct_SIMD(const float* a, const float* b, size_t vecdim)
// {
//     float32x4_t sum4 = vdupq_n_f32(0.0f);

//     for (size_t i = 0; i < vecdim; i += 4) {
//         float32x4_t va = vld1q_f32(a + i);
//         float32x4_t vb = vld1q_f32(b + i);
//         sum4 = vmlaq_f32(sum4, va, vb); 
//     }

//     float tmp[4];
//     vst1q_f32(tmp, sum4);

//     return 1.0f - (tmp[0] + tmp[1] + tmp[2] + tmp[3]);

// }




// const size_t P = 200;


// int main(int argc, char *argv[])
// {
//     size_t test_number = 0, base_number = 0;
//     size_t test_gt_d = 0, vecdim = 0;

//     std::string data_path = "/anndata/"; 
//     auto test_query = LoadData<float>(data_path + "DEEP100K.query.fbin", test_number, vecdim);
//     auto test_gt = LoadData<int>(data_path + "DEEP100K.gt.query.100k.top100.bin", test_number, test_gt_d);
//     auto base = LoadData<float>(data_path + "DEEP100K.base.100k.fbin", base_number, vecdim);
//     // // 只测试前2000条查询
//     // test_number = 3000;

//     // 修改：如果命令行有参数，则使用参数值，否则默认 10000
//     if (argc > 1) {
//         test_number = std::stoul(argv[1]);
//     } else {
//         test_number = 10000;
//     }



//     // test_number = 10000;
//     const size_t k = 10;

//     std::vector<SearchResult> results;
//     results.resize(test_number);

//     // 如果你需要保存索引，可以在这里添加你需要的函数，你可以将下面的注释删除来查看pbs是否将build.index返回到你的files目录中
//     // 要保存的目录必须是files/*
//     // 每个人的目录空间有限，不需要的索引请及时删除，避免占空间太大
//     // 不建议在正式测试查询时同时构建索引，否则性能波动会较大
//     // 下面是一个构建hnsw索引的示例
//     // build_index(base, base_number, vecdim);

 
//     // 查询测试代码
//     for(int i = 0; i < test_number; ++i) {
//         const unsigned long Converter = 1000 * 1000;
//         struct timeval val;
//         int ret = gettimeofday(&val, NULL);

//         // 该文件已有代码中你只能修改该函数的调用方式
//         // 可以任意修改函数名，函数参数或者改为调用成员函数，但是不能修改函数返回值。
        
//         auto res = flat_search(base, test_query + i*vecdim, base_number, vecdim, k);

//         // auto res = my_simd_search(base, test_query + i*vecdim, base_number, vecdim, k);
       
//         struct timeval newVal;
//         ret = gettimeofday(&newVal, NULL);
//         int64_t diff = (newVal.tv_sec * Converter + newVal.tv_usec) - (val.tv_sec * Converter + val.tv_usec);

//         std::set<uint32_t> gtset;
//         for(int j = 0; j < k; ++j){
//             int t = test_gt[j + i*test_gt_d];
//             gtset.insert(t);
//         }

//         size_t acc = 0;
//         while (res.size()) {   
//             int x = res.top().second;
//             if(gtset.find(x) != gtset.end()){
//                 ++acc;
//             }
//             res.pop();
//         }
//         float recall = (float)acc/k;

//         results[i] = {recall, diff};
//     }

//     float avg_recall = 0, avg_latency = 0;
//     for(int i = 0; i < test_number; ++i) {
//         avg_recall += results[i].recall;
//         avg_latency += results[i].latency;
//     }

//     // 浮点误差可能导致一些精确算法平均recall不是1
//     std::cout << "average recall: "<<avg_recall / test_number<<"\n";
//     std::cout << "average latency (us): "<<avg_latency / test_number<<"\n";
//     return 0;
// }
















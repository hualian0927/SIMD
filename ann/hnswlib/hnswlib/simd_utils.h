#ifndef SIMD_UTILS_H
#define SIMD_UTILS_H

#include <arm_neon.h>
#include <cstdint>

// 封装 8 个单精度浮点数的 SIMD 结构体
struct simd8float32 {

    float32x4x2_t data;

    simd8float32() = default;

    // 广播构造：用同一个 float 初始化 8 个通道 (例如初始化为 0.0)
    explicit simd8float32(const float x) {
        data.val[0] = vdupq_n_f32(x);
        data.val[1] = vdupq_n_f32(x);
    }

    // 内存加载构造：从指针对齐读取 8 个 float
    explicit simd8float32(const float* x) {
        data.val[0] = vld1q_f32(x);
        data.val[1] = vld1q_f32(x + 4);
    }

    // 运算符重载：向量加法
    simd8float32 operator+(const simd8float32& other) const {
        simd8float32 res;
        res.data.val[0] = vaddq_f32(this->data.val[0], other.data.val[0]);
        res.data.val[1] = vaddq_f32(this->data.val[1], other.data.val[1]);
        return res;
    }

    // 运算符重载：向量乘法
    simd8float32 operator*(const simd8float32& other) const {
        simd8float32 res;
        res.data.val[0] = vmulq_f32(this->data.val[0], other.data.val[0]);
        res.data.val[1] = vmulq_f32(this->data.val[1], other.data.val[1]);
        return res;
    }

    // 将 8 个值存回普通的普通 float 数组
    void storeu(float* ptr) const {
        vst1q_f32(ptr, data.val[0]);
        vst1q_f32(ptr + 4, data.val[1]);
    }
};


#include <arm_neon.h>
inline float InnerProductSIMDNeon(const float* b1, const float* b2, size_t vecdim) {

    // simd8float32 sum(0.0f); 

    // // 每次跨度变为 8
    // for (size_t i = 0; i < vecdim; i += 8) {
    //     simd8float32 s1(b1 + i);
    //     simd8float32 s2(b2 + i);
    //     simd8float32 m = s1 * s2; // 优雅的对位相乘
    //     sum = sum + m;            // 优雅的累加
    // }

    // // 循环结束后，统一导出求和
    // float tmp[8];
    // sum.storeu(tmp);
    
    // float dot_product = tmp[0] + tmp[1] + tmp[2] + tmp[3] + 
    //                     tmp[4] + tmp[5] + tmp[6] + tmp[7];
                        
    // return 1.0f - dot_product;

    // 假设维度是 8 的倍数，这是为了保证向量化操作不越界
    assert(vecdim % 8 == 0); 

    // 初始化两个 128-bit 累加寄存器（分别负责前 4 个和后 4 个 float），清零
    float32x4_t sum_vec0 = vdupq_n_f32(0.0f);
    float32x4_t sum_vec1 = vdupq_n_f32(0.0f);

    // 循环展开：每次跨越 8 个浮点数
    for (size_t i = 0; i < vecdim; i += 8) {
        // 从 b1 加载 8 个浮点数到两个 128-bit 寄存器
        float32x4_t b1_vec0 = vld1q_f32(b1 + i);
        float32x4_t b1_vec1 = vld1q_f32(b1 + i + 4);

        // 从 b2 加载 8 个浮点数到两个 128-bit 寄存器
        float32x4_t b2_vec0 = vld1q_f32(b2 + i);
        float32x4_t b2_vec1 = vld1q_f32(b2 + i + 4);

        // 核心优化 1：FMA 融合乘加指令！单周期完成乘法和累加
        // 等价于: sum_vec0 = sum_vec0 + (b1_vec0 * b2_vec0)
        sum_vec0 = vmlaq_f32(sum_vec0, b1_vec0, b2_vec0); 
        
        // 核心优化 2：指令级并行 (ILP)。
        // 现代 CPU 是超标量乱序执行的，sum_vec0 和 sum_vec1 的计算互相独立，
        // CPU 的多个运算单元可以同时“并发”处理这两条乘加指令！
        sum_vec1 = vmlaq_f32(sum_vec1, b1_vec1, b2_vec1);
    }

    // 将两个 128-bit 结果合并成一个 128-bit
    float32x4_t final_sum_vec = vaddq_f32(sum_vec0, sum_vec1);

    // 将最终的 4 个 float 结果写回内存数组
    float tmp[4];
    vst1q_f32(tmp, final_sum_vec);

    // 在标量单元完成最后的水平累加 (极小开销)
    float dot_product = tmp[0] + tmp[1] + tmp[2] + tmp[3];

    return 1.0f - dot_product;
}

// 封装 16 个 int8_t (有符号整型) 的 SIMD 结构体
struct simd16int8 {
    int8x16_t data;
    simd16int8() = default;
    explicit simd16int8(const int8_t* x) {
        data = vld1q_s8(x); // _s8 代表 signed
    }
    // 累加到有符号 32位 寄存器中
    static inline void mac(int32x4_t& sum, const simd16int8& a, const simd16int8& b) {
        int16x8_t mul_low = vmull_s8(vget_low_s8(a.data), vget_low_s8(b.data));
        int16x8_t mul_high = vmull_s8(vget_high_s8(a.data), vget_high_s8(b.data));
        sum = vpadalq_s16(sum, mul_low);
        sum = vpadalq_s16(sum, mul_high);
    }
};

// 粗排：使用 INT8 计算代理内积距离
inline int32_t InnerProductSIMD_SQ(const int8_t* b1, const int8_t* b2, size_t vecdim) {
    // int32x4_t sum4 = vdupq_n_s32(0);
    // for (size_t i = 0; i < vecdim; i += 16) {
    //     simd16int8 s1(b1 + i);
    //     simd16int8 s2(b2 + i);
    //     simd16int8::mac(sum4, s1, s2);
    // }
    // int32_t tmp[4];
    // vst1q_s32(tmp, sum4);
    // return -(tmp[0] + tmp[1] + tmp[2] + tmp[3]); 

    // 1. 分配两个独立的 32位 累加寄存器
    int32x4_t sum_vec0 = vdupq_n_s32(0);
    int32x4_t sum_vec1 = vdupq_n_s32(0);

    // 2. 循环展开：步长提升至 32 (16 * 2)
    for (size_t i = 0; i < vecdim; i += 32) {
        // 加载第一组 16 个元素
        simd16int8 s1_a(b1 + i);
        simd16int8 s2_a(b2 + i);
        // 加载第二组 16 个元素
        simd16int8 s1_b(b1 + i + 16);
        simd16int8 s2_b(b2 + i + 16);

        // 核心优化：并行乘加
        // sum_vec0 和 sum_vec1 互不依赖，CPU 的两条流水线可以同时发射
        simd16int8::mac(sum_vec0, s1_a, s2_a);
        simd16int8::mac(sum_vec1, s1_b, s2_b);
    }

    // 3. 将两路结果合并
    int32x4_t final_sum_vec = vaddq_s32(sum_vec0, sum_vec1);

    int32_t tmp[4];
    vst1q_s32(tmp, final_sum_vec);
    
    // 返回代理距离 (注意符号转换)
    return -(tmp[0] + tmp[1] + tmp[2] + tmp[3]);
}

#endif // SIMD_UTILS_H
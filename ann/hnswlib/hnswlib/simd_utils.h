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

#endif // SIMD_UTILS_H

inline float InnerProductSIMDNeon(const float* b1, const float* b2, size_t vecdim) {

    simd8float32 sum(0.0f); 

    // 每次跨度变为 8
    for (size_t i = 0; i < vecdim; i += 8) {
        simd8float32 s1(b1 + i);
        simd8float32 s2(b2 + i);
        simd8float32 m = s1 * s2; // 优雅的对位相乘
        sum = sum + m;            // 优雅的累加
    }

    // 循环结束后，统一导出求和
    float tmp[8];
    sum.storeu(tmp);
    
    float dot_product = tmp[0] + tmp[1] + tmp[2] + tmp[3] + 
                        tmp[4] + tmp[5] + tmp[6] + tmp[7];
                        
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
    int32x4_t sum4 = vdupq_n_s32(0);
    for (size_t i = 0; i < vecdim; i += 16) {
        simd16int8 s1(b1 + i);
        simd16int8 s2(b2 + i);
        simd16int8::mac(sum4, s1, s2);
    }
    int32_t tmp[4];
    vst1q_s32(tmp, sum4);
    return -(tmp[0] + tmp[1] + tmp[2] + tmp[3]); 
}
#pragma once

#include <algorithm>
#include <cmath>
#include <cstddef>
#include <cstdint>
#include <cstring>
#include <fstream>
#include <iostream>
#include <limits>
#include <random>
#include <vector>

#if defined(__aarch64__) || defined(__ARM_NEON)
#include <arm_neon.h>
#endif

namespace fa_engine {

// ===================================================================
// Codec  —  Product Quantizer (M sub-spaces, ksub centres each)
// ===================================================================
struct Codec {
    int M = 0;       // number of sub-quantizers
    int ksub = 0;    // centres per sub-quantizer (max 256 for 8-bit codes)
    int dsub = 0;    // dimension of each sub-space = d / M
    std::vector<float> centroids;  // (M * ksub * dsub) floats
    std::vector<uint8_t> codes;    // n * M bytes

    // ----- k-means training per sub-space -----
    void build(const float* base, size_t n, size_t d, int M_, int ksub_,
               int niter) {
        M = M_;
        ksub = ksub_;
        dsub = static_cast<int>(d) / M;
        centroids.resize(static_cast<size_t>(M) * ksub * dsub);
        codes.resize(n * M);

        std::mt19937 rng(42);
        std::vector<float> subvecs(n * dsub);

        for (int m = 0; m < M; ++m) {
            for (size_t i = 0; i < n; ++i)
                std::memcpy(subvecs.data() + i * dsub,
                            base + i * d + m * dsub, dsub * sizeof(float));

            float* cent = centroids.data() + static_cast<size_t>(m) * ksub * dsub;

            for (int c = 0; c < ksub; ++c) {
                size_t idx = std::uniform_int_distribution<size_t>(0, n - 1)(rng);
                std::memcpy(cent + c * dsub, subvecs.data() + idx * dsub,
                            dsub * sizeof(float));
            }

            std::vector<uint32_t> assign(n);
            std::vector<float> sum_c(ksub * dsub);
            std::vector<size_t> cnt(ksub);

            for (int it = 0; it < niter; ++it) {
                for (size_t i = 0; i < n; ++i) {
                    float best = std::numeric_limits<float>::max();
                    uint32_t best_c = 0;
                    for (int c = 0; c < ksub; ++c) {
                        float dist = 0.0f;
                        const float* a = subvecs.data() + i * dsub;
                        const float* b = cent + c * dsub;
                        for (int j = 0; j < dsub; ++j) {
                            float diff = a[j] - b[j];
                            dist += diff * diff;
                        }
                        if (dist < best) {
                            best = dist;
                            best_c = static_cast<uint32_t>(c);
                        }
                    }
                    assign[i] = best_c;
                }
                std::fill(sum_c.begin(), sum_c.end(), 0.0f);
                std::fill(cnt.begin(), cnt.end(), 0);
                for (size_t i = 0; i < n; ++i) {
                    size_t c = assign[i];
                    for (int j = 0; j < dsub; ++j)
                        sum_c[c * dsub + j] += subvecs[i * dsub + j];
                    ++cnt[c];
                }
                for (int c = 0; c < ksub; ++c) {
                    if (cnt[c] == 0) continue;
                    float inv = 1.0f / static_cast<float>(cnt[c]);
                    for (int j = 0; j < dsub; ++j)
                        cent[c * dsub + j] = sum_c[c * dsub + j] * inv;
                }
            }

            for (size_t i = 0; i < n; ++i) {
                float best = std::numeric_limits<float>::max();
                uint8_t best_c = 0;
                for (int c = 0; c < ksub; ++c) {
                    float dist = 0.0f;
                    const float* a = subvecs.data() + i * dsub;
                    const float* b = cent + c * dsub;
                    for (int j = 0; j < dsub; ++j) {
                        float diff = a[j] - b[j];
                        dist += diff * diff;
                    }
                    if (dist < best) {
                        best = dist;
                        best_c = static_cast<uint8_t>(c);
                    }
                }
                codes[i * M + m] = best_c;
            }
        }
    }

    // ----- fill lookup table for a query -----
    // LUT layout: M rows of 256 floats each (stride = 256).
    // Only the first ksub entries per row are filled; codes are in [0, ksub).
    void fill_lut(const float* query, float* lut) const {
        for (int m = 0; m < M; ++m) {
            const float* cent = centroids.data() + static_cast<size_t>(m) * ksub * dsub;
            float* lut_m = lut + static_cast<size_t>(m) * 256;
            const float* q_sub = query + m * dsub;
            for (int c = 0; c < ksub; ++c) {
                const float* c_ptr = cent + c * dsub;
                float dist = 0.0f;
#if defined(__aarch64__) || defined(__ARM_NEON)
                float32x4_t dist4 = vdupq_n_f32(0.0f);
                int j = 0;
                for (; j + 4 <= dsub; j += 4) {
                    float32x4_t q4 = vld1q_f32(q_sub + j);
                    float32x4_t c4 = vld1q_f32(c_ptr + j);
                    float32x4_t diff4 = vsubq_f32(q4, c4);
                    dist4 = vmlaq_f32(dist4, diff4, diff4);
                }
                dist = vaddvq_f32(dist4);  // ARMv8 horizontal add, no stack spill
                for (; j < dsub; ++j) {
                    float diff = q_sub[j] - c_ptr[j];
                    dist += diff * diff;
                }
#else
                for (int j = 0; j < dsub; ++j) {
                    float diff = q_sub[j] - c_ptr[j];
                    dist += diff * diff;
                }
#endif
                lut_m[c] = dist;
            }
        }
    }

    // ---- serialization ----
    bool save(std::ostream& os) const {
        auto w = [&](const void* p, size_t sz) {
            os.write(reinterpret_cast<const char*>(p), sz);
            return !!os;
        };
        if (!w(&M, sizeof(M))) return false;
        if (!w(&ksub, sizeof(ksub))) return false;
        if (!w(&dsub, sizeof(dsub))) return false;
        size_t sz;
        sz = centroids.size(); if (!w(&sz, sizeof(sz)) || !w(centroids.data(), sz * sizeof(float))) return false;
        sz = codes.size(); if (!w(&sz, sizeof(sz)) || !w(codes.data(), sz * sizeof(uint8_t))) return false;
        return true;
    }

    bool load(std::istream& is) {
        auto r = [&](void* p, size_t sz) {
            is.read(reinterpret_cast<char*>(p), sz);
            return !!is;
        };
        if (!r(&M, sizeof(M))) return false;
        if (!r(&ksub, sizeof(ksub))) return false;
        if (!r(&dsub, sizeof(dsub))) return false;
        size_t sz;
        if (!r(&sz, sizeof(sz))) return false;
        centroids.resize(sz); if (sz && !r(centroids.data(), sz * sizeof(float))) return false;
        if (!r(&sz, sizeof(sz))) return false;
        codes.resize(sz); if (sz && !r(codes.data(), sz * sizeof(uint8_t))) return false;
        return true;
    }
};

// ===================================================================
// codec_dist  —  asymmetric distance computation
//
// M=8, ksub≤256. 纯标量, 编译器将 M=8 完全展开为 8 条 ldr + 7 条 fadd,
// L1 命中时 ~24 cycles/ADC.
// ===================================================================
inline float codec_dist(const float* lut, const uint8_t* codes, int M) {
    float sum = 0.0f;
    for (int m = 0; m < M; ++m)
        sum += lut[m * 256 + codes[m]];
    return sum;
}

}  // namespace fa_engine

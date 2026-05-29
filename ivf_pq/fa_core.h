#pragma once

#include <algorithm>
#include <cmath>
#include <cstddef>
#include <cstdint>
#include <cstring>
#include <fstream>
#include <iostream>
#include <limits>
#include <queue>
#include <random>
#include <utility>
#include <vector>

#if defined(__aarch64__) || defined(__ARM_NEON)
#include <arm_neon.h>
#endif

namespace fa_core {

// ---------- distance functions ----------
inline float l2_dist(const float* a, const float* b, size_t d) {
#if defined(__aarch64__) || defined(__ARM_NEON)
    float32x4_t sum4 = vdupq_n_f32(0.0f);
    size_t i = 0;
    for (; i + 4 <= d; i += 4) {
        float32x4_t va = vld1q_f32(a + i);
        float32x4_t vb = vld1q_f32(b + i);
        float32x4_t diff = vsubq_f32(va, vb);
        sum4 = vmlaq_f32(sum4, diff, diff);
    }
    float sum = vaddvq_f32(sum4);
    for (; i < d; ++i) {
        float diff = a[i] - b[i];
        sum += diff * diff;
    }
    return sum;
    for (; i < d; ++i) {
        float diff = a[i] - b[i];
        sum += diff * diff;
    }
    return sum;
#else
    float sum = 0.0f;
    for (size_t i = 0; i < d; ++i) {
        const float diff = a[i] - b[i];
        sum += diff * diff;
    }
    return sum;
#endif
}

inline float ip_dist(const float* a, const float* b, size_t d) {
#if defined(__aarch64__) || defined(__ARM_NEON)
    float32x4_t sum4 = vdupq_n_f32(0.0f);
    size_t i = 0;
    for (; i + 4 <= d; i += 4) {
        float32x4_t va = vld1q_f32(a + i);
        float32x4_t vb = vld1q_f32(b + i);
        sum4 = vmlaq_f32(sum4, va, vb);
    }
    float tmp[4];
    vst1q_f32(tmp, sum4);
    float sum = tmp[0] + tmp[1] + tmp[2] + tmp[3];
    for (; i < d; ++i)
        sum += a[i] * b[i];
    return 1.0f - sum;
#else
    float sum = 0.0f;
    for (size_t i = 0; i < d; ++i)
        sum += a[i] * b[i];
    return 1.0f - sum;
#endif
}

inline float vec_dist(const float* a, const float* b, size_t d) {
    return l2_dist(a, b, d);
}

// ---------- TopK (max-heap, top = worst among k-best) ----------
using TopK = std::priority_queue<std::pair<float, int>>;

inline void topk_push(TopK& heap, float dist, int id, size_t k) {
    if (heap.size() < k) {
        heap.emplace(dist, id);
    } else if (dist < heap.top().first) {
        heap.pop();
        heap.emplace(dist, id);
    }
}

inline TopK topk_merge(std::vector<TopK>& heaps, size_t keep) {
    TopK merged;
    for (auto& h : heaps) {
        while (!h.empty()) {
            auto p = h.top();
            h.pop();
            topk_push(merged, p.first, p.second, keep);
        }
    }
    return merged;
}

// ---------- ClusterIndex (inverted-file index) ----------
struct ClusterIndex {
    size_t nlist = 0;
    size_t d = 0;
    std::vector<float> centroids;
    std::vector<size_t> list_offsets;
    std::vector<float> reordered_base;
    std::vector<uint32_t> reordered_ids;

    void build(const float* base, size_t n, size_t dim, size_t nlist_,
               int niter) {
        nlist = nlist_;
        d = dim;

        // ---- k-means --------------------------------------------------
        centroids.resize(nlist * d);
        {
            std::mt19937 rng(42);
            std::uniform_int_distribution<size_t> pick(0, n - 1);
            for (size_t c = 0; c < nlist; ++c)
                std::memcpy(centroids.data() + c * d, base + pick(rng) * d,
                            d * sizeof(float));
        }

        std::vector<uint32_t> assign(n);
        std::vector<float> sum_c(nlist * d);
        std::vector<size_t> cnt(nlist);

        for (int it = 0; it < niter; ++it) {
            for (size_t i = 0; i < n; ++i) {
                float best = std::numeric_limits<float>::max();
                uint32_t best_c = 0;
                for (size_t c = 0; c < nlist; ++c) {
                    float dist =
                        l2_dist(base + i * d, centroids.data() + c * d, d);
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
                for (size_t j = 0; j < d; ++j)
                    sum_c[c * d + j] += base[i * d + j];
                ++cnt[c];
            }
            for (size_t c = 0; c < nlist; ++c) {
                if (cnt[c] == 0) continue;
                const float inv = 1.0f / static_cast<float>(cnt[c]);
                for (size_t j = 0; j < d; ++j)
                    centroids[c * d + j] = sum_c[c * d + j] * inv;
            }
        }

        // ---- inverted lists -------------------------------------------
        list_offsets.resize(nlist + 1, 0);
        for (size_t i = 0; i < n; ++i) ++list_offsets[assign[i] + 1];
        for (size_t c = 0; c < nlist; ++c)
            list_offsets[c + 1] += list_offsets[c];

        reordered_base.resize(n * d);
        reordered_ids.resize(n);
        std::vector<size_t> cur = list_offsets;
        for (size_t i = 0; i < n; ++i) {
            size_t c = assign[i];
            size_t pos = cur[c]++;
            reordered_ids[pos] = static_cast<uint32_t>(i);
            std::memcpy(reordered_base.data() + pos * d, base + i * d,
                        d * sizeof(float));
        }
    }

    std::vector<uint32_t> pick_lists(const float* query,
                                     size_t nprobe) const {
        std::vector<std::pair<float, uint32_t>> dists;
        dists.reserve(nlist);
        for (size_t c = 0; c < nlist; ++c)
            dists.emplace_back(
                l2_dist(query, centroids.data() + c * d, d),
                static_cast<uint32_t>(c));
        const size_t np = std::min(nprobe, nlist);
        std::partial_sort(dists.begin(), dists.begin() + np, dists.end());
        std::vector<uint32_t> probes;
        probes.reserve(np);
        for (size_t i = 0; i < np; ++i) probes.push_back(dists[i].second);
        return probes;
    }

    // ---- serialization ----
    bool save(std::ostream& os) const {
        auto w = [&](const void* p, size_t sz) {
            os.write(reinterpret_cast<const char*>(p), sz);
            return !!os;
        };
        if (!w(&nlist, sizeof(nlist))) return false;
        if (!w(&d, sizeof(d))) return false;

        size_t sz;
        sz = centroids.size();  if (!w(&sz, sizeof(sz)) || !w(centroids.data(), sz * sizeof(float))) return false;
        sz = list_offsets.size(); if (!w(&sz, sizeof(sz)) || !w(list_offsets.data(), sz * sizeof(size_t))) return false;
        sz = reordered_base.size(); if (!w(&sz, sizeof(sz)) || !w(reordered_base.data(), sz * sizeof(float))) return false;
        sz = reordered_ids.size(); if (!w(&sz, sizeof(sz)) || !w(reordered_ids.data(), sz * sizeof(uint32_t))) return false;
        return true;
    }

    bool load(std::istream& is) {
        auto r = [&](void* p, size_t sz) {
            is.read(reinterpret_cast<char*>(p), sz);
            return !!is;
        };
        if (!r(&nlist, sizeof(nlist))) return false;
        if (!r(&d, sizeof(d))) return false;

        size_t sz;
        if (!r(&sz, sizeof(sz))) return false;
        centroids.resize(sz); if (sz && !r(centroids.data(), sz * sizeof(float))) return false;
        if (!r(&sz, sizeof(sz))) return false;
        list_offsets.resize(sz); if (sz && !r(list_offsets.data(), sz * sizeof(size_t))) return false;
        if (!r(&sz, sizeof(sz))) return false;
        reordered_base.resize(sz); if (sz && !r(reordered_base.data(), sz * sizeof(float))) return false;
        if (!r(&sz, sizeof(sz))) return false;
        reordered_ids.resize(sz); if (sz && !r(reordered_ids.data(), sz * sizeof(uint32_t))) return false;
        return true;
    }
};

}  // namespace fa_core

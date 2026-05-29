#!/bin/bash
# ===========================================================================
# perf 分析脚本 — PQ pthread 并行查询
#
# 用法: bash perf_pq.sh
# 前提: 已编译 ./main_pq_pthread
#
# 输出:
#   perf_pq_stat.txt     - 硬件计数器 (IPC, cache, context-switch)
#   perf_pq_record.data  - 采样数据
#   perf_pq_report.txt   - 函数热点排行
#   perf_pq_annotate.txt - 汇编级注释
# ===========================================================================
set -e

BIN="./main_pq_pthread"
DATA="perf_pq_record.data"

if [ ! -f "$BIN" ]; then
    echo "Compile first:"
    echo "  g++ main_pq_pthread.cc -o main_pq_pthread -O2 -lpthread -std=c++17 -I.."
    exit 1
fi

echo "=== [1/4] perf stat ==="
perf stat \
    -e cpu-cycles \
    -e instructions \
    -e cache-references \
    -e cache-misses \
    -e L1-dcache-loads \
    -e L1-dcache-load-misses \
    -e LLC-loads \
    -e LLC-load-misses \
    -e branch-instructions \
    -e branch-misses \
    -e context-switches \
    -e cpu-migrations \
    -o perf_pq_stat.txt \
    -- $BIN
cat perf_pq_stat.txt

echo ""
echo "=== [2/4] perf record (sampling) ==="
perf record -g --call-graph dwarf -e cpu-cycles:pp -o "$DATA" -- $BIN
echo "   -> $DATA ($(du -sh $DATA | cut -f1))"

echo ""
echo "=== [3/4] perf report ==="
perf report -i "$DATA" --stdio --sort=symbol --percent-limit=1.0 > perf_pq_report.txt
head -60 perf_pq_report.txt

echo ""
echo "=== [4/4] perf annotate (top hot functions) ==="
{
    echo "============================================================"
    echo " PQ pthread — assembly-level hot-spot analysis"
    echo " Key functions to check:"
    echo "   intra_chunk_worker  — strategy A: base chunk scanning"
    echo "   batch_worker        — strategy B: inter-query dispatch"
    echo "   InnerProductSIMDNeon — exact rerank (NEON)"
    echo "============================================================"
    echo ""
} > perf_pq_annotate.txt

for func in intra_chunk_worker batch_worker pq_adc_search_intra_pthread; do
    echo "--- $func ---" >> perf_pq_annotate.txt
    perf annotate -i "$DATA" --stdio --symbol="$func" 2>/dev/null >> perf_pq_annotate.txt || \
        echo "(not found or inlined)" >> perf_pq_annotate.txt
    echo "" >> perf_pq_annotate.txt
done
echo "   -> perf_pq_annotate.txt"

echo ""
echo "All done. Quick manual checks:"
echo "  perf annotate -i $DATA --stdio intra_chunk_worker"
echo "  perf annotate -i $DATA --stdio batch_worker"
echo "  perf stat -e cpu-cycles,instructions,cache-misses,cpu-migrations -I 200 $BIN"

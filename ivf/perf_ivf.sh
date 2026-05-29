#!/bin/bash
# ===========================================================================
# perf 分析 — IVF pthread 并行检索
# 用法: bash perf_ivf.sh
# 前提: 已编译 ./main_ivf_pthread
# ===========================================================================
set -e

BIN="./main_ivf_pthread"
DATA="perf_ivf_record.data"

if [ ! -f "$BIN" ]; then
    echo "Compile first:"
    echo "  g++ main_ivf_baseline_pthread.cc -o main_ivf_pthread -O2 -lpthread -std=c++17 -I.."
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
    -o perf_ivf_stat.txt \
    -- $BIN
cat perf_ivf_stat.txt

echo ""
echo "=== [2/4] perf record ==="
perf record -g --call-graph dwarf -e cpu-cycles:pp -o "$DATA" -- $BIN
echo "   -> $DATA ($(du -sh $DATA | cut -f1))"

echo ""
echo "=== [3/4] perf report ==="
perf report -i "$DATA" --stdio --sort=symbol --percent-limit=1.0 > perf_ivf_report.txt
head -50 perf_ivf_report.txt

echo ""
echo "=== [4/4] perf annotate ==="
{
    echo "============================================================"
    echo " IVF pthread — assembly-level analysis"
    echo " Key functions:"
    echo "   fine_parallel_worker — Strategy A: cluster scan with local heap"
    echo "   batch_ivf_worker    — Strategy B: inter-query atomic dispatch"
    echo "   InnerProductSIMDNeon — exact distance (NEON)"
    echo "============================================================"
} > perf_ivf_annotate.txt

for func in fine_parallel_worker batch_ivf_worker InnerProductSIMDNeon; do
    echo "--- $func ---" >> perf_ivf_annotate.txt
    perf annotate -i "$DATA" --stdio --symbol="$func" 2>/dev/null >> perf_ivf_annotate.txt || \
        echo "(not found or inlined)" >> perf_ivf_annotate.txt
    echo "" >> perf_ivf_annotate.txt
done
echo "   -> perf_ivf_annotate.txt"

echo ""
echo "Done. Manual checks:"
echo "  perf annotate -i $DATA --stdio fine_parallel_worker"
echo "  perf annotate -i $DATA --stdio batch_ivf_worker"
echo "  perf report -i $DATA --stdio --sort=pid     # per-thread distribution"
echo "  perf stat -e cpu-cycles,instructions,cache-misses -I 500 $BIN"

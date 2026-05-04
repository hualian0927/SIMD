import subprocess
import re
import time

# 配置测试参数
test_numbers = [2000, 3000, 4000, 5000, 6000, 7000, 8000, 9000, 10000]
output_file = "latency_data.csv"

def run_once():
    """运行一次脚本并提取延迟数据"""
    try:
        # 调用你的运行脚本
        process = subprocess.Popen(["./test.sh", "1", "1"], 
                                   stdout=subprocess.PIPE, 
                                   stderr=subprocess.PIPE, 
                                   text=True)
        stdout, stderr = process.communicate()
        
        # 从输出或错误流中匹配延迟数值
        match = re.search(r"average latency \(us\): ([\d.]+)", stdout + stderr)
        if match:
            return float(match.group(1))
    except Exception as e:
        print(f"执行出错: {e}")
    return None

# 打印表头
print(f"{'Test_Num':<10} | {'Run_1 (us)':<12} | {'Run_2 (us)':<12} | {'Average (us)':<12}")
print("-" * 55)

with open(output_file, "w") as f:
    f.write("test_number,run1_latency,run2_latency,avg_latency\n")
    
    for num in test_numbers:
        # ⚠️ 注意：如果你的 main.cc 没改 argv，你需要在每次运行前手动编译或修改源码
        # 假设你已经处理好了 test_number 的动态变更
        
        val1 = run_once()
        val2 = run_once()
        
        if val1 is not None and val2 is not None:
            avg = (val1 + val2) / 2
            # 终端实时输出
            print(f"{num:<10} | {val1:<12.2f} | {val2:<12.2f} | {avg:<12.2f}")
            # 记录到 CSV 文件
            f.write(f"{num},{val1},{val2},{avg}\n")
        else:
            print(f"{num:<10} | 数据提取失败")

print("-" * 55)
print(f"所有数据已记录至: {output_file}")
#!/bin/bash

# 递归查找并在对应目录中运行 /app 目录下的所有 .py 文件
find /app -name "*.py" | while read script; do
    script_dir=$(dirname "$script")  # 获取脚本所在的目录
    
    # 检查该目录下是否有 requirements.txt 并安装依赖
    if [ -f "$script_dir/requirements.txt" ]; then
        echo "发现 $script_dir/requirements.txt，正在安装依赖..."
        pip install -r "$script_dir/requirements.txt"
    fi

    echo "正在后台运行脚本: $script (目录: $script_dir)"
    
    # 切换到脚本所在目录并后台运行脚本
    (cd "$script_dir" && python "$script") &
done

# 等待所有后台任务完成
wait

#!/bin/bash

# 目标文件路径
FILE="./s5"

# 目标URL
URL="https://raw.githubusercontent.com/Ryan-gsq/s5/main/s5"

# 检查文件是否存在
if [ -f "$FILE" ]; then
    echo "$FILE exists. Removing the file."
    rm "$FILE"
else
    echo "$FILE does not exist. Downloading from $URL."
    # 使用curl下载文件
    curl -o "$FILE" "$URL"
    if [ $? -ne 0 ]; then
        echo "Failed to download the file."
        exit 1
    fi
fi

#开放端口
ufw allow 8278/tcp

# 给予执行权限
chmod +x "$FILE"

# 启动s5
echo "Starting s5..."

# 此处应根据s5的运行方式调整，如果s5需要在后台运行，请将最后一行改为:
nohup ./s5 &
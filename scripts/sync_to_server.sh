#!/bin/bash
# 中科同志科技 - 新闻自动同步到服务器脚本
# 每次新闻更新后自动执行

SERVER_IP="8.136.211.72"
SERVER_USER="administrator"
SERVER_PASS="tonzh1188CN"
LOCAL_NEWS="/home/admin/.openclaw/workspace/tonzh-website/admin/news.json"
REMOTE_NEWS="/cygdrive/c/inetpub/wwwroot/admin/news.json"

echo "开始同步新闻数据到服务器..."
echo "时间：$(date)"

# 使用 sshpass 和 scp 同步文件
sshpass -p "$SERVER_PASS" scp -o StrictHostKeyChecking=no "$LOCAL_NEWS" "$SERVER_USER@$SERVER_IP:$REMOTE_NEWS"

if [ $? -eq 0 ]; then
    echo "✓ 新闻数据同步成功！"
    echo "服务器文件：$REMOTE_NEWS"
else
    echo "✗ 同步失败，请检查网络连接"
    exit 1
fi

# 验证文件
sshpass -p "$SERVER_PASS" ssh -o StrictHostKeyChecking=no "$SERVER_USER@$SERVER_IP" "powershell -Command \"Get-Content '$REMOTE_NEWS' | Measure-Object -Line\"" 2>/dev/null

echo "同步完成！"

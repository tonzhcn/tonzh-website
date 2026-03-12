# 新闻自动更新系统

## 功能说明

自动搜集半导体行业、SMT、PCB 设备相关新闻，每天更新到网站新闻动态栏目。

## 配置

### 1. 栏目设置
- **行业动态**：每天 2 篇
- **技术动态**：每天 2 篇

### 2. 搜索关键词
根据网站产品分类自动匹配关键词。

### 3. 内容过滤
- 同行公司名称 → 替换为"XXXX 公司"
- 同行产品型号 → 替换为"XXXX 系列"

## 定时任务

### 执行时间
- 行业动态：09:00、15:00
- 技术动态：11:00、20:00

### 配置 Cron

```bash
# 编辑 crontab
crontab -e

# 添加定时任务（每天 4 次）
0 9 * * * cd /home/admin/.openclaw/workspace/tonzh-website && python3 scripts/news_auto_update.py >> logs/news_update.log 2>&1
0 11 * * * cd /home/admin/.openclaw/workspace/tonzh-website && python3 scripts/news_auto_update.py >> logs/news_update.log 2>&1
0 15 * * * cd /home/admin/.openclaw/workspace/tonzh-website && python3 scripts/news_auto_update.py >> logs/news_update.log 2>&1
0 20 * * * cd /home/admin/.openclaw/workspace/tonzh-website && python3 scripts/news_auto_update.py >> logs/news_update.log 2>&1
```

## 手动执行

```bash
cd /home/admin/.openclaw/workspace/tonzh-website
python3 scripts/news_auto_update.py
```

## 新闻文件位置

`admin/news.json` - 新闻数据文件

## 注意事项

1. 首次运行需要创建 logs 目录
2. 确保 Python3 已安装
3. 确保有网络访问权限（用于搜索新闻）
4. 定期备份 news.json 文件

## 日志查看

```bash
tail -f logs/news_update.log
```

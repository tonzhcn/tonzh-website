# 中科同志科技 - 新闻自动更新脚本
# 每天执行 2 次（9:00 和 15:00）

$newsFile = "C:\inetpub\wwwroot\admin\news.json"

# 关键词
$keywords = @{
    "行业动态" = @("半导体封装设备", "IGBT 封装", "SiC 功率器件", "SMT 设备", "PCB 设备")
    "技术动态" = @("真空共晶炉技术", "银烧结工艺", "TCB 热压键合", "半导体焊接技术")
}

# 文章模板
$templates = @{
    "行业动态" = @(
        "据行业媒体报道，{0}领域近期迎来新的发展机遇。随着下游应用需求的持续增长，相关设备制造商正加大研发投入，提升产品性能。",
        "最新市场研究显示，{0}市场规模持续扩大。受益于新能源汽车、光伏储能等行业的快速发展，需求旺盛。"
    )
    "技术动态" = @(
        "技术专家指出，{0}工艺参数优化对提升产品良率至关重要。通过精确控制温度曲线、真空度等关键参数，可有效降低焊接空洞率。",
        "研发团队在{0}领域取得新的技术突破，新型设计方案在保持高可靠性的同时，显著提升了生产效率。"
    )
}

# 加载现有新闻
try {
    $news = Get-Content $newsFile -Encoding UTF8 | ConvertFrom-Json
} catch {
    $news = @()
}

# 生成新新闻
foreach ($cat in $keywords.Keys) {
    $selectedKws = Get-Random -InputObject $keywords[$cat] -Count 2
    foreach ($kw in $selectedKws) {
        $template = Get-Random -InputObject $templates[$cat]
        $content = $template -f $kw
        $newsItem = [PSCustomObject]@{
            "id" = (Get-Date -Format "yyyyMMddHHmmss") + (Get-Random -Min 1000 -Max 9999)
            "title" = "$kw 最新进展"
            "date" = (Get-Date -Format "yyyy-MM-dd")
            "category" = $cat
            "excerpt" = $content.Substring(0, [Math]::Min(100, $content.Length)) + "..."
            "content" = $content
            "author" = "编辑部"
            "views" = (Get-Random -Min 100 -Max 500)
        }
        $news = @($newsItem) + $news
    }
}

# 保留最近 50 条
$news = $news | Select-Object -First 50

# 保存
$news | ConvertTo-Json -Depth 10 -EscapeHandling Default | Set-Content $newsFile -Encoding UTF8

Write-Host "新闻更新完成，共 $($news.Count) 条"

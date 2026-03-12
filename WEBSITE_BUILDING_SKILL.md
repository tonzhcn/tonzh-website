# 网站建设通用技能 (Website Building Skill)

> **通用技能**：本技能包含完整的网站建设流程、广告法合规、部署规范，可复用于任意企业官网建设项目。

---

## 📋 技能概述

### 适用范围
- 企业官方网站建设
- 产品展示型网站
- 静态网站 + CMS 后台管理
- 多站点批量建设（10-20 个网站）

### 核心技术栈
- **前端**：HTML5 + CSS3 + JavaScript（原生）
- **CMS**：Decap CMS（静态站点管理）
- **托管**：Vercel / IIS / Nginx
- **版本控制**：GitHub
- **部署**：Windows/Linux 双平台支持

---

## 🏗️ 网站建设标准流程

### 第一阶段：需求分析（Day 1）

#### 1.1 信息收集清单
```markdown
## 客户信息
- [ ] 公司全名
- [ ] 品牌名称/LOGO
- [ ] 联系方式（电话、邮箱、地址）
- [ ] 域名（是否已备案）

## 网站定位
- [ ] 网站类型（企业官网/产品展示/营销型）
- [ ] 目标用户群体
- [ ] 核心目标（品牌展示/获客/销售）

## 内容结构
- [ ] 需要哪些页面（首页/关于/产品/新闻/联系）
- [ ] 产品分类及数量
- [ ] 是否有现成文案/图片

## 技术要求
- [ ] 服务器环境（Windows IIS / Linux Nginx）
- [ ] 是否需要后台管理
- [ ] 是否需要多语言
- [ ] 是否需要自动更新功能
```

#### 1.2 网站结构规划
```
标准企业网站结构：
├── 首页 (/)
├── 关于我们 (/about/)
├── 产品中心 (/products/)
│   ├── 分类 1 (/products/category-1/)
│   └── 分类 2 (/products/category-2/)
├── 新闻动态 (/news/)
├── 联系我们 (/contact/)
└── 后台管理 (/admin/)
```

---

### 第二阶段：设计开发（Day 2-3）

#### 2.1 设计规范模板

##### 品牌色彩
```css
:root {
  --primary-color: #0056B3;    /* 主色 - 科技蓝 */
  --secondary-color: #D4AF37;  /* 辅助色 - 专利金 */
  --dark-color: #003366;       /* 深色 - 渐变用 */
  --light-color: #f5f5f5;      /* 浅色背景 */
  --text-color: #333333;       /* 正文颜色 */
  --text-light: #666666;       /* 次要文字 */
}
```

##### 响应式断点
```css
/* 移动端 */
@media (max-width: 768px) { }

/* 平板 */
@media (min-width: 769px) and (max-width: 1024px) { }

/* 桌面 */
@media (min-width: 1025px) { }
```

#### 2.2 标准页面模板

##### 首页模板要素
- [ ] 顶部导航（Logo + 菜单）
- [ ] Banner 轮播/主视觉
- [ ] 核心产品/服务展示
- [ ] 公司简介摘要
- [ ] 新闻动态摘要
- [ ] 底部信息（版权 + 联系方式）

##### 产品详情页模板
- [ ] 产品图片展示区
- [ ] 产品名称 + 定位
- [ ] 核心优势/特点
- [ ] 技术参数表格
- [ ] 典型应用场景
- [ ] 厂务需求（如适用）
- [ ] CTA 按钮（联系咨询）
- [ ] 返回上级栏目链接

##### 关于我们模板
- [ ] 公司简介
- [ ] 企业愿景/使命/价值观
- [ ] 发展历程
- [ ] 核心资质/荣誉
- [ ] 技术实力
- [ ] 团队介绍（可选）
- [ ] 合作伙伴（可选）

#### 2.3 广告法合规检查（必须执行）

##### 违禁词全量检查命令
```bash
# 一键全量检查
grep -rnE "第一 | 第一名 | 第一家 | 首个 | 首次 | 首位 | 最 [佳好新大小高低快强先进] | 领先 | 首家 | 唯一 | 独家 | 国家级 | 国际级 | 一流 | 顶级 | 极品 | 绝对|100%|万能 | 永久 | 零风险 | 无风险" --include="*.html" .

# 分类检查
grep -rn "第一\|第一家\|第一名\|首个\|首次\|首位" --include="*.html" .
grep -rn "最[佳好新大小高低快强]" --include="*.html" .
grep -rn "领先\|首家\|唯一\|独家" --include="*.html" .
grep -rn "国家级\|国际级\|一流\|顶级" --include="*.html" .
```

##### 违禁词替换对照表
| 违禁词类别 | 示例 | 替换方案 |
|-----------|------|----------|
| "第一"系列 | 第一、第一名、第一家、首个 | 删除或替换为"较早" |
| "最"系列 | 最好、最佳、最新、最大 | 优秀/优良/当前/大 |
| "领先"系列 | 全球领先、行业领先 | 先进/前列 |
| "首家"系列 | 国内首家、行业首家 | 较早提供 |
| "唯一"系列 | 国内唯一、独家 | 专业提供 |
| "级"系列 | 国家级、国际级 | 省/市级或删除 |
| 其他 | 一流、顶级、100% | 优质/高端/高比例 |
| 特殊保留 | 首台套 | **允许使用**（国家奖项） |

---

### 第三阶段：部署上线（Day 4）

#### 3.1 GitHub 仓库配置

##### 标准目录结构
```
project-name/
├── index.html              # 首页
├── about/
│   └── index.html          # 关于我们
├── products/
│   ├── index.html          # 产品中心
│   └── category-name/      # 产品类目
│       └── index.html      # 类目页
├── news/
│   └── index.html          # 新闻动态
├── contact/
│   └── index.html          # 联系我们
├── admin/
│   ├── index.html          # CMS 后台
│   ├── config.yml          # CMS 配置
│   └── news.json           # 新闻数据
├── css/
│   └── style.css           # 样式文件
├── js/
│   └── main.js             # 脚本文件
├── images/                 # 图片资源
└── README.md               # 项目说明
```

##### Git 初始化命令
```bash
cd /path/to/website
git init
git add -A
git commit -m "Initial commit - [网站名称] 官网"
git branch -M main
git remote add origin https://github.com/[username]/[repo].git
git push -u origin main
```

#### 3.2 Windows IIS 部署

##### 服务器准备
```powershell
# 创建网站目录
New-Item -ItemType Directory -Path "C:\inetpub\wwwroot\[site-name]" -Force

# 设置权限（如需要）
icacls "C:\inetpub\wwwroot\[site-name]" /grant "IIS_IUSRS:(OI)(CI)F"
```

##### 文件上传方法（base64 传输）
```bash
# 单个文件上传
base64 file.html | sshpass -p '[password]' ssh user@[server-ip] \
  "powershell -Command \"[System.Text.Encoding]::UTF8.GetString(
   [System.Convert]::FromBase64String([Console]::In.ReadToEnd())) | 
   Out-File -FilePath 'C:\\inetpub\\wwwroot\\[site]\\file.html' -Encoding UTF8\""

# 批量上传脚本
for file in *.html; do
  base64 "$file" | sshpass -p '[password]' ssh user@[server-ip] \
    "powershell -Command \"[System.Text.Encoding]::UTF8.GetString(
     [System.Convert]::FromBase64String([Console]::In.ReadToEnd())) | 
     Out-File -FilePath 'C:\\inetpub\\wwwroot\\[site]\\$file' -Encoding UTF8\""
done
```

##### 验证部署
```bash
# 检查文件行数
sshpass -p '[password]' ssh user@[server-ip] \
  "powershell -Command \"(Get-Content 'C:\\inetpub\\wwwroot\\[site]\\file.html' | 
   Measure-Object -Line).Lines\""

# 检查关键词
sshpass -p '[password]' ssh user@[server-ip] \
  "powershell -Command \"Get-Content 'C:\\inetpub\\wwwroot\\[site]\\file.html' | 
   Select-String '关键词' | Select-Object -First 1\""
```

#### 3.3 Linux Nginx 部署

##### Nginx 配置模板
```nginx
server {
    listen 80;
    server_name example.com www.example.com;
    root /var/www/[site-name];
    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }

    # 静态资源缓存
    location ~* \.(jpg|jpeg|png|gif|ico|css|js)$ {
        expires 30d;
        add_header Cache-Control "public, immutable";
    }

    # Gzip 压缩
    gzip on;
    gzip_types text/plain text/css application/json application/javascript text/xml application/xml;
}
```

##### 部署命令
```bash
# 上传文件
scp -r * user@server:/var/www/[site-name]/

# 设置权限
sudo chown -R www-data:www-data /var/www/[site-name]
sudo chmod -R 755 /var/www/[site-name]

# 重启 Nginx
sudo systemctl restart nginx
```

#### 3.4 Vercel 部署（推荐）

##### 一键部署
```bash
# 安装 Vercel CLI
npm i -g vercel

# 登录
vercel login

# 部署
cd /path/to/website
vercel --prod
```

##### 自动部署配置
```json
// vercel.json
{
  "version": 2,
  "builds": [
    { "src": "**/*.html", "use": "@vercel/static" }
  ],
  "routes": [
    { "handle": "filesystem" },
    { "src": "/(.*)", "status": 404, "dest": "/404.html" }
  ]
}
```

---

### 第四阶段：功能扩展（可选）

#### 4.1 新闻自动更新系统

##### 数据结构（news.json）
```json
{
  "articles": [
    {
      "id": 1,
      "title": "新闻标题",
      "date": "2026-03-12",
      "category": "行业动态",
      "summary": "新闻摘要",
      "content": "详细内容",
      "source": "来源"
    }
  ]
}
```

##### Windows 任务计划配置
```batch
:: auto_update.bat
@echo off
cd /d C:\scripts
powershell -ExecutionPolicy Bypass -File auto_update_news.ps1 >> update_log.txt 2>&1
```

```powershell
# auto_update_news.ps1
# 1. 从 GitHub 拉取最新 news.json
# 2. 解析并更新到网站
# 3. 记录日志

$logFile = "C:\scripts\update_log.txt"
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

try {
    # 下载最新数据
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/[user]/[repo]/main/admin/news.json" -OutFile "C:\inetpub\wwwroot\admin\news.json"
    
    Add-Content -Path $logFile -Value "$timestamp - 更新成功"
} catch {
    Add-Content -Path $logFile -Value "$timestamp - 更新失败：$_"
}
```

##### 创建任务计划
```batch
:: 每天 9:00 执行
schtasks /create /tn "NewsAutoUpdate" /tr "C:\scripts\auto_update.bat" /sc daily /st 09:00 /ru SYSTEM

:: 每天 15:00 执行
schtasks /create /tn "NewsAutoUpdate2" /tr "C:\scripts\auto_update.bat" /sc daily /st 15:00 /ru SYSTEM
```

#### 4.2 联系表单后端

##### Formspree 集成（免后端）
```html
<form action="https://formspree.io/f/[your-form-id]" method="POST">
  <input type="text" name="name" placeholder="姓名" required>
  <input type="email" name="email" placeholder="邮箱" required>
  <textarea name="message" placeholder="留言内容" required></textarea>
  <button type="submit">提交</button>
</form>
```

##### 简易 PHP 后端
```php
<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = htmlspecialchars($_POST['name']);
    $email = htmlspecialchars($_POST['email']);
    $message = htmlspecialchars($_POST['message']);
    
    $to = 'contact@company.com';
    $subject = '网站联系表单 - ' . $name;
    $body = "姓名：$name\n邮箱：$email\n\n$message";
    
    mail($to, $subject, $body);
    header('Location: /contact/thanks.html');
}
?>
```

---

## 📊 项目管理模板

### 多网站建设项目追踪

| 序号 | 网站名称 | 域名 | 状态 | 服务器 | 预计完成 | 备注 |
|------|---------|------|------|--------|----------|------|
| 1 | [网站 1] | domain1.com | 规划中 | IIS | YYYY-MM-DD | |
| 2 | [网站 2] | domain2.com | 设计中 | Vercel | YYYY-MM-DD | |
| 3 | [网站 3] | domain3.com | 开发中 | Nginx | YYYY-MM-DD | |

### 单项目进度检查表
```markdown
## [网站名称] 建设项目

### 需求阶段
- [ ] 信息收集完成
- [ ] 网站结构确认
- [ ] 设计风格确认

### 开发阶段
- [ ] 首页完成
- [ ] 关于我们完成
- [ ] 产品中心完成
- [ ] 新闻动态完成
- [ ] 联系我们完成
- [ ] 广告法合规检查通过

### 部署阶段
- [ ] GitHub 仓库创建
- [ ] 服务器配置完成
- [ ] 域名解析完成
- [ ] HTTPS 配置完成

### 验收阶段
- [ ] 功能测试通过
- [ ] 兼容性测试通过
- [ ] 性能测试通过
- [ ] 客户验收确认
```

---

## 🔧 常用工具与命令

### Git 操作速查
```bash
# 初始化
git init
git add -A
git commit -m "描述"
git push -u origin main

# 分支管理
git branch -M main
git remote add origin https://github.com/[user]/[repo].git

# 强制推送（覆盖）
git push -f origin main
```

### 文件传输速查
```bash
# Windows IIS (base64)
base64 file.html | sshpass -p 'pwd' ssh user@ip \
  "powershell -Command \"[System.Text.Encoding]::UTF8.GetString(
   [System.Convert]::FromBase64String([Console]::In.ReadToEnd())) | 
   Out-File -FilePath 'C:\\inetpub\\wwwroot\\site\\file.html' -Encoding UTF8\""

# Linux Nginx (scp)
scp file.html user@ip:/var/www/site/

# 批量上传
for f in *.html; do base64 "$f" | ssh user@ip "powershell ..."; done
```

### 广告法检查速查
```bash
# 一键检查
grep -rnE "第一 | 最 | 领先 | 首家 | 唯一 | 国家级 | 一流 | 顶级" --include="*.html" .

# 生成报告
grep -rnE "违禁词正则" --include="*.html" . > ad-law-report.txt
```

### 网站健康检查
```bash
# 检查所有 HTML 文件
find . -name "*.html" -exec grep -L "<!DOCTYPE html>" {} \;

# 检查缺失的 meta 标签
grep -L "meta.*description" **/*.html

# 检查外部链接
grep -oE 'href="https?://[^"]+"' **/*.html | sort -u
```

---

## 📚 资源模板库

### 标准 HTML 模板
```html
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="[页面描述]">
    <title>[页面标题] - [公司名称]</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
    <nav class="navbar">
        <div class="container">
            <span class="logo">[LOGO]</span>
            <ul class="nav-menu">
                <li><a href="/">首页</a></li>
                <li><a href="/about/">关于我们</a></li>
                <li><a href="/products/">产品中心</a></li>
                <li><a href="/news/">新闻动态</a></li>
                <li><a href="/contact/">联系我们</a></li>
            </ul>
        </div>
    </nav>

    <main>
        <!-- 页面内容 -->
    </main>

    <footer class="footer">
        <div class="container">
            <p>&copy; [年份] [公司名称] 版权所有</p>
        </div>
    </footer>

    <script src="/js/main.js"></script>
</body>
</html>
```

### CSS 基础样式
```css
* { margin: 0; padding: 0; box-sizing: border-box; }

body {
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
    line-height: 1.6;
    color: #333;
}

.container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 20px;
}

.navbar {
    background: #fff;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    position: fixed;
    width: 100%;
    top: 0;
    z-index: 1000;
}

.nav-menu {
    display: flex;
    list-style: none;
    justify-content: flex-end;
}

.nav-menu li a {
    display: block;
    padding: 15px 20px;
    text-decoration: none;
    color: #333;
}

.footer {
    background: #333;
    color: #fff;
    text-align: center;
    padding: 30px 0;
    margin-top: 60px;
}
```

---

## ⚠️ 重要提醒

### 必须执行
1. ✅ **广告法合规检查** - 每次修改后必须执行
2. ✅ **链接验证** - 添加新页面后检查所有链接
3. ✅ **移动端测试** - 确保响应式正常
4. ✅ **SEO 基础** - title、description、keywords

### 建议执行
1. ⭐ **性能优化** - 图片压缩、CSS/JS 压缩
2. ⭐ **HTTPS 配置** - SSL 证书安装
3. ⭐ **备份策略** - 定期备份数据库和文件
4. ⭐ **监控告警** - 网站可用性监控

### 禁止操作
❌ 不要使用绝对路径（使用相对路径）
❌ 不要硬编码敏感信息（密码、API Key）
❌ 不要忽略移动端适配
❌ 不要使用未授权的图片和字体

---

## 🎯 快速启动新网站

### 30 分钟快速建站流程

```bash
# 1. 复制模板（5 分钟）
cp -r /templates/standard-site /workspace/new-site
cd /workspace/new-site

# 2. 替换基本信息（10 分钟）
# - 公司名称
# - 联系方式
# - Logo
# - 品牌色彩

# 3. 调整内容（10 分钟）
# - 关于我们
# - 产品信息
# - 新闻动态

# 4. 部署上线（5 分钟）
git init && git add -A && git commit -m "Initial"
vercel --prod  # 或上传到 IIS/Nginx

# 5. 验证（5 分钟）
# - 访问测试
# - 链接检查
# - 广告法检查
```

---

**本技能为通用网站建设模板，可快速复用于 10-20 个网站建设项目！**

**版本**：v1.0  
**更新日期**：2026-03-12  
**适用范围**：企业官网、产品展示站、营销型网站

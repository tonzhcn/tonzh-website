# 中科同帜网站运营技能

## 技能说明
本技能包含中科同帜（TORCH）官方网站建设、产品资料、广告法合规、部署流程等全部知识和操作规范。

---

## 一、公司信息

### 基本信息
- **公司全名**：北京中科同志科技股份有限公司
- **品牌**：TORCH、TERMWAY
- **创始人**：赵永先（赵总）
- **成立时间**：2016 年 9 月 19 日
- **总部地址**：北京市通州区联东 U 谷科技园中区景盛南四街 15 号
- **联系方式**：sales@tonzh.com、400-998-9522
- **域名**：www.tonzh.com（已备案）、aiauto.tonzh.cn（测试）

### 企业愿景
成为地球上特种封装焊接领域值得信赖的企业

### 企业精神
同心协力、众志成城、科技立身、产业报国

### 核心资质
- 专精特新"小巨人"企业
- 国家知识产权示范企业
- 国家火炬计划产业化示范项目
- 北京市知识产权示范企业

### 技术实力
- 累计申请专利 250+ 项
- 授权发明专利 62+ 项
- 实用新型及外观专利 200+ 项
- 4 个研发制造基地

---

## 二、产品体系

### 1. RS 系列真空焊接设备（真空共晶炉）

#### 产品定位
专为小批量研发与高可靠性焊接设计的第三代真空焊接设备

#### 三款型号对比

| 参数 | RS220B (RSR 0B) | RS220S (RSR 0S) | RS220H (RSR 0H) |
|------|----------------|----------------|----------------|
| 定位 | 基础型，高性价比入门 | 标准型，均衡配置 | 高性能型，最优工艺 |
| 焊接面积 | 220×220mm | 220×220mm | 220×220mm |
| 温度均匀度 | ±1.5% | ±1% | ±0.5% |
| 极限真空度 | 1.5 Pa | 1 Pa | 0.5 Pa |
| 加热板涂层 | 钝化处理 | 表面硬化 | 碳化硅涂层 |
| 在线测温组 | 2 组 | 2 组 | 4 组 |

#### 核心优势（通用）
1. **低空洞焊接**：空洞率可降至 2% 以下（普通设备 20-30%）
2. **多气氛兼容**：支持真空、氮气、甲酸三种工艺环境
3. **高效温控**：最大升温速率 120°C/min，控温精度±1°C
4. **快速冷却**：水冷 + 气冷复合冷却
5. **工艺可追溯**：软件自动记录完整工艺曲线与数据

#### RS220B 详细参数
- 温度范围：室温 ~ 450°C
- 极限真空度：≤1.5 Pa（配置机械油泵）
- 温度均匀性：≤±2%
- 控制系统：工业计算机 + 专用软件，40 段可编程

#### 典型应用
- 高可靠性芯片封装（IGBT、激光器、MEMS 等）
- 航空航天、军工、汽车电子等领域的 SMT 焊接
- 科研院所的小批量研发与工艺验证

#### 厂务需求
- 电源：AC 220V / 63A
- 气源：高纯氮气 (0.4-0.6 MPa)
- 水源：去离子水 (加入配套水冷机)
- 排气：KF25 接口，需外接排风

### 2. 其他产品类别（38 个分类）
- 半导体设备（12 类）
- SMT 设备（11 类）
- PCB 设备（16 类）

---

## 三、广告法合规规则

### 违禁词替换表

| 原违禁词 | 修改为 | 说明 |
|---------|--------|------|
| 国家级专精特新 | 专精特新 | 避免"国家级" |
| 最受人尊敬 | 值得信赖 | 避免"最" |
| 一流 | 优质 | 避免绝对化 |
| 全球领先 | 先进 | 避免"领先" |
| 国内首家 | 较早提供 | 避免"首家" |
| 国内唯一 | 专业提供 | 避免"唯一" |
| 最高可达 | 可达 | 避免"最高" |
| 最新数据 | 截至目前 | 避免"最新" |
| 第一 | （删除或替换） | 严禁使用 |
| 首台（设备） | （删除"首台"） | 严禁使用 |
| 首台套 | 保留 | 国家奖项名称，允许使用 |

### 检查流程
1. 使用 `grep -r "首台\|第一\|最\|领先\|唯一\|首家"` 搜索代码库
2. 区分"首台套"（保留）和"首台设备"（删除）
3. 修改后提交 git 并推送到服务器
4. 访问页面验证修改效果

---

## 四、网站部署流程

### 服务器环境
- **系统**：Windows Server 2025
- **位置**：Alibaba Cloud ECS (8.136.211.72)
- **Web 服务器**：IIS
- **网站根目录**：`C:\inetpub\wwwroot\`

### GitHub 仓库
- **地址**：https://github.com/tonzhcn/tonzh-website
- **分支**：main
- **工作目录**：`/home/admin/.openclaw/workspace/tonzh-website/`

### 部署命令

#### 1. 本地修改后推送
```bash
cd /home/admin/.openclaw/workspace/tonzh-website
git add -A
git commit -m "修改描述"
git push -f origin main
```

#### 2. 上传文件到服务器（base64 方式）
```bash
# 单个 HTML 文件
base64 path/to/file.html | sshpass -p '密码' ssh user@server \
  "powershell -Command \"[System.Text.Encoding]::UTF8.GetString(
   [System.Convert]::FromBase64String([Console]::In.ReadToEnd())) | 
   Out-File -FilePath 'C:\\inetpub\\wwwroot\\path\\file.html' -Encoding UTF8\""
```

#### 3. 验证部署
```bash
sshpass -p '密码' ssh user@server \
  "powershell -Command \"(Get-Content 'C:\\inetpub\\wwwroot\\path\\file.html' | 
   Measure-Object -Line).Lines\""
```

### 目录结构
```
C:\inetpub\wwwroot\
├── index.html                    # 首页
├── about/index.html              # 关于我们
├── products/index.html           # 产品中心
├── products/vacuum-eutectic/     # 真空共晶炉栏目
│   ├── index.html               # 栏目页
│   └── rs-series/               # RS 系列
│       ├── rs220b/index.html    # RS220B 详情页
│       ├── rs220s/index.html    # RS220S 详情页
│       └── rs220h/index.html    # RS220H 详情页
├── news/index.html               # 新闻动态
├── contact/index.html            # 联系我们
├── css/style.css                 # 样式文件
├── js/main.js                    # 脚本文件
└── admin/                        # 后台管理
    ├── index.html               # Decap CMS
    ├── config.yml               # CMS 配置
    └── news.json                # 新闻数据
```

---

## 五、新闻自动更新系统

### 任务计划
- **任务 1**：每天 09:00 执行
- **任务 2**：每天 15:00 执行
- **脚本位置**：`C:\scripts\auto_update.bat`
- **日志文件**：`C:\scripts\update_log.txt`

### 新闻数据来源
- GitHub 仓库的 `admin/news.json`
- 自动抓取半导体行业新闻、技术动态

### 验证方法
1. 访问 http://aiauto.tonzh.cn/news/ 查看新闻列表
2. 检查日志文件 `C:\scripts\update_log.txt`
3. 确认任务计划状态：`schtasks /query /tn "NewsAutoUpdate"`

---

## 六、工作流程

### 日常运营
1. **每日搜集**（9:00 & 15:00 自动执行）
   - 半导体行业新闻
   - 热门产品/技术
   - 中科同帜相关动态（专利、技术突破）

2. **内容创作**
   - 八大类别：半导体技术、制造业设备、军工科技、国产替代、真空设备、单腔回流炉、真空封装元器件、时政科技热点
   - 四平台适配：官方深度文章、小红书爆款、今日头条深度、百家号 SEO

3. **发布策略**
   - 早 7 点：热点新闻
   - 中午 12 点：技术分析
   - 晚上 8 点：情感态度/时政思考

### 内容优化循环
- 每 3 天一轮优化迭代
- 每日搜集 20+ 篇爆款文案参考
- 基于各平台后台数据持续优化

---

## 七、网站结构

### 页面列表
1. **首页** (`/`)
   - 公司形象展示
   - 核心产品推荐
   - 新闻动态摘要

2. **关于我们** (`/about/`)
   - 公司简介
   - 企业愿景/精神
   - 旗下品牌（TORCH、TERMWAY）
   - 核心资质与荣誉
   - 技术实力与知识产权
   - 业务与产品体系
   - 核心优势与突破
   - 服务行业
   - 生产基地

3. **产品中心** (`/products/`)
   - 真空共晶炉 (`/products/vacuum-eutectic/`)
     - RS220B (`/products/vacuum-eutectic/rs-series/rs220b/`)
     - RS220S (`/products/vacuum-eutectic/rs-series/rs220s/`)
     - RS220H (`/products/vacuum-eutectic/rs-series/rs220h/`)
   - 真空焊接炉
   - 高精密粘片机
   - 纳米银正压烧结炉

4. **新闻动态** (`/news/`)
   - 行业动态（自动更新）
   - 技术动态（自动更新）
   - 公司新闻

5. **联系我们** (`/contact/`)
   - 联系方式
   - 地址信息
   - 表单提交

---

## 八、设计规范

### 品牌色彩
- **科技蓝**：#0056B3（主色）
- **专利金**：#D4AF37（辅助色）
- **深蓝**：#003366（渐变）

### 设计风格
- 科技感、专业性
- 响应式设计（适配移动端）
- 简洁大气

---

## 九、关键文件清单

### 必须记住的文件路径
- 工作目录：`/home/admin/.openclaw/workspace/tonzh-website/`
- 服务器根目录：`C:\inetpub\wwwroot\`
- 新闻数据：`C:\inetpub\wwwroot\admin\news.json`
- 更新脚本：`C:\scripts\auto_update.bat`
- 日志文件：`C:\scripts\update_log.txt`

### 核心页面
- `index.html` - 首页
- `about/index.html` - 关于我们（含违禁词检查重点）
- `products/vacuum-eutectic/index.html` - 真空共晶炉栏目
- `products/vacuum-eutectic/rs-series/rs220b/index.html` - RS220B 详情
- `products/vacuum-eutectic/rs-series/rs220s/index.html` - RS220S 详情
- `products/vacuum-eutectic/rs-series/rs220h/index.html` - RS220H 详情

---

## 十、常用命令速查

### Git 操作
```bash
cd /home/admin/.openclaw/workspace/tonzh-website
git status
git add -A
git commit -m "描述"
git push -f origin main
```

### 文件上传
```bash
base64 file.html | sshpass -p 'tonzh1188CN' ssh administrator@8.136.211.72 \
  "powershell -Command \"[System.Text.Encoding]::UTF8.GetString(
   [System.Convert]::FromBase64String([Console]::In.ReadToEnd())) | 
   Out-File -FilePath 'C:\\inetpub\\wwwroot\\file.html' -Encoding UTF8\""
```

### 广告法检查
```bash
grep -rn "首台\|第一\|最\|领先\|唯一\|首家" --include="*.html" .
```

### 服务器验证
```bash
sshpass -p 'tonzh1188CN' ssh administrator@8.136.211.72 \
  "powershell -Command \"Get-Content 'C:\\inetpub\\wwwroot\\file.html' | 
   Select-String '关键词' | Select-Object -First 1\""
```

---

## 技能使用说明

当用户提到以下关键词时，应激活本技能：
- "中科同帜"、"TORCH"、"网站"
- "RS220B"、"RS220S"、"RS220H"、"真空共晶炉"
- "广告法"、"违禁词"、"首台"
- "部署"、"上传"、"服务器"
- "新闻更新"、"自动更新"

本技能包含公司全部产品资料、部署流程、合规规范，是运营中科同帜官方网站的核心知识库。

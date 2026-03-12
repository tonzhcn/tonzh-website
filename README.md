# 中科同志科技（TORCH）官方网站

## 项目说明

这是中科同志科技股份有限公司的官方静态网站，包含 CMS 后台管理系统，可方便地更新新闻动态等内容。

## 技术栈

- **前端**: HTML5 + CSS3 + JavaScript
- **CMS 后台**: Decap CMS（基于 Git 的无头 CMS）
- **托管平台**: Vercel（推荐）或 GitHub Pages

## 网站结构

```
tonzh-website/
├── index.html          # 首页
├── about/              # 关于我们
├── products/           # 产品中心
├── applications/       # 技术应用
├── news/               # 新闻动态（CMS 管理）
├── resources/          # 资源下载
├── contact/            # 联系我们
├── admin/              # CMS 后台
│   ├── index.html      # CMS 入口
│   └── config.yml      # CMS 配置
├── css/                # 样式文件
├── js/                 # 脚本文件
└── images/             # 图片资源
```

## 部署步骤

### 方式一：Vercel 部署（推荐）

1. 将代码上传到 GitHub 仓库
2. 访问 [vercel.com](https://vercel.com) 并登录
3. 点击 "New Project"，导入 GitHub 仓库
4. Vercel 会自动识别并部署
5. 在 Vercel 设置中绑定域名 `www.tonzh.com`

### 方式二：GitHub Pages 部署

1. 将代码上传到 GitHub 仓库
2. 进入仓库 Settings → Pages
3. 选择 `main` 分支，保存
4. 访问 `https://yourusername.github.io/tonzh-website/`
5. 在域名提供商处设置 CNAME 记录

### 域名配置

在您的域名服务商（阿里云/腾讯云）处设置：

```
类型    名称    值
CNAME   www     your-site.vercel.app (或 GitHub Pages 地址)
```

## CMS 后台使用

### 首次配置

1. 完成网站部署后，访问 `https://www.tonzh.com/admin/`
2. 首次访问需要授权 Git 仓库（GitHub/GitLab）
3. 授权后即可登录后台

### 发布新闻

1. 登录 CMS 后台
2. 点击左侧 "新闻动态"
3. 点击 "新建" 按钮
4. 填写标题、分类、内容、上传配图
5. 点击 "发布"（会创建 Git 提交）
6. Vercel 会自动重新构建并上线

### 内容类型

- **新闻动态**: 行业动态、技术动态、公司新闻
- **产品信息**: 产品详情、技术参数、应用案例
- **单页内容**: 关于我们、联系我们等页面内容

## 网站功能

### 已实现
- ✅ 响应式设计（支持 PC/平板/手机）
- ✅ SEO 优化（meta 标签、语义化 HTML）
- ✅ 新闻动态 CMS 后台管理
- ✅ 联系表单
- ✅ 产品筛选
- ✅ 新闻分类筛选

### 待完善
- ⏳ 产品详情页（单个产品页面）
- ⏳ 技术应用页面
- ⏳ 资源下载页面
- ⏳ 实际图片资源替换占位图
- ⏳ 联系表单后端集成（可用 Formspree 等）
- ⏳ 百度统计/Google Analytics 集成
- ⏳ 在线客服系统集成

## 内容更新流程

```
1. 登录 CMS 后台 (www.tonzh.com/admin/)
   ↓
2. 创建/编辑内容
   ↓
3. 点击发布（自动提交到 Git）
   ↓
4. Vercel 自动构建部署（约 1-2 分钟）
   ↓
5. 新内容上线
```

## 已完成更新（2026-03-12）

- ✅ 联系方式已更新为真实信息
  - 电话：400-998-9522
  - 邮箱：sales@tonzh.com
  - 地址：北京市通州区联东 U 谷科技园中区景盛南四街 15 号

## 后续优化建议

1. **图片优化**: 从 torch.cc 获取产品图片并替换占位图
2. **内容填充**: 完善所有产品详情页、技术应用页
3. **SEO 优化**: 添加 sitemap.xml、robots.txt
4. **性能优化**: 图片懒加载、CDN 加速
5. **表单集成**: 接入 Formspree 处理联系表单
6. **在线客服**: 集成美洽、企业微信等客服系统
7. **数据分析**: 添加百度统计、Google Analytics

## 联系支持

如有问题，请联系网站管理员。

---

© 2026 中科同志科技股份有限公司

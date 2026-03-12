# 网站部署指南

## 第一步：注册 GitHub 账号（需要您亲自操作）

由于 GitHub 注册需要手机验证码和人机验证，需要您亲自完成：

1. 访问 [https://github.com](https://github.com)
2. 点击 "Sign up" 按钮
3. 输入邮箱：`sales@aiauto.tonzh.cn`
4. 设置密码（建议 12 位以上，包含大小写字母和数字）
5. 输入用户名：建议 `tonzh-tech` 或 `torch-semi`
6. 输入手机号：`13701314315`，接收验证码
7. 完成人机验证
8. 验证邮箱（GitHub 会发送验证邮件到 sales@aiauto.tonzh.cn）

**注册完成后，告诉我您的 GitHub 用户名**，我会把代码上传到仓库。

---

## 第二步：创建 GitHub 仓库

1. 登录 GitHub
2. 点击右上角 "+" → "New repository"
3. 仓库名称：`tonzh-website`
4. 描述：中科同志科技（TORCH）官方网站
5. 选择 "Public"（公开）
6. **不要**勾选 "Initialize this repository with a README"
7. 点击 "Create repository"

---

## 第三步：部署到 Vercel

### 3.1 连接 GitHub

1. 访问 [https://vercel.com](https://vercel.com)
2. 点击 "Sign Up" 或 "Login"
3. 选择 "Continue with GitHub" 授权登录
4. 允许 Vercel 访问您的 GitHub 仓库

### 3.2 导入项目

1. 点击 "Add New..." → "Project"
2. 在 "Import Git Repository" 列表中找到 `tonzh-website`
3. 点击 "Import"
4. 保持默认设置，点击 "Deploy"
5. 等待约 1-2 分钟，部署完成后会显示预览链接

### 3.3 绑定域名

1. 在项目页面，点击 "Settings" → "Domains"
2. 点击 "Add" 按钮
3. 输入域名：`aiauto.tonzh.cn`
4. 点击 "Add"
5. Vercel 会显示 DNS 配置要求

---

## 第四步：阿里云 DNS 配置

1. 登录 [阿里云控制台](https://console.aliyun.com)
2. 进入 "域名与网站" → "域名"
3. 找到 `aiauto.tonzh.cn`，点击 "解析"
4. 添加 DNS 记录：

| 记录类型 | 主机记录 | 记录值 | TTL |
|---------|---------|--------|-----|
| CNAME | www | `cname.vercel-dns.com` | 10 分钟 |

或者根据 Vercel 页面显示的具体 CNAME 值填写。

5. 等待 DNS 生效（通常 5-30 分钟）

---

## 第五步：配置 CMS 后台

网站部署完成后，配置内容管理后台：

1. 访问 `https://aiauto.tonzh.cn/admin/`
2. 首次访问会提示授权 GitHub
3. 点击 "Authorize with GitHub"
4. 选择允许访问 `tonzh-website` 仓库
5. 授权成功后即可登录后台

### CMS 后台功能

- **新闻动态**：发布行业新闻、技术动态、公司新闻
- **产品信息**：管理产品详情、技术参数
- **单页内容**：编辑关于我们、联系我们等页面

---

## 第六步：后续优化

### 6.1 替换产品图片

从现有网站 `torch.cc` 获取产品图片，上传到网站：

1. 登录 CMS 后台
2. 进入产品/新闻编辑页面
3. 上传图片（会自动保存到 GitHub 仓库）
4. Vercel 会自动重新部署

### 6.2 联系表单后端

当前表单是前端演示，需要接入后端服务：

**推荐方案：Formspree**
1. 访问 [https://formspree.io](https://formspree.io)
2. 注册账号（用 sales@aiauto.tonzh.cn）
3. 创建新表单，获取表单 ID
4. 修改 `contact/index.html` 中的表单 action

### 6.3 网站统计

**百度统计：**
1. 访问 [https://tongji.baidu.com](https://tongji.baidu.com)
2. 注册并添加网站 `aiauto.tonzh.cn`
3. 获取统计代码
4. 将代码添加到所有页面的 `<head>` 标签内

---

## 常见问题

### Q: DNS 配置后多久生效？
A: 通常 5-30 分钟，最长可能 24 小时。可以用 `ping aiauto.tonzh.cn` 检查。

### Q: CMS 后台无法登录？
A: 确保已授权 GitHub 仓库访问权限。检查 `admin/config.yml` 中的仓库配置。

### Q: 如何更新网站内容？
A: 
- 方式 1：登录 CMS 后台编辑发布（推荐）
- 方式 2：直接修改代码，推送到 GitHub，Vercel 自动部署

### Q: 如何查看部署日志？
A: 登录 Vercel，进入项目页面 → "Deployments"，点击任意部署查看日志。

---

## 联系支持

部署过程中遇到问题，随时联系我！

---

© 2026 中科同志科技股份有限公司

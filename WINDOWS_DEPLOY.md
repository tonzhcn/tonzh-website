# 中科同志科技官网 - Windows 服务器部署指南

## 方法一：使用 IIS（推荐，最简单）

### 步骤 1：安装 IIS

1. 打开"服务器管理器"
2. 点击"添加角色和功能"
3. 一直点"下一步"，直到"服务器角色"
4. 勾选 **"Web 服务器 (IIS)"**
5. 点"下一步" → "安装"
6. 等待安装完成

### 步骤 2：复制网站文件

1. 解压 `tonzh-website-nogit.zip`
2. 复制所有文件和文件夹（index.html、about、products 等）
3. 粘贴到：`C:\inetpub\wwwroot\`
4. 覆盖默认的 `iisstart.htm` 和 `welcome.png`（如果有）

### 步骤 3：配置 IIS

1. 按 `Win + R`，输入 `inetmgr`，回车
2. 展开左侧树形菜单
3. 展开"网站" → "Default Web Site"
4. 右键"Default Web Site" → "编辑权限"
5. 确保物理路径是：`C:\inetpub\wwwroot\`
6. 点击"确定"

### 步骤 4：设置默认文档

1. 在 IIS 管理器中，点击"Default Web Site"
2. 双击"默认文档"
3. 确保 `index.html` 在列表中
4. 如果没有，点击右侧"添加"，输入 `index.html`
5. 移到列表顶部

### 步骤 5：测试访问

1. 打开服务器上的浏览器
2. 访问：http://localhost
3. 应该能看到网站首页

### 步骤 6：配置阿里云安全组

在阿里云控制台（您自己的电脑浏览器）：
1. 进入 ECS 实例详情
2. 点击"安全组" → "配置规则"
3. 添加入方向规则：
   - 端口 80（HTTP）
   - 端口 443（HTTPS，如果以后用）
   - 授权对象：0.0.0.0/0

### 步骤 7：配置 DNS 解析

在阿里云域名控制台：
1. 找到 `aiauto.tonzh.cn` 域名
2. 点击"解析"
3. 添加记录：
   - 记录类型：A
   - 主机记录：www
   - 记录值：8.136.211.72
   - TTL：10 分钟

4. 再添加一条：
   - 记录类型：A
   - 主机记录：@
   - 记录值：8.136.211.72
   - TTL：10 分钟

### 完成！

等待 DNS 生效（5-30 分钟），访问 aiauto.tonzh.cn 即可看到网站！

---

## 方法二：使用 Nginx（可选）

### 步骤 1：下载 Nginx

1. 访问：https://nginx.org/download/nginx-1.24.0.zip
2. 下载并解压到 `C:\nginx`

### 步骤 2：配置 Nginx

1. 打开 `C:\nginx\conf\nginx.conf`
2. 找到 `server` 块
3. 修改 `root` 为网站路径：
   ```
   root C:/nginx/html/tonzh-website;
   ```
4. 保存文件

### 步骤 3：复制网站文件

1. 在 `C:\nginx\html\` 创建文件夹 `tonzh-website`
2. 复制所有网站文件到该文件夹

### 步骤 4：启动 Nginx

1. 打开命令提示符（管理员）
2. 输入：`cd C:\nginx`
3. 输入：`start nginx`
4. 访问：http://localhost 测试

### 步骤 5：设置为服务（可选）

下载 NSSM：https://nssm.cc/download
将 Nginx 注册为 Windows 服务，开机自启

---

## 常见问题

### Q: 访问显示 403 禁止访问？
A: 检查 IIS 默认文档是否包含 index.html

### Q: 访问显示 404 未找到？
A: 检查文件是否正确复制到 wwwroot 目录

### Q: 外网无法访问？
A: 检查阿里云安全组是否开放端口 80

### Q: DNS 多久生效？
A: 通常 5-30 分钟，最长 24 小时

---

## 联系支持

部署过程中遇到问题，随时联系！

© 2026 中科同志科技股份有限公司

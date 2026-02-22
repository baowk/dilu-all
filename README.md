<div align="center">
  <img src="https://github.com/baowk/dilu/assets/142554979/ee341fb7-f98e-4f18-9658-f89b4f7d466f" alt="Dilu Logo" width="200">
</div>

<h1 align="center">Dilu-All - 完整版Go Web开发框架</h1>

<p align="center">
  企业级全功能Web开发解决方案
</p>

<p align="center">
  🇨🇳 中文版本 • <a href="./README_en.md">🇺🇸 English</a>
</p>

<p align="center">
  <a href="https://github.com/baowk/dilu-all/stargazers">
    <img src="https://img.shields.io/github/stars/baowk/dilu-all" alt="GitHub stars">
  </a>
  <a href="https://github.com/baowk/dilu-all/issues">
    <img src="https://img.shields.io/github/issues/baowk/dilu-all" alt="GitHub issues">
  </a>
  <a href="https://github.com/baowk/dilu-all/blob/main/LICENSE">
    <img src="https://img.shields.io/github/license/baowk/dilu-all" alt="GitHub">
  </a>
  <a href="https://goreportcard.com/report/github.com/baowk/dilu-all">
    <img src="https://goreportcard.com/badge/github.com/baowk/dilu-all" alt="Go Report Card">
  </a>
</p>

## 📖 项目简介

Dilu-All是Dilu框架的完整功能版本，集成了所有核心插件和企业级功能模块。适用于需要快速构建完整后台管理系统的开发场景，提供了开箱即用的企业级解决方案。

### 🎯 适用场景
- 企业后台管理系统开发
- SaaS多租户平台建设
- 快速原型开发
- 微服务架构基础框架

### 🔧 版本组成

- **Dilu All**: 完整功能版本（当前项目）
- **Dilu Core**: 核心简化版本
- **Dilu Plugin**: 插件扩展库
- **Dilu Ctl**: 项目脚手架工具 ⭐
- **Dilu Admin**: 前端管理界面

> ⚡ **推荐**: 使用 [Dilu Ctl](https://github.com/baowk/dilu-ctl) 脚手架工具可以一键创建包含前后端的完整项目。

## ✨ 核心特性

### 🏢 企业级功能
- **完整权限体系**: RBAC角色权限管理，细粒度权限控制
- **多租户支持**: 完善的SaaS架构设计，支持多团队独立运营
- **数据字典**: 统一的数据字典管理，便于业务配置
- **操作日志**: 完整的操作审计日志记录
- **文件管理**: 支持本地和云存储的文件上传管理

### 🛠️ 技术优势
- **插件化架构**: 模块化设计，按需启用功能组件
- **代码生成**: 强大的代码生成器，支持复杂业务场景
- **API管理**: 完善的接口文档和测试工具
- **监控告警**: 系统性能监控和异常告警机制
- **国际化支持**: 多语言界面支持

## 🚀 快速开始

### 方法一：使用脚手架工具（推荐）

使用 [Dilu Ctl](https://github.com/baowk/dilu-ctl) 脚手架工具一键创建完整项目：

```bash
# 安装脚手架工具
go install github.com/baowk/dilu-ctl@latest

# 创建完整项目（包含前后端）
dilu-ctl -n myproject -a

# 进入后端项目目录并启动
cd myproject
go run main.go start -c resources/config.dev.yaml

# 在新终端进入前端项目目录
cd ../myproject-admin
npm install
npm run dev
```

### 方法二：手动安装

1. **获取源码**
```bash
git clone https://github.com/baowk/dilu-all.git
# 或者
git clone https://gitee.com/walkbao/dilu-all.git
```

2. **安装依赖**
```bash
cd dilu-all
go mod tidy
```

3. **数据库初始化**
```sql
-- 创建必要数据库
CREATE DATABASE `dilu-db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE `dental-db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 导入初始数据
SOURCE resources/dbs/dilu-db.sql;
SOURCE resources/dbs/dental-db.sql;
```

4. **配置文件设置**

修改 `resources/config.dev.yaml`:
```yaml
dbcfg:
  driver: mysql
  dns: root:password@tcp(127.0.0.1:3306)/dilu-db?charset=utf8&parseTime=True&loc=Local
  dbs:
    - dental:
        dns: root:password@tcp(127.0.0.1:3306)/dental-db?charset=utf8&parseTime=True&loc=Local
```

5. **启动服务**
```bash
go run main.go start -c resources/config.dev.yaml
```

## 🏗️ 项目结构

```
dilu-all/
├── cmd/           # 命令行工具
├── common/        # 公共组件和中间件
├── docs/          # 技术文档
├── modules/       # 业务功能模块
│   ├── base/      # 基础管理模块
│   ├── core/      # 核心功能模块
│   ├── job/       # 定时任务模块
│   └── sys/       # 系统管理模块
├── resources/     # 配置文件和SQL脚本
├── temp/          # 临时文件
├── main.go        # 程序入口
└── go.mod         # 依赖管理
```

## 📚 功能模块介绍

### 🔐 用户认证模块
- JWT Token认证机制
- 多因素身份验证
- 会话管理和超时控制
- 登录失败次数限制

### 👥 权限管理系统
- 角色基础访问控制(RBAC)
- 菜单权限配置
- API接口权限控制
- 数据权限隔离

### 📊 系统管理功能
- 用户管理(增删改查、状态控制)
- 角色管理(权限分配、菜单配置)
- 菜单管理(动态路由、权限控制)
- 部门组织架构管理
- 字典数据管理
- 操作日志审计

### 🛠️ 开发工具
- 在线代码生成器
- API文档自动生成
- SQL执行器
- 定时任务管理
- 系统监控面板

## 🛠️ 开发工具集成

### Dilu Ctl 脚手架工具
[Dilu Ctl](https://github.com/baowk/dilu-ctl) 是专门为Dilu生态系统设计的脚手架工具，特别适合快速搭建完整项目：

**主要功能：**
- ✅ 一键创建完整的前后端项目结构
- ✅ 自动配置项目间依赖关系
- ✅ 智能更新配置文件中的路径引用
- ✅ 支持SSH和HTTPS两种Git协议
- ✅ 自动处理包名替换和模块重命名

**使用示例：**
```bash
# 安装工具
go install github.com/baowk/dilu-ctl@latest

# 创建完整项目
dilu-ctl -n company-project -a

# 项目结构
company-project/        # 后端项目 (dilu-all)
├── go.mod
├── main.go
└── resources/
    └── config.dev.yaml  # 已自动配置front-path

company-project-admin/  # 前端项目 (dilu-admin)
├── package.json
├── vite.config.js
└── src/
```

## 🎯 典型应用场景

### 企业管理后台
```
├── 用户中心
│   ├── 用户管理
│   ├── 角色权限
│   └── 部门管理
├── 系统配置
│   ├── 参数配置
│   ├── 字典管理
│   └── 通知公告
└── 系统监控
    ├── 操作日志
    ├── 登录日志
    └── 性能监控
```

### SaaS平台架构
- 支持多租户数据隔离
- 独立的域名和资源配置
- 灵活的计费和套餐管理
- 统一的身份认证中心

## 🔧 高级配置

### 环境变量配置
```bash
export DILU_ENV=production
export DILU_PORT=8080
export DILU_DB_HOST=localhost
export DILU_REDIS_ADDR=localhost:6379
```

### Docker部署
```dockerfile
FROM golang:1.26-alpine AS builder
WORKDIR /app
COPY . .
RUN go mod download
RUN go build -o dilu .

FROM alpine:latest
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=builder /app/dilu .
COPY --from=builder /app/resources ./resources
CMD ["./dilu", "start", "-c", "resources/config.prod.yaml"]
```

## 🤝 社区和支持

### 技术交流
<div align="center">
  <img src="https://github.com/baowk/dilu/assets/142554979/29a6863c-4bdc-4963-99c2-0c400e132f6f" width="300" alt="微信群二维码">
  <br>
  <sub>添加微信时请备注：的卢完整版</sub>
</div>

### 学习资源
- 📖 [官方文档](docs/)
- 🎬 [视频教程](#)
- 💬 [技术问答](https://github.com/baowk/dilu-all/issues)
- 📚 [最佳实践](docs/best-practices.md)

## 🔗 相关链接

- [Dilu Core](https://github.com/baowk/dilu) - 核心简化版本
- [Dilu Admin](https://github.com/baowk/dilu-admin) - 前端管理界面
- [Dilu Plugin](https://github.com/baowk/dilu-plugin) - 插件扩展库
- [Dilu Ctl](https://github.com/baowk/dilu-ctl) - 项目脚手架工具 ⭐
- [在线演示](http://dilu.youwan.art) - 系统演示环境
- [更新日志](CHANGELOG.md) - 版本变更记录

## 📄 许可证

本项目采用 MIT 许可证，详情请参见 [LICENSE](LICENSE) 文件。

---

<p align="center">
  Made with ❤️ by <a href="https://github.com/baowk">baowk</a>
</p>
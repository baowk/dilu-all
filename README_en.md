# Dilu-All - Full-Featured Go Web Development Framework

<p align="center">
  <img src="https://github.com/baowk/dilu/assets/142554979/ee341fb7-f98e-4f18-9658-f89b4f7d466f" alt="Dilu Logo" width="200">
</p>

<h3 align="center">Enterprise-Grade Full-Stack Web Development Solution</h3>

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

## 📖 Project Overview

Dilu-All is the full-featured version of the Dilu framework, integrating all core plugins and enterprise-level functional modules. It's designed for scenarios requiring rapid construction of complete backend management systems, providing an out-of-the-box enterprise-grade solution.

### 🎯 Application Scenarios
- Enterprise backend management system development
- SaaS multi-tenant platform construction
- Rapid prototype development
- Microservices architecture foundation framework

### 🔧 Ecosystem Components

- **Dilu All**: Full-featured version (current project)
- **Dilu Core**: Core simplified version
- **Dilu Plugin**: Plugin extension library
- **Dilu Ctl**: Project scaffolding tool ⭐
- **Dilu Admin**: Frontend admin interface

> ⚡ **Recommendation**: Use the [Dilu Ctl](https://github.com/baowk/dilu-ctl) scaffolding tool to create complete projects with both frontend and backend in one command.

## ✨ Core Features

### 🏢 Enterprise Functions
- **Complete Permission System**: RBAC role-based permission management with fine-grained access control
- **Multi-tenant Support**: Well-designed SaaS architecture supporting independent multi-team operations
- **Data Dictionary**: Unified data dictionary management for easy business configuration
- **Operation Logs**: Complete operational audit log recording
- **File Management**: Supports both local and cloud storage file upload management

### 🛠️ Technical Advantages
- **Plugin Architecture**: Modular design with on-demand feature component activation
- **Code Generation**: Powerful code generator supporting complex business scenarios
- **API Management**: Comprehensive API documentation and testing tools
- **Monitoring & Alerting**: System performance monitoring and exception alert mechanisms
- **Internationalization**: Multi-language interface support

## 🚀 Quick Start

### Method 1: Using Scaffolding Tool (Recommended)

Use the [Dilu Ctl](https://github.com/baowk/dilu-ctl) scaffolding tool to create complete projects with one command:

```bash
# Install scaffolding tool
go install github.com/baowk/dilu-ctl@latest

# Create complete project (including frontend and backend)
dilu-ctl -n myproject -a

# Enter backend project directory and start
cd myproject
go run main.go start -c resources/config.dev.yaml

# In new terminal, enter frontend project directory
cd ../myproject-admin
npm install
npm run dev
```

### Method 2: Manual Installation

1. **Get Source Code**
```bash
git clone https://github.com/baowk/dilu-all.git
# or
git clone https://gitee.com/walkbao/dilu-all.git
```

2. **Install Dependencies**
```bash
cd dilu-all
go mod tidy
```

3. **Database Initialization**
```sql
-- Create required databases
CREATE DATABASE `dilu-db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE `dental-db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Import initial data
SOURCE resources/dbs/dilu-db.sql;
SOURCE resources/dbs/dental-db.sql;
```

4. **Configuration Setup**

Modify `resources/config.dev.yaml`:
```yaml
dbcfg:
  driver: mysql
  dns: root:password@tcp(127.0.0.1:3306)/dilu-db?charset=utf8&parseTime=True&loc=Local
  dbs:
    - dental:
        dns: root:password@tcp(127.0.0.1:3306)/dental-db?charset=utf8&parseTime=True&loc=Local
```

5. **Start Service**
```bash
go run main.go start -c resources/config.dev.yaml
```

## 🏗️ Project Structure

```
dilu-all/
├── cmd/           # Command line tools
├── common/        # Common components and middleware
├── docs/          # Technical documentation
├── modules/       # Business function modules
│   ├── base/      # Basic management module
│   ├── core/      # Core function module
│   ├── job/       # Scheduled task module
│   └── sys/       # System management module
├── resources/     # Configuration files and SQL scripts
├── temp/          # Temporary files
├── main.go        # Application entry point
└── go.mod         # Dependency management
```

## 📚 Module Introduction

### 🔐 User Authentication Module
- JWT Token authentication mechanism
- Multi-factor identity verification
- Session management and timeout control
- Login failure attempt limiting

### 👥 Permission Management System
- Role-Based Access Control (RBAC)
- Menu permission configuration
- API interface access control
- Data permission isolation

### 📊 System Management Functions
- User Management (CRUD, status control)
- Role Management (permission assignment, menu configuration)
- Menu Management (dynamic routing, access control)
- Department Organization Management
- Dictionary Data Management
- Operation Log Audit

### 🛠️ Development Tools
- Online code generator
- Automatic API documentation generation
- SQL executor
- Scheduled task management
- System monitoring dashboard

## 🛠️ Integrated Development Tools

### Dilu Ctl Scaffolding Tool
[Dilu Ctl](https://github.com/baowk/dilu-ctl) is a scaffolding tool specially designed for the Dilu ecosystem, particularly suitable for rapidly setting up complete projects:

**Main Features:**
- ✅ One-command creation of complete frontend and backend project structures
- ✅ Automatic configuration of inter-project dependencies
- ✅ Intelligent updating of path references in configuration files
- ✅ Support for both SSH and HTTPS Git protocols
- ✅ Automatic handling of package name replacement and module renaming

**Usage Example:**
```bash
# Install tool
go install github.com/baowk/dilu-ctl@latest

# Create complete project
dilu-ctl -n company-project -a

# Project structure
company-project/        # Backend project (dilu-all)
├── go.mod
├── main.go
└── resources/
    └── config.dev.yaml  # front-path automatically configured

company-project-admin/  # Frontend project (dilu-admin)
├── package.json
├── vite.config.js
└── src/
```

## 🎯 Typical Application Scenarios

### Enterprise Management Backend
```
├── User Center
│   ├── User Management
│   ├── Role Permissions
│   └── Department Management
├── System Configuration
│   ├── Parameter Configuration
│   ├── Dictionary Management
│   └── Announcements
└── System Monitoring
    ├── Operation Logs
    ├── Login Logs
    └── Performance Monitoring
```

### SaaS Platform Architecture
- Supports multi-tenant data isolation
- Independent domain names and resource allocation
- Flexible billing and package management
- Unified identity authentication center

## 🔧 Advanced Configuration

### Environment Variables
```bash
export DILU_ENV=production
export DILU_PORT=8080
export DILU_DB_HOST=localhost
export DILU_REDIS_ADDR=localhost:6379
```

### Docker Deployment
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

## 🤝 Community & Support

### Technical Discussion
<div align="center">
  <img src="https://github.com/baowk/dilu/assets/142554979/29a6863c-4bdc-4963-99c2-0c400e132f6f" width="300" alt="WeChat Group QR Code">
  <br>
  <sub>Please note "Dilu Full Version" when adding WeChat</sub>
</div>

### Learning Resources
- 📖 [Official Documentation](docs/)
- 🎬 [Video Tutorials](#)
- 💬 [Technical Q&A](https://github.com/baowk/dilu-all/issues)
- 📚 [Best Practices](docs/best-practices.md)

## 🔗 Related Links

- [Dilu Core](https://github.com/baowk/dilu) - Core simplified version
- [Dilu Admin](https://github.com/baowk/dilu-admin) - Frontend admin interface
- [Dilu Plugin](https://github.com/baowk/dilu-plugin) - Plugin extension library
- [Dilu Ctl](https://github.com/baowk/dilu-ctl) - Project scaffolding tool ⭐
- [Online Demo](http://dilu.youwan.art) - System demonstration environment
- [Changelog](CHANGELOG.md) - Version change records

## 📄 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

<p align="center">
  Made with ❤️ by <a href="https://github.com/baowk">baowk</a>
</p>
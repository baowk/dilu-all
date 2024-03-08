# dilu-all 

## 简介
的卢，是golang下的一套web快速框架，系统基于gin+gorm封装，并实现了代码自动生成。
- 前端基于vue3+element-plus[点我查看](https://github.com/baowk/dilu-admin)
- [演示地址](http://dilu.youwan.art),系统做了saas化设计，主账号直接dilu登录，团队账户为tangtang，密码默认。

dilu的完整版，包含了所有插件使用，配合[dilu-admin](https://github.com/baowk/dilu-admin)使用，能快速实现一个完整的后台管理系统。自己开发推荐[的卢简化版](https://github.com/baowk/dilu)。

## 安装使用

- 获取项目代码
```bash
git clone https://github.com/baowk/dilu-all.git
```

- 安装依赖
```bash
cd dilu-all
go mod tidy
```

- 初始化
mysql 创建两个库，dulu-db,dental-db
导入基础数据 
resources\dbs\dental-db.sql
resources\dbs\dilu-db.sql
修改数据库配置
resources\config.dev.yaml
```yaml
dbcfg: # 数据库配置
  driver: mysql  
  dns: root:12345678@tcp(127.0.0.1:3306)/dilu-db?charset=utf8&parseTime=True&loc=Local&timeout=1000ms  # 数据库连接字符串

  dbs:      
    - dental:    #子配置会继承父配置
        dns: root:12345678@tcp(127.0.0.1:3306)/dental-db?charset=utf8&parseTime=True&loc=Local&timeout=1000ms  # 数据库连接字符串
```

- 运行
```bash
go run main.go start -c resources/config.dev.yaml
```

- 交流群

  欢迎家人们star，微信群二维码一周就过期，有问题或者想进行技术交流的先加我微信，我拉你进群!![微信图片_20240308215943](https://github.com/baowk/dilu/assets/142554979/29a6863c-4bdc-4963-99c2-0c400e132f6f)

前端使用请[跳至前端](https://github.com/baowk/dilu-admin)
![d7f4b2513f7440d6c4c9bd932b4800f](https://github.com/baowk/dilu/assets/142554979/ee341fb7-f98e-4f18-9658-f89b4f7d466f)



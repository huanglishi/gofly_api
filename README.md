# GoFly API版本介绍
## 一、框架介绍
 
GoFly API开发框架来自我们的医疗项目，从2019年开始用于医疗系统开发，医疗项目已经运行多年，框架的安全性、并发性能、稳定性已经得到验证。特别是在疫情期间的疫苗预约接种留观等并发和反应速度都表现良好,你可放心使用于你的项目中去。

## 二、优势简介

1. 系统已集成开发常用基础功能，开箱即用，快速开始您业务开发，快人一步，比同行节省成本，降本增效首选。

2. 框架提供其他开发者开发的插件，可快速安装或卸载，让开个资源共享，同意功能无需重复造车，一键安装即可使用。 框架搭建了一键 CRUD 生成前后端代码，建数据库一键生成，节省您的复制粘贴时间，进一步为您节省时间。

3. 集成操作简单的 ORM 框架，操作数据非常简单，就像使用php的Laravel一样，您可以去文档看看 [框架的ROM数据库操作文档](https://doc.goflys.cn/docview?id=25&fid=289)
   例如下面语句就可以查找一条数据：
 ```
  db.Table("users").Fields("uid,name,age").First()
```
## 三、目录结构

```
├── app                     # 应用目录
│   ├── common              # 公共应用模块
│   ├── home                # 可以编写平台对应网站
│   └── controller.go       # 应用控制器
├── bootstrap               # 工具方法
├── global                  # 全局变量
├── model                   # 数据模型
├── resource                # 静态资源和配置文件config.yml
├── route                   # 路由
├── runtime                 # 运行日志文件
├── tmp                     # 开发是使用fresh热编译 产生临时文件
├── utils                   # 工具包
├── go.mod                  # 依赖包管理工具
├── go.sum         
├── main.go                 # main函数        
└── README.md               # 项目介绍
```
开发时仅需在app目录下添加你新的需求，app外部文件建议不要改动，除了config配置需要改，其他不要修改，
框架已经为您封装好，你只需在app应用目录书写你的业务，路由、访问权限、跨域、限流、Token验证、ORM等
框架已集成好，开发只需添加新的方法或者新增一个文件即可。
## 四、快速开发注意事项
1. 方法采用驼峰命名法，系统自动将首字母小写，Get打头命名的方法自动加载为GET请求，Put打头命名的方法自动加载为PUT请求,
Del打头命名的方法自动加载为DELETE请求,GetPost打头命名的方法自动加载为分别为GET和POST请求，除了以上命名打头其余系统默认POST请求。
2. 开发时如果在app目录下新增目录如新增wxapp（小程序接口）则要在app/controller.go添加_ "gofly/app/wxapp"到import中，否则系统不会加载到路由中去。

## 五、api服务端安装
版本：v1.1.0

### 安装fresh 热更新-边开发边编译
go install github.com/pilu/fresh@latest
```
#请修改fresh配置runner.conf.sample中的 
ignored:           assets, tmp, web
添加 web 让他不要监听前端开发更新

```
### 初始化mod
go mod tidy

### 热编译运行
bee run 或 fresh 
### 打包
go build main.go
### 打包（此时会打包成Linux上可运行的二进制文件，不带后缀名的文件）
```
SET GOOS=linux
SET GOARCH=amd64
go build
```
### widows
```
// 配置环境变量
SET CGO_ENABLED=1
SET GOOS=windows
SET GOARCH=amd64

go build main.go

// 编译命令
```
### 编译成Linux环境可执行文件
```

// 配置参数
SET CGO_ENABLED=0 
SET GOOS=linux 
SET GOARCH=amd64 

go build main.go

// 编译命令
```



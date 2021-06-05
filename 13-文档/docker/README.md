# Sleipnir docker环境

本模块作用：

- 提供纯净的docker ubuntu环境
- 提高测试速度：充分利用服务器，相关编译在服务器上进行
- 依赖追踪：相关依赖记录于Dockerfile中，便于环境复现



## 1. dockerfile构建镜像（开发者选项）

``` bash
# 在docker/tmp/install下执行下载文件
$ wget -O gtsam.zip https://github.com/borglab/gtsam/archive/4.0.0-alpha2.zip
$ wget -O anaconda.sh https://repo.anaconda.com/archive/Anaconda3-2020.07-Linux-x86_64.sh
$ git clone https://github.com/GDUT-IIDCC/Sleipnir.git

# 在docker目录下构建镜像
$ docker build -t sleipnir .
```



## 2. docker构建容器（开发者选项）

```bash
# 当前文件夹下执行
$ bash build.sh
```



## 3. 容器的使用

0. 连接服务器

``` bash
 $ ssh ah_chung@10.23.21.102 
```

1. 一般情况下，服务器无关机和重启则可直接运行以进入容器

```bash
$ docker exec -it Sleipnir /bin/bash
```

2. 进入容器后若代码有更新则，则拉取最新的代码（容器中代码为2020.11.4号版本）

``` 
$ git pull
```

3. 自由发挥，可进行编译等相关工作



PS：

- 若容器未启动则在终端

```bash
$ docker start Sleipnir
```

- 若需要文件的交互可将文件传到  `/home/ah_chung/chang_ws`  ，相关文件挂载在 `/home/change_ws`  

  


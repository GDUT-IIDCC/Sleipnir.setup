# 环境配置(20.04)

- `conda虚拟环境` 适用于二维目标检测、UI等依赖python的包

## 安装

### 改源（optional）

修改下载源（包括apt, conda, pip），当前脚本可选[广工源](https://mirrors.gdut.edu.cn/)和[清华源](https://mirrors.tuna.tsinghua.edu.cn/)

```bash
$ bash ./switch_source.sh
```

### 搭建基础依赖环境（含ros）

- ros的安装使用清华源

```bash
$ sudo bash ./build_basic_env.sh
```

### conda

安装conda环境（默认环境名为`sleipnir`，环境路径为`{HOME}/anaconda3/envs/sleipnir`，可视实际情况进行修正），需[先安装anaconda](https://shimo.im/docs/Jc6dvgDcthPwhTH6)

```bash
$ source ./build_conda_env.sh
```

### python

安装python依赖包

``` bash
$ source ./build_python_env.sh
```

### 安装第三方包

```bash
$ bash ./install_gtsam.sh
```

### [安装cuda等常用程序](https://shimo.im/docs/drhDv3c6k3HHjHrg)

```
# 添加环境变量（根据实际情况调节路径）
$ export PATH=${PATH}:"/usr/local/cuda/bin" 
&& export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:"/usr/local/cuda/lib64":"${HOME}/application/TensorRT-7.0.0.11/lib"
```

## 其他（optional）

- 安装常用软件(v2ray, typora...) 

```bash
$ ./install_software.sh
```

- 利用脚本配置网络环境(需要根据实际情况，修改脚本中的参数)

```bash
$ ./set_ip.sh
```

- 添加命令行alias

```bash
$ cat ./alias.sh >> ~/.bashrc
```






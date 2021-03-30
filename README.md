#  环境配置

- `conda虚拟环境` 适用于二维目标检测、UI
- 相关脚本中已自带清华源的配置(apt, ros, conda, pypi)

# 安装

## 基础依赖环境（含ros）

```bash
$ sudo  bash ./build_basic_env.sh
```

## conda

- 安装conda环境（默认环境名为`sleipnir`，环境路径为`{HOME}/anaconda3/envs/sleipnir`，可视实际情况进行修正，默认配置为清华源）

```bash
$ source build_conda_env.sh
```

## pip

- 安装python依赖包

``` bash
$ source build_pypi_env.sh
```

## [安装cuda等常用程序](https://shimo.im/docs/drhDv3c6k3HHjHrg)

```
# 添加环境变量（根据实际情况调节路径）
$ export PATH=${PATH}:"/usr/local/cuda/bin" 
&& export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:"/usr/local/cuda/lib64":"${HOME}/application/TensorRT-7.0.0.11/lib"
```

# 命令行alias

```bash
$ cat ./alias.sh >> ~/.bashrc
```

# 自动化脚本

- 安装常用软件(v2ray, typora...) 

```bash
$ ./install_software.sh
```

- 利用脚本配置网络环境(需要根据实际情况，修改脚本中的参数)

```bash
$ ./set_ip.sh
```



# TODO

- 提供gtsam、cuda、TensorRT、显卡驱动下载的脚本

- docker环境的更新
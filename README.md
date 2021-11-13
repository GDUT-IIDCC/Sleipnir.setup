# 环境配置(20.04)

根据经验，最好按照顺序配置；比如先搭建好基础的apt包环境，再安装显卡驱动这些，否则容易出现依赖缺失的问题

## Basic Setup

### 改源（optional）

修改下载源（包括apt, conda, pip），当前脚本可选[广工源](https://mirrors.gdut.edu.cn/)和[清华源](https://mirrors.tuna.tsinghua.edu.cn/)

```bash
$ bash ./basic_setup/switch_source.sh
```

### 搭建基础系统环境（含ros）

ros的安装将使用清华源

```bash
$ bash ./basic_setup/build_basic_env.sh
```

### conda

- `conda虚拟环境` 适用于二维目标检测、UI等依赖python的包，不需要时则不用安装

- 安装conda环境（默认环境名为`sleipnir`，环境路径为`{HOME}/anaconda3/envs/sleipnir`，可视实际情况进行修正），需[先安装anaconda](https://shimo.im/docs/Jc6dvgDcthPwhTH6)
- 改用`mamba`提升下载速度，在成功的案例中，**全程使用科学上网+官方源（没用清华源或广工源进行配置）**

```bash
$ source ./basic_setup/build_conda_env.sh
```

**PS：强烈推荐直接解压缩导入文件到`{HOME}/anaconda3/envs/sleipnir`，避免在用conda下载时花费过多的时间。文件：[google Drvie]( https://drive.google.com/file/d/1Tm1PZnzVNFF0hpWAaCH0inaAI6W3toqs/view?usp=sharing)**；详细说明可参考[link](https://shimo.im/docs/xXtyQk9CccgtWPtV#anchor-Q6u0)

```bash
# 下载conda pack(base环境下)
$ conda install conda-pack
# dst机上解压缩（tar...），解压缩放到env目录下
$ ...
# 修复前缀项(conda-unpack在bin目录下)
$ conda activate <环境名>  && conda-unpack
# 在实际测试时，后续可能需要再pip install一下（参考下一步）来补全一些缺漏的pip包或修正一些python包
```

### python

安装python依赖包，如果是通过conda环境拷贝的话则可跳过这一步

``` bash
$ source ./basic_setup/build_python_env.sh
```

## Install Third-Party package

```bash
# 于定位模块使用
$ bash ./third-party/install_gtsam.sh
# 于规划模块使用
$ bash ./third-party/install_osqp.sh

$ bash ./third-party/install_ceres.sh
```

## [Deep Learning Env Setup](https://natsu-akatsuki.readthedocs.io/en/latest/%E6%B7%B1%E5%BA%A6%E5%AD%A6%E4%B9%A0%E7%AC%94%E8%AE%B0/rst/%E5%BC%80%E5%8F%91%E7%8E%AF%E5%A2%83%E6%90%AD%E5%BB%BA.html)

1. 对应`TensorRT 7.2.3`, `cudnn8.1.1`, `cuda11.1`

- 官网下载安装包，本部分只提供参考链接
  - cuda11.1：wget -c https://developer.download.nvidia.com/compute/cuda/11.1.1/local_installers/cuda_11.1.1_455.32.00_linux.run
  - [cudnn 8.1.1](https://developer.nvidia.com/compute/machine-learning/tensorrt/secure/7.2.3/tars/TensorRT-7.2.3.4.Ubuntu-18.04.x86_64-gnu.cuda-11.1.cudnn8.1.tar.gz)
  - [TensorRT 7.2.3](https://developer.nvidia.com/compute/machine-learning/tensorrt/secure/7.2.3/tars/TensorRT-7.2.3.4.Ubuntu-18.04.x86_64-gnu.cuda-11.1.cudnn8.1.tar.gz)

- [百度网盘](https://pan.baidu.com/s/1cYyQcMq-FCrw2jlaUvufRg) ，密码: pl5g

2. 解压与安装（略，只对cudnn进行补充说明），**注意复制的目录**

``` bash
$ sudo cp cuda/include/cudnn*.h /usr/local/cuda/include \
&& sudo cp -P cuda/lib64/libcudnn* /usr/local/cuda/lib64 \
&& sudo chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*
```

3. 添加环境变量到`~/.bashrc`（根据实际情况调节路径）

```bash
CUDA_PATH=/usr/local/cuda/bin
CUDA_LIB_PATH=/usr/local/cuda/lib64
TENSORRT_LIB_PATH=${HOME}/application/TensorRT-7.2.3.4/lib
export PATH=${PATH}:${CUDA_PATH}
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${CUDA_LIB_PATH}:${TENSORRT_LIB_PATH}
```

## Other（optional）

- 安装常用软件(v2ray, typora...) 

```bash
$ ./scripts/install_software.sh
```

- 利用脚本配置网络环境(需要根据实际情况，修改脚本中的参数)

```bash
$ ./scripts/set_ip.sh
```

# Changelog

1. 2021.5.21 v0.0.1 应kuzen要求增设`默认选项`，只需按回车键即能触发默认选项
2. 2021 5.29 v0.0.2 添加感知模块gpu依赖的配置说明
3. 2021 5.29 v0.0.3 补充conda环境下载说明
4. 2021 6.04 v0.0.4 添加日志记录功能

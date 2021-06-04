# 环境配置(20.04)

- `conda虚拟环境` 适用于二维目标检测、UI等依赖python的包

## 00-搭建基础环境

### 改源（optional）

修改下载源（包括apt, conda, pip），当前脚本可选[广工源](https://mirrors.gdut.edu.cn/)和[清华源](https://mirrors.tuna.tsinghua.edu.cn/)

```bash
$ bash ./switch_source.sh
```

### 搭建基础系统环境（含ros）

ros的安装将使用清华源

```bash
$ sudo bash ./build_basic_env.sh
```

### conda

- 安装conda环境（默认环境名为`sleipnir`，环境路径为`{HOME}/anaconda3/envs/sleipnir`，可视实际情况进行修正），需[先安装anaconda](https://shimo.im/docs/Jc6dvgDcthPwhTH6)

- 改用`mamba`提升下载速度
- 在成功的案例中，**全程使用科学上网+官方源（没用清华源或广工源进行配置）**

```bash
$ source ./build_conda_env.sh
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

安装python依赖包

``` bash
$ source ./build_python_env.sh
```

## 01-安装第三方包

```bash
# 于定位模块使用
$ bash ./install_gtsam.sh
# 于规划模块使用
$ bash ./install_osqp.sh
```

## 02-[配置深度学习环境](https://shimo.im/docs/drhDv3c6k3HHjHrg)

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

```
CUDA_PATH=/usr/local/cuda/bin
CUDA_LIB_PATH=/usr/local/cuda/lib64
TENSORRT_LIB_PATH=${HOME}/application/TensorRT-7.2.3.4/lib
export PATH=${PATH}:${CUDA_PATH}
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${CUDA_LIB_PATH}:${TENSORRT_LIB_PATH}
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



# 日志

1. 2021.5.21 v0.0.1 应kuzen要求增设`默认选项`，只需按回车键即能触发默认选项
2. 2021 5.29 v0.0.2 添加感知模块gpu依赖的配置说明
3. 2021 5.29 v0.0.3 补充conda环境下载说明
4. 2021 6.04 v0.0.4 添加日志记录功能
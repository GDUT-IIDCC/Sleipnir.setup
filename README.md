# 环境配置

本环境配置面向广东工业大学sleipnir无人车项目(for ubuntu 20.04 TensorRT7.2.3)

---

**注意事项**

- 默认使用者具备一定的ubuntu开发经验

- 根据经验，最好**按照顺序配置**；比如先搭建好基础的apt包环境，再安装显卡驱动这些，否则容易出现依赖缺失的问题（比如装显卡驱动时，缺乏gcc, g++依赖）

---

## (recommend) container development

由于native PC和实际开发时用到的依赖不一定一致，另外，由于部分网络原因(Great Fire Wall & DNS Resolution Pollution)，一些依赖项难以直接获得，因此提供即开即用的docker容器环境

步骤一：（**虚拟机可跳过该步**）[安装显卡驱动](https://ambook.readthedocs.io/zh/latest/deep-learning/rst/env-building.html#id1)（新手可通过命令行安装，假定native PC已安装gcc, g++等依赖）

步骤二：安装[docker](https://ambook.readthedocs.io/zh/latest/docker/rst/docker-practice.html#docker)和[nvidia-container2](https://ambook.readthedocs.io/zh/latest/docker/rst/docker-practice.html#id4)（虚拟机不用下载nvidia-container2）

步骤三：拉取镜像（镜像大小约为21G，需留够充足的空间）

```bash
# passwd: gdutiidccdocker.
$ docker login --username=黄导nat registry.cn-hangzhou.aliyuncs.com
$ docker pull registry.cn-hangzhou.aliyuncs.com/gdut-iidcc/sleipnir:1.0.0
```

步骤四：创建容器

```bash
# 虚拟机需要删除build_container.sh脚本中"--gpus all"这个option
$ bash ./docker/build_container.sh
```

步骤五：拉取工程并在容器中编译

- 在容器中则git clone到/change_ws下(在native PC中，可以git clone Sleinpir工程到`${HOME}/change_ws`目录下

```bash
# 新建一个终端与容器进行交互
$ docker exec -it trt7.2.3-ros1 /bin/bash
$ cd /change_ws
$ git clone https://github.com/GDUT-IIDCC/Sleipnir --depth=1
$ cd Sleipnir
# (optional：导入感知模块和可视化界面) bash bash/import_git_repository.sh
# 在容器中进行编译
$ catkin build
```

---

**NOTE**

- 虚拟机无法使用显卡

- 电脑重启后需要启动容器

```bash
$ docker start trt7.2.3-ros1
```

---

## native PC development

### Basic Setup

#### 改源（optional）

修改下载源（包括apt, conda, pip），当前脚本可选[广工源](https://mirrors.gdut.edu.cn/)和[清华源](https://mirrors.tuna.tsinghua.edu.cn/)

```bash
$ bash ./basic_setup/switch_source.sh
```

#### 搭建基础系统环境（含ros1）

ros1的安装将使用清华源

```bash
$ bash ./basic_setup/build_basic_env.sh
```

### conda（optional）

需先[安装anaconda](https://ambook.readthedocs.io/zh/latest/ubuntu/rst/Package-Download-Virtual-Env.html#conda)

---

**ATTENTION**

`conda虚拟环境` 适用于二维目标检测、UI等依赖python的包，**不需要时则不用安装**

方法一：从头构建conda环境（默认环境名为`sleipnir`，环境路径为`{HOME}/anaconda3/envs/sleipnir`，可根据实际情况进行修正），在成功的案例中，**全程使用科学上网+官方源（没用清华源或广工源进行配置）**

```bash
$ source ./basic_setup/build_conda_env.sh
```

**（推荐）**方法二：直接解压缩导入文件到`{HOME}/anaconda3/envs/sleipnir`，避免在用conda下载时花费过多的时间。文件：[google Drvie]( https://drive.google.com/file/d/1Tm1PZnzVNFF0hpWAaCH0inaAI6W3toqs/view?usp=sharing)；详细说明可参考[link](https://ambook.readthedocs.io/zh/latest/ubuntu/rst/Package-Download-Virtual-Env.html#id16)

```bash
# 下载conda pack(base环境下)
$ conda install conda-pack
# dst机上解压缩（tar，解压缩时注意指定导出文件夹为sleipnir），解压缩放到env目录下
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

### Install Third-Party package

```bash
# 于定位模块使用
$ bash ./third-party/install_gtsam.sh
# 于规划模块使用
$ bash ./third-party/install_osqp.sh
# 于建图模块使用
$ bash ./third-party/install_ceres.sh
```

### [Deep Learning Env Setup](https://ambook.readthedocs.io/zh/latest/deep-learning/rst/env-building.html)（optional）

**不编译感知模块的可跳过该部分的内容**

1. 对应`TensorRT 7.2.3`, `cudnn8.1.1`, `cuda11.1`（版本的依赖关系很强，一定要对应好）

- 官网下载安装包，本部分只提供参考链接
  - cuda11.1：wget -c https://developer.download.nvidia.com/compute/cuda/11.1.1/local_installers/cuda_11.1.1_455.32.00_linux.run
  - [cudnn 8.1.1](https://developer.nvidia.com/compute/machine-learning/tensorrt/secure/7.2.3/tars/TensorRT-7.2.3.4.Ubuntu-18.04.x86_64-gnu.cuda-11.1.cudnn8.1.tar.gz)
  - [TensorRT 7.2.3](https://developer.nvidia.com/compute/machine-learning/tensorrt/secure/7.2.3/tars/TensorRT-7.2.3.4.Ubuntu-18.04.x86_64-gnu.cuda-11.1.cudnn8.1.tar.gz)（安装目录假定为${HOME}/application）

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

### Other（optional）

- 安装常用软件(v2ray, typora...) 

```bash
$ ./scripts/install_software.sh
```

- 利用脚本配置网络环境(需要根据实际情况，修改脚本中的参数)

```bash
$ ./scripts/set_ip.sh
```

## Changelog

1. 2021.5.21 v0.0.1 应kuzen要求增设`默认选项`，只需按回车键即能触发默认选项
2. 2021 5.29 v0.0.2 添加感知模块gpu依赖的配置说明
3. 2021 5.29 v0.0.3 补充conda环境下载说明
4. 2021 6.04 v0.0.4 添加日志记录功能
4. 2022 1.23 v1.0.0 增加docker容器

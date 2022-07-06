# 环境配置

本环境配置面向广东工业大学sleipnir无人车项目(for ubuntu 20.04 TensorRT7.2.3)

---

**注意事项**

- 默认使用者具备一定的ubuntu开发经验

- 根据经验，最好**按照顺序配置**；比如先搭建好基础的apt包环境，再安装显卡驱动这些，否则容易出现依赖缺失的问题（比如装显卡驱动时，缺乏gcc, g++依赖）

## 本地环境

### 基础配置

```bash
# install requirements
$ sudo apt install dialog
$ bash Setup.sh
```

![image-20220624220346192](https://natsu-akatsuki.oss-cn-guangzhou.aliyuncs.com/img/image-20220624220346192.png)

### 安装第三方包

```bash
$ source InstallThirdParty.sh
# 于定位模块使用
$ InstallGtsam
# 于规划模块使用
$ InstallOsqp
# 于建图模块使用
$ InstallCeres
```

### 配置快捷方式和使能底盘模块

```bash
$ sudo apt install expect
$ bash service/setup.sh
```

### [深度学习依赖安装](https://ambook.readthedocs.io/zh/latest/DeepLearning/rst/EnvSetup.html)

**不编译感知模块的可跳过该部分的内容**

|    依赖包     | 版本号 |
| :-----------: | :----: |
| nvidia-driver |        |
|   TensorRT    | 7.2.3  |
|     cudnn     | 8.1.1  |
|     cuda      |  11.1  |

#### 安装其他第三方库

```bash
# 导入库安装函数
$ source InstallThirdParty.sh

# 执行函数 e.g.
$ InstallV2ray
```

#### 支持的三方库

| package name | version                        | test time | function        |
| ------------ | ------------------------------ | --------- | --------------- |
| ceres        | v2.1 release [github / source] | 2022.5.14 | InstallCeres    |
| dbow2        | latest [github / source]       | 2022.6.05 | InstallDbow2    |
| g2o          | latest [github / source]       | 2022.6.05 | InstallG20      |
| gtsam        | v4.0 release [apt]             | 2022.5.14 | InstallGtsam    |
| osqp         | latest [github / source]       | 2022.6.05 | InstallOsqp     |
| pangolin     | latest [github / source]       | 2022.6.05 | InstallPangolin |
| sophus       | latest [github / source]       | 2022.6.05 | InstallSophus   |
| v2ray        | release [apt]                  | 2022.6.5  | InstallV2ray    |
| hstr         | release [apt]                  |           | InstallHstr     |

## IP配置

- `192.168.1.102`：本机电脑
- `192.168.1.200`：速腾聚创激光雷达
- `192.168.1.233`：mindvision千兆相机
- `192.168.1.50`：livox固态激光雷达

## 迭代说明

- 2021.5.21 v0.0.1 应kuzen要求增设`默认选项`，只需按回车键即能触发默认选项

- 2021 5.29 v0.0.2 添加感知模块gpu依赖的配置说明

- 2021 5.29 v0.0.3 补充conda环境下载说明

- 2021 6.04 v0.0.4 添加日志记录功能

- 2022 1.23 v1.0.0 增加docker容器

- 2022 6.04 v2.0.0 使用dialog包实现基于TUI的环境配置

- 2022 6.04 v2.1.0 使用函数管理第三方库的安装

- 2022 6.05 v3.0.0 移除conda环境

## Q&A

- [tee日志输出到终端不及时](https://stackoverflow.com/questions/41026503/tee-output-not-appearing-until-cmd-finishes)
- [Finding GeographicLib in CMake](https://stackoverflow.com/questions/48169653/finding-geographiclib-in-cmake-on-debian)

```bash
# e.g
$ sudo ln -s /usr/share/cmake/geographiclib/FindGeographicLib.cmake /usr/share/cmake-3.10/Modules/
```

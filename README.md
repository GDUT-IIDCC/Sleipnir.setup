#  环境配置

- `conda虚拟环境` 适用于二维目标检测、UI
- 相关脚本中已自带清华源的配置(apt, ros, conda, pypi)

# 安装

## 基础依赖环境 ros

- 节选自docker环境的配置

```bash
$ sudo  bash ./basic_env.sh
```

## conda

- 安装conda环境（默认环境名为`sleipnir`，环境路径为`/home/sleipnir/anaconda3/envs/sleipnir`，可视实际情况进行修正，默认配置为清华源）

```bash
$ source conda.sh
```

## pip

- 安装python依赖包

``` bash
$ source pypi.sh
```

# TODO

- 提供gtsam、cuda、TensorRT、显卡驱动下载的脚本

- docker环境的更新
#!/bin/bash

# 参数配置
set_container_name="--name=sleipnir"
image_name="sleipnir:latest"

# 文件挂载
set_volumes="--volume=${HOME}/Sleipnir:/Sleipnir:rw"

# 开启端口
vncPORT="-p 15900:5900"
pycharmPORT="-p 31111:22"
jupyterPORT="-p 8888:8888"
tensorboardPORT="-p 6006:6006"
set_network="${vncPORT} ${pycharmPORT} ${jupyterPORT} ${tensorboardPORT}"

# 设备限制
set_shm="--shm-size=8G"

docker run -it --gpus all \
    ${set_volumes} \
    ${set_network} \
    ${set_shm} \
    ${set_container_name} \
    $image_name

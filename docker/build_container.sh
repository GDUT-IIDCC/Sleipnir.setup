#!/bin/bash
# ref: http://wiki.ros.org/docker/Tutorials/Hardware%20Acceleration

# for debug
# set -x 
if [ ! -d ${HOME}/tmp} ]
then
    mkdir ${HOME}/tmp
fi

XAUTH=${HOME}/tmp/.docker.xauth
touch $XAUTH
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | sudo xauth -f $XAUTH nmerge -

# 参数配置
set_container_name="--name=sleipnir"
image_name="sleipnir:latest"

# 文件挂载
set_volumes="--volume=${HOME}/Sleipnir:/Sleipnir:rw"

# 开启端口
vncPORT="-p 15901:5901" 
pycharmPORT="-p 31111:22" 
jupyterPORT="-p 8888:8888" 
tensorboardPORT="-p 6006:6006" 


# 设备限制
set_shm="--shm-size=8G"

docker run -it --gpus all \
    --env="DISPLAY=$DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --env="XAUTHORITY=$XAUTH" \
    --volume="$XAUTH:$XAUTH" \
    --volume="${HOME}/tmp/.X11-unix:${HOME}/tmp/.X11-unix:rw" \
    --privileged \
    ${set_volumes} \
    ${set_network} \
    ${set_shm} \
    ${set_container_name} \
    $image_name
    
    


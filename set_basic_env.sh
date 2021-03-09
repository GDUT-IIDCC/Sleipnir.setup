#!/bin/bash

# 修改源，并安装apt包
sed -i s@/archive.ubuntu.com/@/mirrors.tuna.tsinghua.edu.cn/@g /etc/apt/sources.list
sudo apt-get update
sudo apt-get install -y \
    apt-utils \
    bash-completion \
    build-essential \
    ca-certificates \
    cmake \
    curl \
    git \
    keyboard-configuration \
    libx11-dev \
    locales \
    lsb-core \
    nano \
    software-properties-common \
    sudo \
    vim \
    wget

# 安装ROS
sudo sh -c '. /etc/lsb-release && echo "deb http://mirrors.tuna.tsinghua.edu.cn/ros/ubuntu/ `lsb_release -cs` main" > /etc/apt/sources.list.d/ros-latest.list' \
 && apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654 \
 && apt-get update \
 && apt-get install  -y ros-melodic-desktop-full \
 && echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc \
 && DEBIAN_FRONTEND=noninteractive apt install -y \
    build-essential \
    python-rosdep \
    python-rosinstall \
    python-rosinstall-generator \
    python-wstool

# 安装lanelet2依赖和catkin_tool
sudo apt-get update \
 && apt-get install -y \
    libboost-all-dev \
    libboost-python-dev \
    libeigen3-dev \
    libgeographic-dev \
    libgtest-dev \
    libpugixml-dev \
    python-catkin-tools

# 安装其他ros包依赖         
sudo apt-get update \
 && apt-get install -y \
    libglfw3-dev \
    libglm-dev \
    libpcap-dev \
    ros-melodic-angles \
    ros-melodic-camera-info-manager \
    ros-melodic-ddynamic-reconfigure \
    ros-melodic-diagnostic-updater \
    ros-melodic-geodesy \
    ros-melodic-jsk-recognition-msgs ros-melodic-visualization-msgs \
    ros-melodic-lanelet2 \
    ros-melodic-nav-msgs \
    ros-melodic-nmea-msgs \
    ros-melodic-serial \
    ros-melodic-velodyne-pointcloud

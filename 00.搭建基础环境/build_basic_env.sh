#!/bin/bash

# 安装基础的apt包
while true; do
    read -r -p "1. install basic apt package?  [Y/n] " input
    case $input in
        [yY][eE][sS] | [yY] | "")
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
                net-tools \
                openssh-server \
                software-properties-common \
                vim \
                wget \
                gcc-9 g++-9 gcc-10 g++-10
            break
            ;;

        [nN][oO] | [nN])
            break
            ;;

        *)
            echo "Invalid input..."
            ;;
    esac
done

# 安装ROS
while true; do
    read -r -p "2. install ROS?  [Y/n] " input
    case $input in
        [yY][eE][sS] | [yY] | "")
            sudo sh -c '. /etc/lsb-release && echo "deb http://mirrors.tuna.tsinghua.edu.cn/ros/ubuntu/ `lsb_release -cs` main" > /etc/apt/sources.list.d/ros-latest.list'
            sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
            sudo apt-get update
            sudo apt-get install  -y ros-noetic-desktop-full
            echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
            sudo apt-get install -y \
                build-essential \
                python3-rosdep \
                python3-rosinstall \
                python3-rosinstall-generator \
                python3-wstool
            break
            ;;

        [nN][oO] | [nN])
            break
            ;;

        *)
            echo "Invalid input..."
            ;;
    esac
done

# 安装其他ros包依赖
while true; do
    read -r -p "3. install ros-noetic package?  [Y/n] " input
    case $input in
        [yY][eE][sS] | [yY] | "")
            sudo apt-get update
            sudo apt-get install -y \
                libboost-all-dev \
                libboost-python-dev \
                libeigen3-dev \
                libgeographic-dev \
                libglfw3-dev \
                libglm-dev \
                libgtest-dev \
                libpugixml-dev \
                python3-catkin-tools \
                libpcap-dev \
                ros-noetic-angles \
                ros-noetic-camera-info-manager \
                ros-noetic-ddynamic-reconfigure \
                ros-noetic-diagnostic-updater \
                ros-noetic-geodesy \
                ros-noetic-jsk-recognition-msgs ros-noetic-visualization-msgs \
                ros-noetic-lanelet2 \
                ros-noetic-nav-msgs \
                ros-noetic-nmea-msgs \
                ros-noetic-tf2-sensor-msgs
            # catkin build的python依赖
            sudo apt install python3-pip
            pip3 install osrf-pycommon
            break
            ;;

        [nN][oO] | [nN])
            break
            ;;

        *)
            echo "Invalid input..."
            ;;
    esac
done

# 安装其他apt包依赖
while true; do
    read -r -p "4. install apt advanced package?  [Y/n] " input
    case $input in
        [yY][eE][sS] | [yY] | "")
            sudo apt-get update
            #  依次为top的升级版、监控网速、网络限速
            sudo apt-get install -y \
                htop \
                wondershaper \
                ethstatus \
                cowsay
            break
            ;;

        [nN][oO] | [nN])
            break
            ;;

        *)
            echo "Invalid input..."
            ;;
    esac
done

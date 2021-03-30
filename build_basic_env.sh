#!/bin/bash

# 修改源，并安装apt包
while true
do
	read -r -p "1. override ubuntu apt source lists? [y/n] " input
	case $input in
	    [yY][eE][sS]|[yY])
			sudo cp cfg/tsinghua_ubuntu_cfg /etc/apt/sources.list
			break
			;;

	    [nN][oO]|[nN])
			break
			;;

	    *)
			echo "Invalid input..."
			;;
	esac
done

# 安装基础的apt包
while true
do
	read -r -p "2. install basic apt package?  [y/n] " input
	case $input in
	    [yY][eE][sS]|[yY])
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
                sudo \
                vim \
                wget
            break
			;;

	    [nN][oO]|[nN])
			break
			;;

	    *)
			echo "Invalid input..."
			;;
	esac
done


# 安装ROS
while true
do
	read -r -p "3. install ROS?  [y/n] " input
	case $input in
	    [yY][eE][sS]|[yY])
			sudo sh -c '. /etc/lsb-release && echo "deb http://mirrors.tuna.tsinghua.edu.cn/ros/ubuntu/ `lsb_release -cs` main" > /etc/apt/sources.list.d/ros-latest.list'
            sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
            sudo apt-get update
            sudo apt-get install  -y ros-melodic-desktop-full
            echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
            sudo apt-get install -y \
                    build-essential \
                    python-rosdep \
                    python-rosinstall \
                    python-rosinstall-generator \
                    python-wstool
            break
			;;

	    [nN][oO]|[nN])
			break
			;;

	    *)
			echo "Invalid input..."
			;;
	esac
done


# 安装其他ros包依赖
while true
do
	read -r -p "4. install ros-melodic package?  [y/n] " input
	case $input in
	    [yY][eE][sS]|[yY])
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
                python-catkin-tools \
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
            break
			;;

	    [nN][oO]|[nN])
			break
			;;

	    *)
			echo "Invalid input..."
			;;
	esac
done


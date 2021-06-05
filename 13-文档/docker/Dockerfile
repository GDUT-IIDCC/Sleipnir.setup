# 基础镜像
FROM ubuntu:18.04

# 修改源，并安装apt包
RUN sed -i s@/archive.ubuntu.com/@/mirrors.tuna.tsinghua.edu.cn/@g /etc/apt/sources.list \
 && apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y \
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
    wget \
 && rm -rf /var/lib/apt/lists/*

# 解决中文显示乱码问题
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

# 安装ROS
RUN DEBIAN_FRONTEND=noninteractive  sh -c '. /etc/lsb-release && echo "deb http://mirrors.tuna.tsinghua.edu.cn/ros/ubuntu/ `lsb_release -cs` main" > /etc/apt/sources.list.d/ros-latest.list' \
 && apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654 \
 && apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install  -y ros-melodic-desktop-full \
 && echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc \
 && DEBIAN_FRONTEND=noninteractive apt install -y \
    build-essential \
    python-rosdep \
    python-rosinstall \
    python-rosinstall-generator \
    python-wstool \
 && rm -rf /var/lib/apt/lists/*

# 安装lanelet2依赖和catkin_tool
RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    libboost-all-dev \
    libboost-python-dev \
    libeigen3-dev \
    libgeographic-dev \
    libgtest-dev \
    libpugixml-dev \
    python-catkin-tools \
 && rm -rf /var/lib/apt/lists/*

# 安装其他ros包依赖         
RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    libglfw3-dev \
    libglm-dev \
    libpcap-dev \
    ros-melodic-angles \
    ros-melodic-camera-info-manager \
    ros-melodic-ddynamic-reconfigure \
    ros-melodic-diagnostic-updater \
    ros-melodic-geodesy \
    ros-melodic-jsk-recognition-msgs ros-melodic-visualization-msgs \
    ros-melodic-nav-msgs \
    ros-melodic-nmea-msgs \
    ros-melodic-serial \
    ros-melodic-velodyne-pointcloud \
 && rm -rf /var/lib/apt/lists/*

# 从本地当前目录导入文件
COPY tmp/install /home/

WORKDIR /home/Sleipnir

# 安装anaconda
RUN /bin/bash /home/anaconda.sh -b -p /opt/conda \
 && export PATH=/opt/conda/bin:$PATH \
 && conda init \
# && source ~/.bashrc \
 && conda config --set auto_activate_base false \
 && conda update conda \
 && rm /home/anaconda.sh

# 安装localization模块依赖（GTSAM-4.0.0-alpha2）
RUN cd /home \
 && unzip gtsam.zip \
 && cd gtsam-4.0.0-alpha2 \
 && mkdir build && cd build \
 && cmake .. \
 && make install -j 2 \
 && cd /home \
 && rm -rf gtsam*

# 入口点函数
ENTRYPOINT ["/bin/bash"]
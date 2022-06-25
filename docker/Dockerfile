# v2.0 2022.3.31
# >>> 基础镜像 >>>
FROM nvidia/cuda:11.1-cudnn8-devel-ubuntu20.04

# >>> 修改源，并安装apt包 >>>
# rm /etc/apt/sources.list.d/*: 删除cuda sources，避免无法update 
RUN sed -i s@/archive.ubuntu.com/@/mirrors.ustc.edu.cn/@g /etc/apt/sources.list \
    && sed -i '37,49d' /etc/apt/sources.list \
    && rm /etc/apt/sources.list.d/* \
    && apt update \
    && DEBIAN_FRONTEND=noninteractive apt install -y \
        apt-utils \
        bash-completion \
        build-essential \
        ca-certificates \
        cmake \
        curl \
        gcc-9 g++-9 gcc-10 g++-10 \
        git \
        keyboard-configuration \
        libx11-dev \
        locales \
        lsb-core \
        mlocate \
        nano \
        net-tools \
        openssh-server \
        software-properties-common \
        vim \
        wget \
    && rm -rf /var/lib/apt/lists/*

# >>> 安装ROS >>>
RUN DEBIAN_FRONTEND=noninteractive  sh -c '. /etc/lsb-release && echo "deb http://mirrors.tuna.tsinghua.edu.cn/ros/ubuntu/ `lsb_release -cs` main" > /etc/apt/sources.list.d/ros-latest.list' \
    && apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654 \
    && apt update \
    && DEBIAN_FRONTEND=noninteractive apt install -y ros-noetic-desktop-full \
    && echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc \
    && DEBIAN_FRONTEND=noninteractive apt install -y \
        python3-rosdep \
        python3-rosinstall \
        python3-rosinstall-generator \
        python3-wstool \
        python3-pip \
        && rm -rf /var/lib/apt/lists/*

# >>> 安装其他ros包依赖 >>>
RUN apt update \
    && DEBIAN_FRONTEND=noninteractive apt install -y \
        libboost-all-dev \
        libboost-python-dev \
        libeigen3-dev \
        libgeographic-dev \
        libglfw3-dev \
        libglm-dev \
        libgtest-dev \
        libpcap-dev \
        libpugixml-dev \
        python3-catkin-tools \
        ros-noetic-angles \
        ros-noetic-camera-info-manager \
        ros-noetic-ddynamic-reconfigure \
        ros-noetic-diagnostic-updater \
        ros-noetic-geodesy \
        ros-noetic-jsk-recognition-msgs ros-noetic-visualization-msgs \
        ros-noetic-lanelet2 \
        ros-noetic-nav-msgs \
        ros-noetic-nmea-msgs \
        ros-noetic-tf2-sensor-msgs \
    # catkin build的python依赖
    && rm -rf /var/lib/apt/lists/* \
    && pip3 install osrf-pycommon

# >>> nvidia-container-runtime >>>
ENV NVIDIA_VISIBLE_DEVICES ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics

# >>> 安装pip依赖 >>>
RUN pip3 install --no-cache-dir --extra-index-url https://download.pytorch.org/whl/cu113 \
    catkin_pkg \
    defusedxml \
    easydict \
    empy \
    fire \
    gdown \
    geographiclib \
    matplotlib \
    netifaces \
    numpy \
    opencv-python \
    pandas \
    pybind11[global] \
    pygeodesy \
    rospkg \
    torch \
    torchaudio \
    torchvision \
    tqdm \
    && apt update \
    && DEBIAN_FRONTEND=noninteractive apt install -y \
        python3-pyqt5.qtserialport

# >>> 解决中文显示乱码问题 >>>
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

# >>> 安装和配置vnc server >>>
RUN apt update \
    && DEBIAN_FRONTEND=noninteractive apt install -y \
        tigervnc-common \
        tigervnc-standalone-server \
        tigervnc-xorg-extension \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p $HOME/.vnc \
    && echo "#!/bin/bash" >> $HOME/.vnc/xstartup \
    && echo "startlxde &" >> $HOME/.vnc/xstartup \
    && echo "admin" | vncpasswd -f >> $HOME/.vnc/passwd && chmod 600 $HOME/.vnc/passwd \
    && echo "geometry=1920x1080" >> $HOME/.vnc/config

# >>> 安装lxde display manager >>>
RUN apt update \
    && DEBIAN_FRONTEND=noninteractive apt install -y --fix-missing \
        dolphin \
        konsole \
        lxde \
    && rm -rf /var/lib/apt/lists/*

# >>> 入口点函数 >>>
ENTRYPOINT ["/bin/bash"]



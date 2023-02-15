#!/bin/bash

OK=0
CANCEL=1
ESC=255

if [ -f /usr/bin/dialog ]; then
    dialog --create-rc ~/.dialogrc
else
    echo -e "\e[1;31mERROR: You must install dialog first to use this script\033[0m"
    exit 1
fi

Menu() {
    while :; do {
        Selection=$(dialog --no-shadow --title "Menu" \
            --clear \
            --cancel-label "Exit" \
            --menu "(↑/↓/space: choose | ←/→/enter: confirm)" 12 75 3 \
            1 "Change mirror" \
            2 "Basic setup" \
            2>&1 > /dev/tty)

        result=$?
        if [ $result -eq $OK ]; then
            Select $Selection
        elif [ $result -eq $CANCEL ] || [ $result -eq $ESC ]; then
            Exit
        fi
    }; done
}

Select() {
    Choice=$1

    case $Choice in
        1)
            ChangeMirror
            ;;
        2)
            Setup
            ;;
    esac
}

Setup() {
    while :; do {

        Input=$(dialog --checklist "Choose setup options (↑/↓/space: choose | ←/→/enter: confirm)" 12 75 4 \
            1 "install basic package" off \
            2 "install ros" off \
            3 "install ros package" off \
            4 "install pip package" off 2>&1 > /dev/tty)

        result=$?

        if [ $result -eq $CANCEL ] || [ $result -eq $ESC ]; then
            break
        elif [ $result -eq $OK ]; then
            {
                clear
                for option in $Input; do
                    case $option in
                        1)
                            InstallBasicPackage
                            ;;
                        2)
                            InstallROS
                            ;;
                        3)
                            InstallROSDependency
                            ;;
                        4)
                            InstallPIPPackage
                            ;;
                        5)  ;;
                    esac
                    Prompt
                done
            }
            break
        fi
    }; done
}

ChangeMirror() {
    while :; do {
        Number=$(dialog --title '' \
            --backtitle "$BACKTITLE" \
            --radiolist 'Select Mirrors (↑/↓/space: choose | ←/→/enter: confirm)' 15 80 4 \
            1 "GDUT (Guangdong University of Technology)" off \
            2 "Tsinghua (Tsinghua University)" on \
            3 "USTC (University of Science and Technology of China)" off \
            4 "XJTU (Xi'an Jiaotong University)" off \
            2>&1 > /dev/tty)
        result=$?
        if [ $result -eq $CANCEL ] || [ $result -eq $ESC ]; then
            break
        elif [ $result -eq $OK ]; then
            case $Number in
                1)
                    mirror="gdut"
                    pip install pip -U
                    pip config set global.index-url http://mirrors.gdut.edu.cn/pypi/simple
                    pip config set install.trusted-host mirrors.gdut.edu.cn
                    ;;
                2)
                    mirror="tuna.tsinghua"
                    clear
                    pip install pip -U
                    pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
                    ;;
                3)
                    mirror="ustc"
                    ;;
                4)
                    mirror="xjtu"
                    ;;
            esac
            sudo bash -c "cat << EOF > /etc/apt/sources.list
deb http://mirrors.${mirror}.edu.cn/ubuntu/ $(lsb_release -sc) main restricted universe multiverse
deb http://mirrors.${mirror}.edu.cn/ubuntu/ $(lsb_release -sc)-updates main restricted universe multiverse
deb http://mirrors.${mirror}.edu.cn/ubuntu/ $(lsb_release -sc)-backports main restricted universe multiverse
deb http://mirrors.${mirror}.edu.cn/ubuntu/ $(lsb_release -sc)-security main restricted universe multiverse
EOF"
            Prompt
            break
        fi
    }; done
}

Advanced() {
    while :; do {

        Input=$(dialog --checklist "Choose third-party installed (↑/↓/space: choose | ←/→/enter: confirm)" 12 75 3 \
            1 "install basic package" on \
            2 "install ros" on \
            3 "install ros package" on 2>&1 > /dev/tty)

        result=$?

        if [ $result -eq $CANCEL ] || [ $result -eq $ESC ]; then
            break
        elif [ $result -eq $OK ]; then
            {
                clear
                for option in $Input; do
                    case $option in
                        1)
                            InstallBasicPackage
                            ;;
                        2)
                            InstallROS
                            ;;
                        3)
                            InstallROSDependency
                            ;;
                        4) ;;
                    esac
                done
            }
            break
        fi
    }; done
}

InstallBasicPackage() {
    sudo apt update
    pkg_list=(
        apt-utils
        bash-completion
        build-essential
        ca-certificates
        cmake
        curl
        expect
        gcc-9 g++-9 gcc-10 g++-10
        gdb
        git
        keyboard-configuration
        libx11-dev
        lldb
        locales
        lsb-core
        mlocate
        nano
        net-tools
        openssh-server
        python-is-python3
        python3-pip
        software-properties-common
        vim
        wget
    )
    sudo apt install -y "${pkg_list[@]}"
}

InstallROS() {
    sudo bash -c '. /etc/lsb-release && echo "deb http://mirrors.tuna.tsinghua.edu.cn/ros/ubuntu/ `lsb_release -cs` main" > /etc/apt/sources.list.d/ros-latest.list'
    sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
    sudo apt update
    sudo apt install -y ros-noetic-desktop-full
    echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
    pkg_list=(
        build-essential
        python3-rosdep
        python3-rosinstall
        python3-rosinstall-generator
        python3-wstool
    )
    sudo apt install -y "${pkg_list[@]}"
}

InstallROSDependency() {
    sudo apt update
    pkg_list=(
        libboost-all-dev
        libboost-python-dev
        libeigen3-dev
        libgeographic-dev
        libglfw3-dev
        libglm-dev
        libgtest-dev
        libpugixml-dev
        python3-catkin-tools
        libpcap-dev
        ros-noetic-angles
        ros-noetic-camera-info-manager
        ros-noetic-ddynamic-reconfigure
        ros-noetic-diagnostic-updater
        ros-noetic-geodesy
        ros-noetic-jsk-recognition-msgs ros-noetic-visualization-msgs
        ros-noetic-lanelet2
        ros-noetic-nav-msgs
        ros-noetic-nmea-msgs
        ros-noetic-tf2-sensor-msgs
    )
    sudo apt install -y "${pkg_list[@]}"
    sudo apt install -y python3-pip
    pip install osrf-pycommon
}

InstallPIPPackage() {
    cat > /tmp/requirements.txt << EOF
catkin_pkg
defusedxml
easydict
empy
fire
gdown
geographiclib
matplotlib
netifaces
numpy==1.22.4
opencv-python
pandas
pybind11[global]
pygeodesy
rospkg
torch
torchaudio
torchvision
tqdm
EOF
    pip install -r /tmp/requirements.txt --extra-index-url https://download.pytorch.org/whl/cu113
}

Exit() {
    clear
    exit
}

Prompt() {
    echo -e "\e[32mHit any key to continue\e[0m" && read -r
}

Menu


umount ${mount_point}/sys \
&& umount ${mount_point}/proc \
&& umount ${mount_point}/dev \
&& umount ${mount_point}/
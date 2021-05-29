#!/bin/bash

# [typora] from https://www.typora.io/#linux
while true; do
    read -r -p "1. install typora? [Y/n] " input
    case $input in
        [yY][eE][sS] | [yY] | "")
            wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
            sudo add-apt-repository 'deb https://typora.io/linux ./'
            sudo apt-get update
            sudo apt-get install typora
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

# [v2rayA] from https://github.com/v2rayA/v2rayA/wiki/Usage
while true; do
    read -r -p "2. install v2rayA? [Y/n] " input
    case $input in
        [yY][eE][sS] | [yY] | "")
            # curl -O https://cdn.jsdelivr.net/gh/v2rayA/v2rayA@master/install/go.sh
            # install v2ray-core from jsdelivr
            sudo bash go.sh
            # add public key
            wget -qO - https://apt.v2raya.mzz.pub/key/public-key.asc | sudo apt-key add -
            # add V2RayA's repository
            echo "deb https://apt.v2raya.mzz.pub/ v2raya main" | sudo tee /etc/apt/sources.list.d/v2raya.list
            sudo apt update
            # install V2RayA
            sudo apt install v2raya -y
            sudo systemctl enable v2ray
            sudo systemctl start v2ray
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

# [flameshot] from https://github.com/flameshot-org/flameshot
while true; do
    read -r -p "2. install flameshot? [Y/n] " input
    case $input in
        [yY][eE][sS] | [yY] | "")
            # 1. apt装：旧版本，无文字添加功能
            sudo apt install flameshot -y

            # 2. 源码安装（注意cmake版本需3.13以上，可以创建一个cmake conda环境）
            # sudo apt install g++ cmake build-essential qt5-default qttools5-dev-tools libqt5svg5-dev qttools5-dev
            # sudo apt install libqt5dbus5 libqt5network5 libqt5core5a libqt5widgets5 libqt5gui5 libqt5svg5  # Run-time
            # sudo apt install git openssl ca-certificates  # Optional
            # cd ~
            # git clone https://github.com/flameshot-org/flameshot.git
            # cd flameshot && mkdir build && cd build
            # cmake ..
            # make
            # sudo make install

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

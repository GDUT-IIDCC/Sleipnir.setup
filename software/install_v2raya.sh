#!/bin/bash

# [v2rayA] from https://v2raya.org/docs/prologue/introduction/
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
            # start v2rayA
            sudo systemctl start v2raya
            sudo systemctl enable v2raya
            # 似乎不需要依赖v2ray
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

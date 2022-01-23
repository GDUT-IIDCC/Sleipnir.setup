#!/bin/bash

# [v2rayA] from https://v2raya.org/docs/prologue/introduction/
while true; do
    read -r -p "2. install v2rayA? [Y/n] " input
    case $input in
        [yY][eE][sS] | [yY] | "")
            curl -Ls https://mirrors.v2raya.org/go.sh | sudo bash
            sudo systemctl disable v2ray --now
            wget -qO - https://apt.v2raya.mzz.pub/key/public-key.asc | sudo apt-key add -
            echo "deb https://apt.v2raya.mzz.pub/ v2raya main" | sudo tee /etc/apt/sources.list.d/v2raya.list
            sudo apt update            
            sudo apt install v2raya -y
            sudo systemctl start v2raya.service
            sudo systemctl enable v2raya.service
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

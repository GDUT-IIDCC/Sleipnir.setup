#!/bin/bash

# 修改源，包含apt, pip, conda
while true; do
    read -r -p "use gdut source or tsinghua source? [G/t] " input
    case $input in
        [tT])
            # apt
            sudo cp cfg/mirrors/tsinghua/apt.cfg /etc/apt/sources.list
            # conda
            cp cfg/mirrors/tsinghua/conda.cfg ~/.condarc
            # pip
            pip install pip -U
            pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
            echo "switch tsinghua source successfully"
            break
            ;;

        [gG] | "")
            sudo cp cfg/mirrors/gdut/apt.cfg /etc/apt/sources.list
            cp cfg/mirrors/gdut/conda.cfg ~/.condarc
            pip config set global.index-url http://mirrors.gdut.edu.cn/pypi/simple
            pip config set install.trusted-host mirrors.gdut.edu.cn
            echo "switch gdut source successfully"
            break            
            ;;

        *)
            echo "Invalid input..."
            ;;
    esac
done

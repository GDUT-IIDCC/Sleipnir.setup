#!/bin/bash

# 修改源，包含apt, pip, conda
while true; do
    read -r -p "use gdut source or tsinghua source? [g/t] " input
    case $input in
        [gG])
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

        [tT])
            sudo cp cfg/mirrors/gdut/apt.cfg /etc/apt/sources.list

            cp cfg/mirrors/gudt/conda.cfg ~/.condarc

            pip config set global.index-url http://mirrors.gdut.edu.cn/pypi/simple
            pip config set install.trusted-host mirrors.gdut.edu.cn
            break
            echo "switch gdut source successfully"
            ;;

        *)
            echo "Invalid input..."
            ;;
    esac
done

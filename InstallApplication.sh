#!/bin/bash

# set -x

InstallChrome() {
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P /tmp
    sudo dpkg -i /tmp/google-chrome-stable_current_amd64.deb
}

InstallVscode() {
    wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
    sudo apt install code
}

InstallJetbrainToolbox() {
    # 容器中无法使用snap安装
    # dial unix /run/snapd.socket: connect: no such file or directory
    # sudo apt install snapd
    # sudo snap install pycharm-professional --classic
    # sudo snap install pycharm-community --classic
    cd /tmp
    wget -c https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.27.2.13801.tar.gz
    tar -zxf jetbrains-toolbox-1.27.2.13801.tar.gz
}

InstallSunlogin() {
    cd /tmp
    wget -c "https://down.oray.com/sunlogin/linux/SunloginClient_11.0.1.44968_amd64.deb"
    sudo dpkg -i SunloginClient_11.0.1.44968_amd64.deb
}
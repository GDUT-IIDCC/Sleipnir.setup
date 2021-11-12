#!/bin/bash
# @ref: https://docs.ros.org/en/foxy/Installation/Ubuntu-Install-Debians.html
# 在实际使用时发现debian那个的教程比ubuntu的更简洁（直接用apt包），而且能在ubuntu上使用
sudo apt update && sudo apt install curl gnupg2 lsb-release
# 此处需要翻墙
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key  -o /usr/share/keyrings/ros-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

sudo apt update
sudo apt install -y ros-foxy-desktop
sudo apt install -y \
    python3-argcomplete \
    python3-rosdep

# ros2 autoware.auto 辅助插件
pip3 install -U colcon-common-extensions vcstool

# 安装ade @ref: https://ade-cli.readthedocs.io/en/latest/install.html#requirements
cd /usr/local/bin
sudo wget https://gitlab.com/ApexAI/ade-cli/uploads/f6c47dc34cffbe90ca197e00098bdd3f/ade+x86_64
sudo mv ade+x86_64 ade
sudo chmod +x ade
sudo ade update-cli




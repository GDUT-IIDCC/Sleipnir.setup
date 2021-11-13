#!/bin/bash
# >>> install from source >>> 
# cd ~ && wget https://github.com/borglab/gtsam/archive/refs/tags/4.0.3.tar.gz -O gtsam.tar.gz
# tar -xzvf gtsam.tar.gz
# cd gtsam-4.0.3 && mkdir build && cd build
# cmake ..
# make -j$(nproc)
# sudo make install
# 删除安装包
# cd ~ && rm -rf gtsam*
# <<< install from source <<<

# from https://gtsam.org/get_started/
# Add PPA
sudo add-apt-repository ppa:borglab/gtsam-release-4.0
sudo apt update  # not necessary since Bionic
# Install:
sudo apt install -y libgtsam-dev libgtsam-unstable-dev
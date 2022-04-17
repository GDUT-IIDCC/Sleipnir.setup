#!/bin/bash
# 安装sophus
sudo apt install -y libfmt-dev
cd ~ && git clone https://github.com/strasdat/Sophus.git
cd Sophus && mkdir build && cd build
cmake ..
make -j$(nproc)
sudo make install
# 删除安装包
# cd ~ && rm -rf Sophus*

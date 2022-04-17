#!/bin/bash
# 安装g2o
sudo apt install -y libsuitesparse-dev qtdeclarative5-dev qt5-qmake libqglviewer-dev-qt5
cd ~ && git clone https://github.com/RainerKuemmerle/g2o.git
cd g2o && mkdir build && cd build
cmake ..
make -j$(nproc)
sudo make install
# 删除安装包
# cd ~ && rm -rf g2o*

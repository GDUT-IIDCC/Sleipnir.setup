#!/bin/bash
# 安装osqp
cd ~ && wget https://github.com/oxfordcontrol/osqp --recursive
cd osqp && mkdir build && cd build
cmake ..
make -j$(nproc)
sudo make install
# 删除安装包
# cd ~ && rm -rf osqp*

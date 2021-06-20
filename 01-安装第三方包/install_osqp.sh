#!/bin/bash

# 安装osqp
cd ~ && git clone --depth=1 --recursive https://github.com/osqp/osqp osqp
cd osqp && mkdir build && cd build
cmake ..
make -j$(nproc)
sudo make install
# 删除安装包
# cd ~ && rm -rf osqp*

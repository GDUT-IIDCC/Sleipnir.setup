#!/bin/bash
  
cd ~ && git clone https://github.com/dorian3d/DBoW2.git --depth=1
cd DBoW2
mkdir build && cd build
cmake ..
make -j$(nproc)
sudo make install

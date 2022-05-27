#!/bin/bash
cd ~ && git clone --recursive https://github.com/stevenlovegrove/Pangolin.git --depth=1 --branch=v0.6
cd Pangolin 
# Install dependencies (as described above, or your preferred method)
./scripts/install_prerequisites.sh
# Configure and build
mkdir build && cd build
cmake ..
cmake --build . -j$(proc)
sudo make instal

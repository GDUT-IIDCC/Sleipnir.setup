# 安装gtsam
cd ~ && wget https://github.com/borglab/gtsam/archive/refs/tags/4.0.3.tar.gz -O gtsam.tar.gz
tar -xzvf gtsam.tar.gz
cd gtsam-4.0.3 && mkdir build && cd build
cmake ..
make -j4
sudo make install
# 删除安装包
# cd ~ && rm -rf gtsam*
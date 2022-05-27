#!/bin/bash

# CMake
sudo apt-get install cmake
# google-glog + gflags
sudo apt-get install -y libgoogle-glog-dev libgflags-dev
# BLAS & LAPACK
sudo apt-get install -y libatlas-base-dev
# Eigen3
sudo apt-get install -y libeigen3-dev
# SuiteSparse and CXSparse (optional)
sudo apt-get install -y libsuitesparse-dev

cd ~ && wget -c http://ceres-solver.org/ceres-solver-2.1.0.tar.gz 
tar zxf ceres-solver-2.1.0.tar.gz
cd ceres-solver-2.1.0
mkdir build
cd build
cmake ..
make -j4

# Optionally install Ceres, it can also be exported using CMake which
# allows Ceres to be used without requiring installation, see the documentation
# for the EXPORT_BUILD_DIR option for more information.
sudo make install

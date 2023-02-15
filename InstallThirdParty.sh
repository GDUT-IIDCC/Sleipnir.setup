#!/bin/bash

# set -x

# >>> algorithm library >>>
InstallCeres() {
    # install requirement
    sudo apt install -y cmake
    sudo apt install -y libgoogle-glog-dev libgflags-dev
    sudo apt install -y libatlas-base-dev
    sudo apt install -y libeigen3-dev
    sudo apt install -y libsuitesparse-dev

    # download source code
    package_path=ceres
    package_path=/tmp/${package_path}
    wget -c "http://ceres-solver.org/ceres-solver-2.1.0.tar.gz" -O ${package_path}.tar.gz
    if [ ! -d ${package_path} ]; then
        mkdir ${package_path}
    fi
    tar -zxf ${package_path}.tar.gz -C ${package_path}
    cd ${package_path}/*

    # compile
    InstallPackege ${package_path}
}

InstallDbow2() {
    # download source code
    package_path=dbow2
    package_path=/tmp/${package_path}
    git clone https://github.com/dorian3d/DBoW2.git --depth=1 ${package_path}
    cd ${package_path}

    # compile
    InstallPackege ${package_path}
}

InstallG20() {
    # install requirement
    sudo apt install -y libsuitesparse-dev qtdeclarative5-dev qt5-qmake libqglviewer-dev-qt5-dev

    # download source code
    package_path=g2o
    package_path=/tmp/${package_path}
    git clone https://github.com/RainerKuemmerle/g2o.git --depth=1 ${package_path}
    cd ${package_path}

    # compile
    InstallPackege ${package_path}
}

InstallGtsam() {
    # add PPA
    sudo add-apt-repository ppa:borglab/gtsam-release-4.0 -y
    sudo apt update  # not necessary since Bionic

    # install
    sudo apt install -y libgtsam-dev libgtsam-unstable-dev
}

InstallOsqp() {

    # download source code
    package_path=osqp
    package_path=/tmp/${package_path}
    git clone https://github.com/oxfordcontrol/osqp --recursive --depth=1 ${package_path}
    cd ${package_path}

    # compile
    InstallPackege ${package_path}
}

InstallSophus() {
    # install requirement
    sudo apt install -y libfmt-dev

    # download source code
    package_path=Sophus
    package_path=/tmp/${package_path}
    git clone https://github.com/strasdat/Sophus.git --depth=1 ${package_path}
    cd ${package_path}

    # compile
    InstallPackege ${package_path}
}

InstallPangolin() {
    # download source code
    package_path=Pangolin
    package_path=/tmp/${package_path}
    git clone https://github.com/stevenlovegrove/Pangolin.git --recursive --depth=1 --branch=v0.6 ${package_path}
    cd ${package_path}
    bash ./scripts/install_prerequisites.sh

    # compile
    InstallPackege ${package_path}
}

InstallPackege() {
    if [ ! -d build ]; then
        mkdir build
    fi

    cd build
    cmake ..
    make -j4
    sudo make install
}

# >>> effective tool >>>
InstallHstr() {
    sudo add-apt-repository ppa:ultradvorka/ppa
    sudo apt update &&
    sudo apt install hstr
    hstr --show-configuration >> ~/.bashrc
    bash . ~/.bashrc
}

InstallV2ray() {
    curl -Ls https://mirrors.v2raya.org/go.sh | sudo bash
    sudo systemctl disable v2ray --now
    wget -qO - https://apt.v2raya.org/key/public-key.asc | sudo tee /etc/apt/trusted.gpg.d/v2raya.asc
    echo "deb https://apt.v2raya.org/ v2raya main" | sudo tee /etc/apt/sources.list.d/v2raya.list
    sudo apt update

    sudo apt install v2raya -y
    sudo systemctl start v2raya.service
    sudo systemctl enable v2raya.service
}
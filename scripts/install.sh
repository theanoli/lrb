#!/bin/bash
export CMAKE_PREFIX_PATH=$1
set -e
echo "path: $CMAKE_PREFIX_PATH"

# # assume current path is under webcachesim
# sudo apt-get update
# sudo apt install -y git cmake build-essential libboost-all-dev python3-pip parallel libprocps-dev software-properties-common
# # install openjdk 1.8. This is for simulating Adaptive-TinyLFU. The steps has to be one by one
# sudo add-apt-repository ppa:openjdk-r/ppa -y
# sudo apt-get update
# sudo apt-get install -y openjdk-8-jdk
# java -version  # output should be 1.8

mkdir -p build

cd ./lib
# install LightGBM
cd ./LightGBM/build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local ..
make
sudo make install
cd ../..
# dependency for mongo c driver
# sudo apt-get install -y cmake libssl-dev libsasl2-dev
# installing mongo c
cd ./mongo-c-driver/cmake-build
cmake -DENABLE_AUTOMATIC_INIT_AND_CLEANUP=OFF -DCMAKE_INSTALL_PREFIX=/usr/local ..
make
sudo make install
cd ../..
# installing mongo-cxx
cd ./mongo-cxx-driver/build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local ..
sudo make EP_mnmlstc_core
make
sudo make install
cd ../..
# installing libbf
cd ./libbf/build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local ..
make
sudo make install
cd ../..
cd ..
# building webcachesim, install the library with api
cd ./build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local ..
make
# sudo ldconfig
cd ../

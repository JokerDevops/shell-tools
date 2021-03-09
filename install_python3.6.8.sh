#!/bin/bash
function getPackage(){
    yum -y install wget 
    wget http://tools.file.irybd.com/Python-3.6.8.tgz
}

function getLib() {
    yum -y install gcc gcc-c++ make
}

function installPython() {
    yum -y install unzip
    tar zxvf Python-3.6.8.tgz
    cd Python-3.6.8 
    ./configure --prefix=/usr/local/Python3.6/ --enable-optimizations --enable-loadable-sqlite-extensions --with-ssl --enable-shared
    make -j `cat /proc/cpuinfo   | grep processor | wc -l`
    make install
}

function main() {
    getPackage
    getLib
    installPython
}

main
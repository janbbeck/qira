#!/bin/bash -e

if [ ! -d qemu/qemu ]; then
  cd qemu
  git clone https://github.com/janbbeck/qemu-qira-4.0.0.git --depth 1 --branch v4.0.0-qira
  cd ..
fi

cd qemu/qemu
./configure --disable-werror --target-list=i386-linux-user,x86_64-linux-user,arm-linux-user,ppc-linux-user,aarch64-linux-user,mips-linux-user,mipsel-linux-user --enable-tcg-interpreter --enable-debug-tcg --enable-capstone --python=python
make -j$(getconf _NPROCESSORS_ONLN) 

#Download base image ubuntu 22.04
FROM ubuntu:22.04

LABEL maintainer="thientc84@gmail.com"
LABEL description="This is custom Docker Image based on Ubuntu 22.04 for testing Futag."

RUN apt update --fix-missing
RUN apt install -y apt-utils
RUN useradd -ms /bin/bash futag
#Установка необходимых библиотек для futag
RUN apt install -y libncurses5 gcc-multilib g++ make gdb binutils python3 git openssh-client cmake wget xz-utils python3-pip texinfo binutils-gold binutils-dev python-is-python3 gcc-10-plugin-dev automake autoconf
 
#USER futag
WORKDIR /home/futag/
RUN pwd
RUN git clone --depth 1 https://github.com/ispras/Futag.git
WORKDIR /home/futag/Futag/custom-llvm
RUN ./prepare.sh 1
WORKDIR /home/futag/Futag/build
RUN ./build.sh
WORKDIR /home/futag/Futag/futag-llvm
RUN ./buildAFLplusplus.sh

USER root
WORKDIR /home/futag/Futag/
RUN pip install futag-llvm/python-package/futag-2.1.0.tar.gz

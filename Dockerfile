FROM intel/oneapi-hpckit:devel-ubuntu22.04
MAINTAINER Tim Niklas Uhl <uhl@kit.edu>
RUN apt update && \
    apt upgrade -y && \
    apt install -y gcc-12 g++-12 && \
    apt remove -y cmake && \
    apt autoremove -y

# Install CMake
RUN wget https://cmake.org/files/v3.26/cmake-3.26.3-linux-x86_64.sh && \
    sh cmake-3.26.3-linux-x86_64.sh --skip-license --prefix=/usr/local

# Install pyenv
RUN apt install -y pip && \
    pip install pipenv

VOLUME /repro-scripts

# Based on Intel's intel/hpckit:devel-ubuntu22.04 container (https://hub.docker.com/r/intel/hpckit),
# but only installs Intel MPI.
#
# Copyright (c) 2020-2021 Intel Corporation.
# SPDX-License-Identifier: BSD-3-Clause

FROM ubuntu:22.04
MAINTAINER Tim Niklas Uhl <uhl@kit.edu>
RUN apt-get update && apt-get upgrade -y && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    curl ca-certificates gpg-agent software-properties-common && \
  rm -rf /var/lib/apt/lists/*
# repository to install Intel(R) oneAPI Libraries
RUN curl -fsSL https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS-2023.PUB | gpg --dearmor | tee /usr/share/keyrings/intel-oneapi-archive-keyring.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/intel-oneapi-archive-keyring.gpg] https://apt.repos.intel.com/oneapi all main " > /etc/apt/sources.list.d/oneAPI.list

RUN apt-get update && apt-get upgrade -y && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    curl ca-certificates gpg-agent software-properties-common && \
  rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get upgrade -y && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    ca-certificates build-essential pkg-config gnupg libarchive13 openssh-server openssh-client wget net-tools \
    git \
    libsparsehash-dev \
    intel-oneapi-mpi intel-oneapi-mpi-devel intel-oneapi-tbb-devel && \
  rm -rf /var/lib/apt/lists/*

ENV LANG=C.UTF-8
ENV VERSION=latest
ENV CLASSPATH="/opt/intel/oneapi/mpi/${VERSION}/share/java/mpi.jar"
ENV CMAKE_PREFIX_PATH="/opt/intel/oneapi/tbb/${VERSION}"
ENV CPATH="/opt/intel/oneapi/mpi/${VERSION}/include"
ENV CPATH="/opt/intel/oneapi/tbb/${VERSION}/include:${CPATH}"
ENV FI_PROVIDER_PATH="/opt/intel/oneapi/mpi/${VERSION}/opt/mpi/libfabric/lib/prov:/usr/lib/x86_64-linux-gnu/libfabric"
ENV I_MPI_ROOT="/opt/intel/oneapi/mpi/${VERSION}"
ENV LD_LIBRARY_PATH="/opt/intel/oneapi/mpi/${VERSION}/opt/mpi/libfabric/lib:/opt/intel/oneapi/mpi/2021.12/lib:${LD_LIBRARY_PATH}"
ENV LD_LIBRARY_PATH="/opt/intel/oneapi/tbb/${VERSION}/lib${LD_LIBRARY_PATH}"
ENV LIBRARY_PATH="/opt/intel/oneapi/mpi/${VERSION}/lib:${LIBRARY_PATH}"
ENV LIBRARY_PATH="/opt/intel/oneapi/tbb/${VERSION}/lib:${LIBRARY_PATH}"
ENV MANPATH="/opt/intel/oneapi/mpi/${VERSION}/share/man:${MANPATH}"
ENV ONEAPI_ROOT="/opt/intel/oneapi"
ENV PATH="/opt/intel/oneapi/mpi/${VERSION}/bin:${PATH}"
ENV PKG_CONFIG_PATH="/opt/intel/oneapi/mpi/${VERSION}/lib/pkgconfig:${PKG_CONFIG_PATH}"
ENV PKG_CONFIG_PATH="/opt/intel/oneapi/tbb/${VERSION}/lib/pkgconfig:${PKG_CONFIG_PATH}"
ENV TBBROOT="/opt/intel/oneapi/tbb/${VERSION}"
ENV SETVARS_COMPLETED='1'

# KaMPIng specific dependencies

RUN apt update -y && apt upgrade -y && \
    apt install -y gcc-12 g++-12

# Install CMake
RUN wget https://cmake.org/files/v3.26/cmake-3.26.3-linux-x86_64.sh && \
    sh cmake-3.26.3-linux-x86_64.sh --skip-license --prefix=/usr/local

# Install pyenv
RUN apt update -y && apt upgrade -y && \
    apt install -y pip && \
    pip install pipenv

# Install eval deps
RUN apt update -y && apt upgrade -y && \
    apt install -y cloc gawk

# create a user `kamping`
ARG USERNAME=kamping
ARG USER_ID=1000
ARG USER_GID=$USER_ID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_ID --gid $USER_ID -m $USERNAME \
    && apt update \
    && apt install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

USER $USERNAME
WORKDIR /home/$USERNAME

VOLUME /repro-scripts

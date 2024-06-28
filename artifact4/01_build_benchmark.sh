#!/usr/bin/env sh

cmake -S kamping-label-propagation \
    -B kamping-label-propagation/build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_COMPILER=g++-12 \
    -DCMAKE_C_COMPILER=gcc-12

cmake --build kamping-label-propagation/build --parallel

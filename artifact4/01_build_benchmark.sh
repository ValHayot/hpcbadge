#!/usr/bin/env sh

cmake -S kamping-label-propagation -B kamping-label-propagation/build -DCMAKE_BUILD_TYPE=Release
cmake --build kamping-label-propagation/build --parallel

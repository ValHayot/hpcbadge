#!/usr/bin/env sh

git clone --branch master --recursive https://github.com/kamping-site/kamping-label-propagation

cmake -S kamping-label-propagation -B kamping-label-propagation/build -DCMAKE_BUILD_TYPE=Release

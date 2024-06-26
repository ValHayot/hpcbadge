#!/usr/bin/env sh

cmake -S kamping -B kamping/build \
    -DCMAKE_BUILD_TYPE=Debug     \
    -DCMAKE_CXX_COMPILER=g++-12  \
    -DKAMPING_TEST_ENABLE_SANITIZERS=OFF #address sanitizers sometimes cause issues in combination with googletest and dynamic loading

cmake --build kamping/build --parallel

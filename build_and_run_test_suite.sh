#!/usr/bin/env sh

echo "[INFO] Cloning repo:"
git clone --branch v0.1.0 --recursive https://github.com/kamping-site/kamping

cd kamping

echo "[INFO] MPI version:"
mpiexec --version


echo "[INFO] Compiler version:"
gcc-12 --version

echo "[INFO] building tests:"
cmake -B build \
    -DCMAKE_BUILD_TYPE=Debug \
    -DCMAKE_CXX_COMPILER=g++-12 \
    -DKAMPING_TEST_ENABLE_SANITIZERS=OFF #address sanitizers sometimes cause issues in combination with googletest and dynamic loading

cmake --build build --parallel

echo "[INFO] executing test suite:"
ctest --test-dir build

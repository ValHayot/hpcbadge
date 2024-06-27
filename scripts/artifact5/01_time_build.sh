#!/usr/bin/env bash

cd raxml-ng
cmake -B build -DUSE_MPI=ON     \
    -DCMAKE_CXX_COMPILER=g++-12 \
    -DCMAKE_C_COMPILER=gcc-12

cd ..

cd kamping-raxml-ng
cmake -B build -DUSE_MPI=ON     \
    -DCMAKE_CXX_COMPILER=g++-12 \
    -DCMAKE_C_COMPILER=gcc-12

cd ..

out=compilation_times.txt
echo "*Compilation times:" > $out
echo "**reference:" >> $out

for run in {1..3}; do
    echo "***run $run:" >> $out
    { time cmake --build raxml-ng/build --clean-first 2>&1;} 2>> $out;
done

echo "**kamping:" >> $out
for run in {1..3}; do
    echo "***run $run:" >> $out
    { time cmake --build kamping-raxml-ng/build --clean-first 2>&1;} 2>> $out;
done

cat $out

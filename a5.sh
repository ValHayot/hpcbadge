#!/usr/bin/env bash

git clone --branch reference \
    --recursive https://github.com/kamping-site/kamping-raxml-ng raxml-ng
cd raxml-ng
cmake -B build -DUSE_MPI=ON -DCMAKE_BUILD_TYPE=Release

cd ..

git clone --branch kamping-integration \
    --recursive https://github.com/kamping-site/kamping-raxml-ng

cd kamping-raxml-ng
cmake -B build -DUSE_MPI=ON -DCMAKE_BUILD_TYPE=Release

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

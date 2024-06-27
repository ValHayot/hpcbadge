#!/usr/bin/env bash

cd raxml-ng
cmake -B build -DUSE_MPI=ON

cd ..

cd kamping-raxml-ng
cmake -B build -DUSE_MPI=ON

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

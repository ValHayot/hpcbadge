#!/usr/bin/env sh

count_file() {
    cat kamping-label-propagation/$1 | \
        cloc --json --stdin-name=$1 - | \
        jq '.["C++"].code'
}

echo "LOC for the plain MPI implementation:\t"
count_file "mpi_label_propagation.cc"
echo "LOC for the KaMPIng implementation:\t"
count_file "kamping_label_propagation.cc"
echo "LOC for the dKaMinPar implementation:\t"
count_file "kaminpar_label_propagation.cc"

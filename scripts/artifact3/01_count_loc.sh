#!/usr/bin/env sh

cd kamping-pDCX

echo "\e[34m**Results for Prefix Doubling**\e[0m"
cd prefix_doubling_comparison/
echo "\e[32m->Lines of Code: PD KaMPIng Implementation\e[0m"
cloc kamping_prefix_doubling.hpp
echo "\e[32m->Lines of Code: PD Plain MPI Implementation\e[0m"
cloc mpi_prefix_doubling.hpp
echo "\e[32m->Lines of Code: Plain MPI Implementation MPI Wrapper\e[0m"
cloc dsss_mpi
echo "\e[32m->Lines of Code: PD Thrill Implementation\e[0m"
cloc thrill_prefix_doubling.cpp
cd ..

echo "\e[34m**Results for DCX**\e[0m"
cd src/
echo "\e[32m->Lines of Code: DCX KaMPIng Implementation\e[0m"
cloc kamping_dc.cpp
echo "\e[32m->Lines of Code: Plain MPI Implementation\e[0m"
cloc mpi_dc.cpp
cd ..

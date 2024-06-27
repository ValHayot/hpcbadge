#!/usr/bin/env sh

echo "Binary sizes:"
echo "RAxML-NG:"
du -h raxml-ng/bin/raxml-ng-mpi

echo "RAxML-NG + KaMPIng:"
du -h kamping-raxml-ng/bin/raxml-ng-mpi

#!/usr/bin/env sh

echo "[INFO] Cloning repo:"
git clone --branch development --recursive https://github.com/kamping-site/kamping-examples

cd kamping-examples

cmake -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_COMPILER=g++-12 \

cmake --build build --parallel

pipenv install pyyaml

pipenv run python ./kaval/run-experiments.py sorting                                  \
              --search-dirs $(pwd)/experiment_suite \
              --machine             generic-job-file                                  \
              --sbatch-template     ./kaval/sbatch-templates/generic_job_files.txt    \
              --command-template    ./kaval/command-templates/command_template_generic.txt

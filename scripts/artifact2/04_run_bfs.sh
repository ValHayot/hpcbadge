#!/usr/bin/env sh

export PIPENV_PIPFILE=$(pwd)/kamping-examples/kaval/Pipfile

mkdir -p experiment_out

cd kamping-examples
pipenv install

pipenv run ./kaval/run-experiments.py bfs \
    --search-dirs experiment_suites \
    --machine shared \
    --max-cores $(nproc) \
    --output-dir ../experiment_out/bfs/output \
    --experiment-data-dir ../experiment_out/

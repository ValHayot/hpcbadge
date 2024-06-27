#!/usr/bin/env sh

export PIPENV_PIPFILE=$(pwd)/kamping-label-propagation/kaval/Pipfile

cd kamping-label-propagation
pipenv install

pipenv run ./kaval/run-experiments.py \
    --machine shared \
    --max-cores $(nproc) \
    --omit-json-output-path \
    --output-dir ../experiment_out/ \
    --experiment-data-dir ../experiment_out/ \
    label_propagation

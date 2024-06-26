#!/usr/bin/env sh

export PIPENV_PIPFILE=$(pwd)/kamping-examples/evaluation/Pipfile

pipenv install
pipenv run python kamping-examples/evaluation/make_bfs_csv.py \
    --path experiment_out \
    --experiments bfs > bfs.csv
echo "Data written to bfs.csv"

pipenv run python kamping-examples/evaluation/make_bfs_plot.py \
    --output-name bfs \
    bfs.csv
echo "Plot written to bfs.pdf"

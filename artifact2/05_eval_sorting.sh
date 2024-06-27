#!/usr/bin/env sh

export PIPENV_PIPFILE=$(pwd)/kamping-examples/evaluation/Pipfile

pipenv install
pipenv run python kamping-examples/evaluation/make_sorting_csv.py \
    --path experiment_out \
    --experiments sorting > sorting.csv
echo "Data written to sorting.csv"

pipenv run python kamping-examples/evaluation/make_sorting_plot.py \
    --output_name sorting \
    --cores-per-node 1 \
    sorting.csv
echo "Plot written to sorting.pdf"

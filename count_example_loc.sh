#!/usr/bin/env sh

echo "[INFO] Cloning repo:"
git clone --branch v0.1.0 --recursive https://github.com/kamping-site/kamping-examples

cd kamping-examples/evaluation

echo "[INFO] installing dependencies for python script"
pipenv install

echo "[INFO] Counting LOC"
pipenv run python count_lines.py --path ../include/bfs/bindings/     \
    ../include/sorting/bindings/ \
    ../include/vector_allgather/

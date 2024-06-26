#!/usr/bin/env sh

cd kamping/evaluation
pipenv install

pipenv run python count_lines.py --path ../include/bfs/bindings/     \
    ../include/sorting/bindings/ \
    ../include/vector_allgather/

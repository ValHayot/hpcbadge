#!/usr/bin/env sh

cd kamping-examples

cmake --preset experiments
cmake --build --preset experiments --parallel

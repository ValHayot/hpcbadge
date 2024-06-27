#!/usr/bin/env sh

git clone --branch reference \
    --recursive https://github.com/kamping-site/kamping-raxml-ng raxml-ng

git clone --branch kamping-integration \
    --recursive https://github.com/kamping-site/kamping-raxml-ng

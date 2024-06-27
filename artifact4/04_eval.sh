#!/usr/bin/env sh

./kamping-label-propagation/logs2results.sh experiment_out

echo "Results written to {PlainMPi, KaMPIngWrapper dKaMinParWrapper}.csv"

./kamping-label-propagation/eval.R

#!/usr/bin/env sh


TOOLS=./build/tools

$TOOLS/caffe train  --solver=examples/largeLR/solver.prototxt  \
    --gpu=all 2>&1 | tee examples/largeLR/results/norm

grep 'Test net output #0:' examples/largeLR/results/norm  > examples/largeLR/results/plt/norm.test.acc.plt
grep 'Test net output #1:' examples/largeLR/results/norm  > examples/largeLR/results/plt/norm.test.loss.plt
grep 'Train net output #0:' examples/largeLR/results/norm  > examples/largeLR/results/plt/norm.train.acc.plt
grep 'Train net output #1:' examples/largeLR/results/norm  > examples/largeLR/results/plt/norm.train.loss.plt

exit

#! /bin/bash

scripts=$(dirname "$0")
base=$(realpath $scripts/..)

models=$base/models
data=$base/data
tools=$base/tools
samples=$base/samples

mkdir -p $samples

num_threads=4
device=""
# I changed the directory from $data/grim to $data/arabian
# Words: generate 1000 words is good to inspect the quality of sample
# Model: I use the model (dropout rate 0.4) that obtains the lowest test perplexity
(cd $tools/pytorch-examples/word_language_model &&
    CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python generate.py \
        --data $data/arabian \
        --words 1000 \
        --checkpoint $models/model_0.2.pt \
        --outf $samples/sample
)

#! /bin/bash

scripts=$(dirname "$0")
base=$scripts/..

data=$base/data

mkdir -p $data

tools=$base/tools

# Download the new custom dataset - Arabian Nights
mkdir -p $data/arabian
mkdir -p $data/arabian/raw

# The link of the new custom dataset
wget https://www.gutenberg.org/cache/epub/8655/pg8655.txt -O $data/arabian/raw/nights.txt

# preprocess slightly
cat $data/arabian/raw/nights.txt | python $base/scripts/preprocess_raw.py > $data/arabian/raw/nights.cleaned.txt

# tokenize, fix vocabulary upper bound
cat $data/arabian/raw/nights.cleaned.txt | python $base/scripts/preprocess.py --vocab-size 6000 --tokenize --lang "en" --sent-tokenize > \
    $data/arabian/raw/nights.preprocessed.txt

# split into train, valid and test
# Custom split numbers, adjusted according to proportion of the given example split numbers
head -n 647 $data/arabian/raw/nights.preprocessed.txt | tail -n 591 > $data/arabian/valid.txt
head -n 1254 $data/arabian/raw/nights.preprocessed.txt | tail -n 607 > $data/arabian/test.txt
tail -n 4687 $data/arabian/raw/nights.preprocessed.txt | head -n 4406 > $data/arabian/train.txt


#! /bin/bash

scripts=$(dirname "$0")
base=$scripts/..

tools=$base/tools
mkdir -p $tools

echo "Make sure this script is executed AFTER you have activated a virtualenv"

pip install numpy torch sacremoses nltk

# install Moses scripts for preprocessing

git clone https://github.com/bricksdont/moses-scripts $tools/moses-scripts

# You do not need to install pytorch examples cause the modified world language model was already pushed and ready to use


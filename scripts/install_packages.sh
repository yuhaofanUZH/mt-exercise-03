#! /bin/bash

scripts=$(dirname "$0")
base=$scripts/..

tools=$base/tools
mkdir -p $tools

echo "Make sure this script is executed AFTER you have activated a virtualenv"

# add package pandas and matplotlib for logging and plotting model perplexity

pip install numpy torch sacremoses nltk pandas matplotlib

# install Moses scripts for preprocessing

git clone https://github.com/bricksdont/moses-scripts $tools/moses-scripts

# You do not need to install pytorch examples cause the modified world language model was already pushed and ready to use


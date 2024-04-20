# MT Exercise 3: Pytorch RNN Language Models

This repo shows how to train neural language models using [Pytorch example code](https://github.com/pytorch/examples/tree/master/word_language_model). Thanks to Emma van den Bold, the original author of these scripts. 

# Requirements

- This only works on a Unix-like system, with bash.
- Python 3 must be installed on your system, i.e. the command `python3` must be available
- Make sure virtualenv is installed on your system. To install, e.g.

    `pip install virtualenv`

# Steps

Clone this repository in the desired place:

    git clone https://github.com/yuhaofanUZH/mt-exercise-03.git
    cd mt-exercise-03

Create a new virtualenv that uses Python 3. Please make sure to run this command outside of any virtual Python environment:

    ./scripts/make_virtualenv.sh

**Important**: Then activate the env by executing the `source` command that is output by the shell script above.

Download and install required software:

    ./scripts/install_packages.sh

Download and preprocess data: (You do not need to clone PyTorch examples cause the modified world language model folder was already pushed and ready to use)

    ./scripts/download_data.sh

Train 5 models with different dropout rates and then log and plot to compare model efficiency:

    ./scripts/train_log_plot.sh

The training process can be interrupted at any time, and the best checkpoint will always be saved.

Generate (sample) some text from the trained model with dropout rate 0.4 (which usually has the lowest test perplexity):

    ./scripts/generate.sh



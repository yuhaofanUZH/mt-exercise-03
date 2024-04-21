# MT Exercise 3: Pytorch RNN Language Models

This repo shows how to train neural language models using [Pytorch example code](https://github.com/pytorch/examples/tree/master/word_language_model). Thanks to Emma van den Bold, the original author of these scripts. 

# Requirements

- This only works on a Unix-like system, with bash.
- Python 3 must be installed on your system, i.e. the command `python3` must be available
- Make sure virtualenv is installed on your system. To install, e.g.

    `pip install virtualenv`
    
# File Changes

- **download_data.sh**
  - Changed to download the new custom dataset - Arabian Nights.
  - Adjusted split numbers according to the proportion of the given example split numbers.

- **generate.sh**
  - Modified the directory settings and generating parameters.

- **install_packages.sh**
  - Added pandas for logging model perplexity.
  - Removed the code to clone Pytorch examples.

- **train.sh** (renamed to train_log_plot.sh)
  - Renamed to better reflect its new functionality, which now includes creating log files and plot files after running.

- **word_language_model**
  - Pushed the modified directory so there is no need to clone Pytorch examples.
  - **main.py**
    - Added a function for logging perplexity.
  - **plot.py**
    - Added to plot the CSV result for visual comparison.

- **General Note**
  - You can find more specific changes in the respective script files, where new comments have been added.


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

(Note: there will be a FutureWarning, just ignore this)

Train five models with varying dropout rates, then log results and generate plots to compare model efficiency:

    ./scripts/train_log_plot.sh
    
(Note: Logs and plots will be stored in the log_plot_file directory)

The training process can be interrupted at any time, and the best checkpoint will always be saved.

Generate (sample) some text from the trained model with dropout rate 0.4 (which usually has the lowest test perplexity):

    ./scripts/generate.sh



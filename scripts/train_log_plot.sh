#! /bin/bash

scripts=$(dirname "$0")
base=$(realpath $scripts/..)

models=$base/models
data=$base/data
tools=$base/tools
log_plot_file=$base/log_plot_file
word_language_model=$base/word_language_model

mkdir -p $models
mkdir -p $log_plot_file

num_threads=4
device=""

# Define a single CSV file to log perplexity for all dropout models
log_file="$log_plot_file/perplexity_log.csv"

# Clear the existing log file or create a new one at the beginning
echo "Resetting log file..."
> "$log_file" 

# Define the output file for the plot
plot_output="$log_plot_file/perplexity_plot.png"

# Dropout settings
dropouts=(0.0 0.2 0.4 0.6 0.8)

SECONDS=0

# from $data/grim to $data/arabian
# Train models with different dropout settings
for dropout in "${dropouts[@]}"
do
    echo "Training model with dropout $dropout"
    (cd $word_language_model &&
        CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python main.py --data $data/arabian \
            --epochs 30 \
            --log-interval 100 \
            --emsize 200 --nhid 200 --dropout $dropout --tied \
            --save $models/model_${dropout}.pt \
            --log-perplexity-file $log_file 
    )
    echo "Model with dropout $dropout trained."
    echo "Time taken for dropout $dropout:"
    echo "$SECONDS seconds"
    SECONDS=0
done

# Run the plot.py script to generate a plot from the log file
echo "Generating plot..."
python $word_language_model/plot.py --input_file $log_file --output_file $plot_output
echo "Plot has been saved at $plot_output"
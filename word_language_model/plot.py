import pandas as pd
import matplotlib.pyplot as plt
import argparse

parser = argparse.ArgumentParser(description="Plot Validation Perplexity from CSV Log")
parser.add_argument('--input_file', type=str, help='Path to the input CSV file containing logging data')
parser.add_argument('--output_file', type=str, help='Path to the output file where the plot will be saved')
args = parser.parse_args()

def plot_perplexity(input_file, output_file):
    # Load the data from CSV
    df = pd.read_csv(input_file)
    plt.figure(figsize=(10, 5))

    for column in df.columns[1:]:
        if "Dropout" in column:
            plt.plot(df['Valid. perplexity'].str.replace('Epoch ', '').astype(int), df[column], label=column)

    # Setting the title and labels
    plt.title('Model Perplexity over Epochs')
    plt.xlabel('Epoch')
    plt.ylabel('Validation Perplexity')
    plt.legend(title="Dropout Rates")
    plt.grid(True)

    plt.savefig(output_file)
    plt.show()
    plt.close()

def main():
    plot_perplexity(args.input_file, args.output_file)

if __name__ == "__main__":
    main()



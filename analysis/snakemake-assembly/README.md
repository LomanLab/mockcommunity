# Snakemake Assembly Pipeline

## How to drive this thing

#### Setup the environment

```
conda env create --name mockcomm-assemble --file environment.yaml
conda activate mockcomm-assemble
```

#### Point the Snakefile to the right data directories

Edit `Snakefile` to specify the ONT `FASTQ_ROOT` and Illumina `ILLUMINA_ROOT`.
This *should* be all you need, as there are rules to install tricky tools and download our `kraken2` database (30GB), but let @samstudio8 know otherwise....

```
FASTQ_ROOT = "/path/to/downloaded/ontfastq/"
ILLUMINA_ROOT = "/path/to/downloaded/illfastq/"
```

#### Engage the pipeline

Run the pipeline with `snakemake`, you **must** specify `--use-conda` to ensure that `checkM` runs in a special Python2 jail, far away from everything else.

```
snakemake -j <available_threads> --reason --use-conda
```

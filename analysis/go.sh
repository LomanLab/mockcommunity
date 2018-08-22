#!/bin/bash

run=$1
position=$2
metadata=$3

#map to zymoref
minimap2 -a -x map-ont -t 12 refs/zymoref.fasta <(cat ../data/$run/$position/*.fastq) | samtools view -bS - -o $run.bam
#generate mapping stats
samtools view -h $run.bam | python scripts/bamstats.py - > $run.stats.txt
#summary
Rscript scripts/summariseStats.R $run.stats.txt $metadata $run


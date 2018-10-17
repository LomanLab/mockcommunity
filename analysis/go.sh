#!/bin/bash

run=$1
position=$2
metadata=$3

#map to zymoref
#minimap2 -a -x map-ont -t 12 refs/zymoref.fasta <(cat ../data/$run/$position/*.fastq) | samtools view -bS - -o $run.bam
#generate mapping stats
samtools view -h results/$run.bam | python scripts/bamstats.py - > results/$run.stats.txt
#summary
Rscript scripts/summariseStats.R results/$run.stats.txt $metadata $run


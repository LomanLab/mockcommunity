#!/bin/bash -x

fastq=$1
run=$2
metadata=$3

#map to zymoref

minimap2 -a -x map-ont -t 12 assemblies/illumina/spades/Zymo-Isolates-SPAdes-Illumina.fasta.gz $fastq | samtools view -bS - | samtools sort -@12 -m20G - -o results/$run.sorted.bam 
samtools index results/$run.sorted.bam
#generate mapping stats
samtools view -h results/$run.sorted.bam | python scripts/bamstats.py - > results/$run.stats.txt
#summary
#Rscript scripts/summariseStats.R results/$run.stats.txt $metadata results/$run


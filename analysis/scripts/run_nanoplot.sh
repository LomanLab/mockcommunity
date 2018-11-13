#!/bin/bash
datadir=$1
prefix=$2

if [ $3 ]; then
  python scripts/get_read_times.py $datadir/*.fastq $3/*.fastq > $prefix.readstarts.txt
  python scripts/rewrite_summary_from_fastq.py $prefix.readstarts.txt $datadir/seq* $3/seq* > $prefix.summary_stats.txt
  #cat $datadir/seq* $3/seq* > $prefix.summary_stats.txt
  echo "hi"
else
  python scripts/get_read_times.py $datadir/*.fastq > $prefix.readstarts.txt
  python scripts/rewrite_summary_from_fastq.py $prefix.readstarts.txt $datadir/seq* > $prefix.summary_stats.txt
  #cat $datadir/seq* > $prefix.summary_stats.txt
fi
#cat $datadir/seq* > $prefix.summary_stats.txt
#NanoPlot --summary $prefix.summary_stats.txt -o $prefix -t 12
#NanoPlot --summary $prefix.summary_stats.txt --maxlength 30000 --N50 --raw -t 12 -p $prefix -o "$prefix"_nanoplot_30k
NanoPlot --summary $prefix.summary_stats.txt --N50 --raw -t 12 -p "$prefix"_ -o "$prefix"_nanoplot
#NanoPlot --summary $datadir/seq* --maxlength 30000 --N50 --raw -t 12 -p $prefix -o "$prefix"_nanoplot
cp NanoPlot-data.tsv.gz "$prefix"-NanoPlot-data-summary.tsv.gz

#if [ $3 ]; then
#  NanoPlot --fastq_rich $datadir/*.fastq $3/*.fastq --maxlength 30000 --N50 --raw -t 12 -p $prefix -o "$prefix"_nanoplot_fastq
#else
#  NanoPlot --fastq_rich $datadir/*.fastq --maxlength 30000 --N50 --raw -t 12 -p $prefix -o "$prefix"_nanoplot_fastq
#fi
#cp NanoPlot-data.tsv.gz "$prefix"-NanoPlot-data.tsv.gz

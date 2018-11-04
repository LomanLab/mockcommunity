#./align_and_stats.sh ../fastq/Zymo-GridION-LOG-BB-SN.fq.gz Zymo-GridION-LOG-BB-SN staggered
#./align_and_stats.sh ../fastq/Zymo-GridION-EVEN-BB-SN.fq.gz Zymo-GridION-EVEN-BB-SN even
#./align_and_stats.sh ../fastq/Zymo-PromethION-LOG-BB-SN.fq.gz Zymo-PromethION-LOG-BB-SN staggered
#./align_and_stats.sh ../fastq/Zymo-PromethION-EVEN-BB-SN.fq.gz Zymo-PromethION-EVEN-BB-SN even
#./kraken.sh ../fastq/Zymo-GridION-LOG-BB-SN.fq.gz Zymo-GridION-LOG-BB-SN staggered
#./kraken.sh ../fastq/Zymo-GridION-EVEN-BB-SN.fq.gz Zymo-GridION-EVEN-BB-SN even
#./kraken.sh ../fastq/Zymo-PromethION-LOG-BB-SN.fq.gz Zymo-PromethION-LOG-BB-SN staggered
#./kraken.sh ../fastq/Zymo-PromethION-EVEN-BB-SN.fq.gz Zymo-PromethION-EVEN-BB-SN even
python scripts/binreads.py results/Zymo-PromethION-EVEN-BB-SN.sorted.bam Zymo-PromethION-EVEN-BB-SN
python scripts/binreads.py results/Zymo-PromethION-LOG-BB-SN.sorted.bam Zymo-PromethION-LOG-BB-SN
python scripts/binreads.py results/Zymo-GridION-EVEN-BB-SN.sorted.bam Zymo-GridION-EVEN-BB-SN
python scripts/binreads.py results/Zymo-GridION-LOG-BB-SN.sorted.bam Zymo-GridION-LOG-BB-SN


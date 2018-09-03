# Nanopore GridION and PromethION Mock Microbial Community Data

## Description of data

### Zymo Community Standards 2 (Even)

  - 10 species, all with equal genomic DNA input
  - Useful for evaluating nanopore assembly and taxonomic assignments
  - GRIDION
     - Bead-beating (~10Gb) (GRIDION-EVEN-BB)
     - Metapolyzyme (~10Gb) (GRIDION-EVEN-MPZ)
     - Hybrid BB + MPZ (~17Gb) (GRIDION-EVEN-MPZ-BB)

### Zymo Community Standards 2 (Log/Staggered)
 
   - 10 species from 10^2 - 10^7 genomic DNA abundance
   - Useful for evaluating limit of detection at high coverage
   - PromethION
      - Bead-beating (~130Gb) (PION-LOG-BB)

## Data availability

   - **GRIDION-EVEN-BB**
      - <a href="https://nanopore.s3.climb.ac.uk/GridION-Zymo_CS_LSK109.tar">Basecalls</a> (21.9Gb)
      - <a href="https://nanopore.s3.climb.ac.uk/GridION-Zymo_CS_LSK109_signal.tar">Basecalls+signal</a> (252.7Gb)
      - <a href="https://nanopore.s3.climb.ac.uk/GridION-Zymo_CS_BB_LSK109.fq.gz">Merged FASTQ</a> (9.5 Gb, `e1e183c5bee9fedb0357d51d4dc4ed74`)
   - **GRIDION-EVEN-MPZ**
      - <a href="https://nanopore.s3.climb.ac.uk/GridION-Zymo_CS_MPZ_LSK109">Basecalls</a> (23.2Gb)
      - <a href="https://nanopore.s3.climb.ac.uk/GridION-Zymo_CS_MPZ_LSK109_signal.tar">Basecalls+signal</a> (283Gb)
      - <a href="https://nanopore.s3.climb.ac.uk/GridION-Zymo_CS_MPZ_LSK109.all.fq.gz">Merged FASTQ</a> (9.8 Gb, `f18e3b3323b0ba15fdb783618ea18ea1`)
   - **GRIDION-EVEN-MPZ-BB**
      - <a href="https://nanopore.s3.climb.ac.uk/GridION-Zymo_CS_MPZBB_LSK109.tar">Basecalls</a> (35.8Gb)
      - <a href="https://nanopore.s3.climb.ac.uk/GridION-Zymo_CS_MPZBB_LSK109_signal.tar">Basecalls+signal</a> (396.9Gb)
      - <a href="https://nanopore.s3.climb.ac.uk/GridION-Zymo_CS_MPZBB_LSK109.all.fq.gz">Merged FASTQ</a> (16 Gb, `88d159842bfc3b70ee1f1bf15c2aa7b9`)
   - **GRIDION-EVEN-BB+MPZ+MPZ-BB (ALL3)**
      - <a href="https://nanopore.s3.climb.ac.uk/GridION-Zymo_CS_ALL3_LSK109.all.fq.gz">Merged FASTQ</a> (35 Gb, `e80c9ac91bf343352d6bcf57815dfc61`)
   - **PION-LOG-BB**
      - <a href="https://nanopore.s3.climb.ac.uk/PromethION-Zymo_CSII_LSK109.tar.gz">Basecalls</a> (128.2Gb), Basecalls+signal (2.7Tb)

## Basic run stats

### PION-LOG-BB (PromethION)

```General summary:
Active channels:        2746
Mean read length:       3699.9
Mean read quality:      8.9
Median read length:     3342.0
Median read quality:    9.4
Number of reads:        35556299
Read length N50:        5071
Total bases:    131556241641
Number, percentage and megabases of reads above quality cutoffs
>Q5:    33095038 (93.1%) 13026.4Mb
>Q7:    29654587 (83.4%) 12130.3Mb
>Q10:   12428259 (35.0%) 5346.4Mb
>Q12:   43721 (0.1%) 13.3Mb
>Q15:   24 (0.0%) 0.0Mb
```

![PION-LOG-Yield](analysis/nanostat/Zymo_CSII_LSK109/Zymo_CSII_LSK109CumulativeYieldPlot_Gigabases.png)

![PION-LOG-ReadlengthLog](analysis/nanostat/Zymo_CSII_LSK109/Zymo_CSII_LSK109Weighted_LogTransformed_HistogramReadlength.png)

### GRIDION-EVEN-BB (Zymo\_CS\_LSK109)



### GRIDION-EVEN-MPZ (GridION-Zymo\_CS\_MPZ\_LSK109)

### GRIDION-EVEN-MPZ-BB (Zymo\_CS\_MPZBB\_LSK109)




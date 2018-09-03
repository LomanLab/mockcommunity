# Nanopore GridION and PromethION Mock Microbial Community Data

## Description of data

### Zymo Community Standards 2 (Even)

  - 10 species, all with equal genomic DNA input
  - Useful for evaluating nanopore assembly and taxonomic assignments
  - MinION
     - Bead-beating (~10Gb) (BB-EVEN)
     - Metapolyzyme (~10Gb) (MPZ-EVEN)
     - Hybrid BB + MPZ (~17Gb) (MPZ-BB-EVEN)

### Zymo Community Standards 2 (Log/Staggered)
 
   - 10 species from 10^2 - 10^7 genomic DNA abundance
   - Useful for evaluating limit of detection at high coverage
   - PromethION
      - Bead-beating (~130Gb) (PION-BB-LOG)

## Data availability


## Basic run stats

### PION-BB-LOG (PromethION)

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

![PION-BB-LOG](analysis/nanostat/Zymo_CSII_LSK109/Zymo_CSII_LSK109CumulativeYieldPlot_Gigabases.png)

![PION-BB-LOG](analysis/nanostat/Zymo_CSII_LSK109/Zymo_CSII_LSK109Weighted_LogTransformed_HistogramReadlength.png)



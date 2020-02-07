---
layout: default
title: News
---

## R10.3 and 'R10M' Data Release (2020-02-07)

As part of our ongoing benchmarking, we are releasing R10.3 pore data for even Zymo Community Standard (Even), generated on the Oxford Nanopore GridION. In line with previous releases, this data is from the even community standard. Extraction and sequencing was performed by Jo Stockton, using [Josh Quick's "Three Peaks" protocol](https://www.protocols.io/view/the-39-three-peaks-39-faecal-dna-extraction-method-7rshm6e). We merged two R10.3 runs to generate 4.6 Gbp total. Reads were assembled with [`Flye`](https://github.com/fenderglass/Flye), then polished on-GPU with [`Racon`](https://github.com/lbcb-sci/racon) and [`Medaka`](https://github.com/nanoporetech/medaka/), using our [`reticulatus` pipeline](https://github.com/SamStudio8/reticulatus). We acheived Q50 on two bacterial genomes.

Additionally, we release data generated on the prototype R10 pore, basecalled with the methylation-aware guppy model ("R10M").

[Download R10.3 Zymo-EVEN FASTQ](https://nanopore.s3.climb.ac.uk/mock/Zymo-GridION-EVEN-3Peaks-R103-merged.fq.gz) (4.8 GB, `78497b92a6b8fde2e0f5d2291c707949`).  
[Download R10M Zymo-EVEN FASTQ](https://nanopore.s3.climb.ac.uk/mock/Zymo-GridION-Even-3Peaks-Native-R10_hac_meth.fq.gz) (32 GB, `eed7625452dc5a9b6f6313c9e7200fa2`).

For more information, see the [R10 page](r10.html).


## R10 Data Release (2019-05-24)

We are pleased to be able to release prototype R10 pore data for the even Zymo mock community generated on the Oxford Nanopore GridION. This data is from the even mock community and has been generated in the same manner as previous releases, except that this material is from PCR-amplified material. At London Calling 2019 we also showed our latest native R10 run, producing binned genomes at over Q40.

The R10 pore is expected to give better discrimination in homopolymer regions and preliminary analysis suggests it improves consensus-level accuracy (see Jared Simpson's talk at NCM18 for early results: https://vimeo.com/306201411). This dataset is made available without restriction for community analysis. We anticipate releasing detailed analysis in the near future.

For more information, see our new [R10 page](r10.html).


## Release 2 (2018-10-17)

We recently released data for the Zymo mock community (1 run on PromethION, 3 runs on MinION). However, we found that our previous bead-based DNA extraction which focused on the bacterial cell pellet from the Zymo mock community resulted in under-representation of the Gram-negative bacteria in the sample. Additionally, during this work, the composition of the Zymo mock community changed.

Therefore we have repeated the sequencing of the most recent Zymo log and even community samples on the GridION and PromethION. In this case we prepared libraries simultaneously, incorporating both the pellet extraction and the supernatant to try to recover all species equally.

We loaded the same libraries on GridION and PromethION, permitting a direct comparison of these two instruments to be made.

### Zymo Community Standards 2 (Even) Batch ZRC190633

  - Useful for evaluating nanopore data analysis, including basecalling, alignment, assembly and taxonomic assignment methods
  - 10 species (5 Gram-positive, 3 Gram-negative, 2 yeast): the bacteria are present at 12% and yeast at 2% (by genomic DNA)
  - <a href="https://www.zymoresearch.eu/media/amasty/amfile/attach/_D6300_ZymoBIOMICS_Microbial_Community_Standard_v1.1.3.pdf">Zymo Specification Sheet</a>
  - Data available from:
     - GridION (Zymo-GridION-EVEN-BB-SN)
     - PromethION (Zymo-PromethION-EVEN-BB-SN)

### Zymo Community Standards 2 (Log/Staggered) Batch ZRC190842

   - Useful for evaluating limit of detection at high coverage and assess metagenomics assembly across large differences in abundances
   - 10 species (5 Gram-positive, 3 Gram-negative, 2 yeast) ranging from 10^2 - 10^8 genomic DNA abundance (total input 5 x 10^8 cells)
   - <a href="https://www.zymoresearch.eu/media/amasty/amfile/attach/_D6310_ZymoBIOMICS_Microbial_Community_Standard_II_Log_Distribution_v._1.1.2.pdf">Zymo Specification Sheet</a>
  - Data available from:
    - GridION (Zymo-GridION-LOG-BB-SN)
    - PromethION (Zymo-PromethION-LOG-BB-SN)

### Data Availability

|Name|Reads (M)|Yield (G)|FASTQ|Run Folder|Restarts|FAST5|
|:--|:--|:--|:--|:--|:--|:--|
|Zymo-PromethION-LOG-BB-SN|35.1|148|[fastq.gz](https://nanopore.s3.climb.ac.uk/Zymo-PromethION-LOG-BB-SN.fq.gz)|[64h run](https://nanopore.s3.climb.ac.uk/Zymo-PromethION-LOG-BB-SN_basecalls.tar.gz)|[restarts](https://nanopore.s3.climb.ac.uk/Zymo-PromethION-LOG-BB-SN-restarts_basecalls.tar.gz)|[download.sh](https://gist.github.com/SamStudio8/3ebbbd04dd8db557a3e8bdcedc875ee6), [restarts.tar](https://nanopore.s3.climb.ac.uk/Zymo-PromethION-LOG-BB-SN-restarts_signal.tar)|
|Zymo-PromethION-EVEN-BB-SN|36.5|146|[fastq.gz](https://nanopore.s3.climb.ac.uk/Zymo-PromethION-EVEN-BB-SN.fq.gz)|[64h run](https://nanopore.s3.climb.ac.uk/Zymo-PromethION-EVEN-BB-SN_basecalls.tar.gz)|[restarts](https://nanopore.s3.climb.ac.uk/Zymo-PromethION-EVEN-BB-SN-restarts_basecalls.tar.gz)|[download.sh](https://gist.github.com/SamStudio8/3ebbbd04dd8db557a3e8bdcedc875ee6), [restarts.tar](https://nanopore.s3.climb.ac.uk/Zymo-PromethION-EVEN-BB-SN-restarts_signal.tar)|
|Zymo-GridION-LOG-BB-SN|3.7|16|[fastq.gz](https://nanopore.s3.climb.ac.uk/Zymo-GridION-LOG-BB-SN.fq.gz)|[48h run](https://nanopore.s3.climb.ac.uk/Zymo-GridION-LOG-BB-SN_basecalled.tgz)|n/a|[signal.tar](https://nanopore.s3.climb.ac.uk/Zymo-GridION-LOG-BB-SN_signal.tar)|
|Zymo-GridION-EVEN-BB-SN|3.5|14|[fastq.gz](https://nanopore.s3.climb.ac.uk/Zymo-GridION-EVEN-BB-SN.fq.gz)|[48h run](https://nanopore.s3.climb.ac.uk/Zymo-GridION-EVEN-BB-SN_basecalled.tgz)|n/a|[signal.tar](https://nanopore.s3.climb.ac.uk/Zymo-GridION-EVEN-BB-SN_signal.tar)|

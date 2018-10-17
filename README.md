# Nanopore GridION and PromethION Mock Microbial Community Data Community Release

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

| Name                   | Reads (M)    | Yield (G)    | FASTQ      | FAST5       | NanoStat       |
|----------------------------|------|------|------------|-------------|----------------|
| Zymo-PromethION-LOG-BB-SN  | 35.1 | 148  | <a href="https://nanopore.s3.climb.ac.uk/Zymo-PromethION-LOG-BB-SN_basecalls.tar.gz">64h run</a>, <a href="https://nanopore.s3.climb.ac.uk/Zymo-PromethION-LOG-BB-SN-restarts_basecalls.tar.gz">restarts</a>      | to follow   | <a href="analysis/nanoplot_fastq/Zymo-PromethION-LOG-BB-SN_nanoplot_fastq/Zymo-PromethION-LOG-BB-SNNanoPlot-report.pdf">pdf</a> |
| Zymo-PromethION-EVEN-BB-SN | 36.5 | 146  | <a href="https://nanopore.s3.climb.ac.uk/Zymo-PromethION-EVEN-BB-SN_basecalls.tar.gz">64h run</a>, <a href="https://nanopore.s3.climb.ac.uk/Zymo-PromethION-LOG-BB-SN-restarts_basecalls.tar.gz">restarts</a>  | to follow | <a href="https://github.com/LomanLab/mockcommunity/blob/master/analysis/nanoplot_fastq/Zymo-PromethION-EVEN-BB-SN_nanoplot_fastq/Zymo-PromethION-EVEN-BB-SNNanoPlot-report.pdf">pdf</a> |
| Zymo-GridION-LOG-BB-SN     | 3.7  | 16   | <a href="https://nanopore.s3.climb.ac.uk/Zymo-GridION-LOG-BB-SN_basecalled.tgz">48h run</a> | to follow | <a href="analysis/nanoplot_fastq/Zymo-GridION-LOG-BB-SN_nanoplot_fastq/Zymo-GridION-LOG-BB-SNNanoPlot-report.pdf">pdf</a> |
| Zymo-GridION-EVEN-BB-SN    | 3.5  | 14   | <a href="https://nanopore.s3.climb.ac.uk/Zymo-GridION-EVEN-BB-SN_basecalled.tgz">48h run</a> | to follow | <a href="analysis/nanoplot_fastq/Zymo-GridION-EVEN-BB-SN_nanoplot_fastq/Zymo-GridION-EVEN-BB-SNNanoPlot-report.pdf">pdf</a> |

## Further information

Please refer to <a href="https://www.slideshare.net/scalene/assessing-ultradeep-longread-metagenomics-on-oxford-nanopore-promethion">Josh Quick's talk at Genome Science 2018</a>.

### License

Data are available under a Creative Commons Attribution 4.0 International (CC BY 4.0) <a href="https://creativecommons.org/licenses/by/4.0/">license</a>, i.e. you are free to use the data with attribution.

### Acknowlegements

We are grateful to Hannah McDonnell (Cambridge Biosciences) for free samples of the Zymo mock community, and Shuiquan Tang for helpful advice for this work. We are grateful to Divya Mirrington (Oxford Nanopore Technologies) for assistance with PromethION library preparation. We thank Radoslaw Poplawski (CLIMB, University of Birmingham) for sequencer networking and file system help with the data release. We are grateful to <a href="http://www.climb.ac.uk">CLIMB</a> for data hosting.


## Previous Data Releases


  - September 2018 - <a href="rev1.html">Revision 1 data available here.</a>


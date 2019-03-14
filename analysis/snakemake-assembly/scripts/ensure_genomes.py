"""A dumb script to force the creation of some FASTA if they don't already exist
to stop Snakemake falling over."""

import os
import sys
from pathlib import Path

path = sys.argv[1]
genomes = sys.argv[2:]

for g in genomes:
    Path(os.path.join(path, g+'.fasta')).touch()

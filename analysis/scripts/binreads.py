import pysam
import sys
from Bio import Seq
from Bio.Alphabet import generic_dna

refdicts = {}

samfile = pysam.AlignmentFile(sys.argv[1], "r")
for align in samfile:
    if not align.is_supplementary \
      and not align.is_secondary \
      and not align.is_unmapped \
      and align.reference_length >= 500:
           ref = samfile.get_reference_name(align.reference_id)
           ref, contig = ref.split("_")

           if ref not in refdicts:
               refdicts[ref] = open("%s_%s.fastq" % (sys.argv[2], ref), "w")

           seq = align.get_forward_sequence()
           qual = align.get_forward_qualities()
           #if align.is_reverse:
           #    seq = str(Seq.Seq(seq, generic_dna).reverse_complement())
           fasta = "@%s\n%s\n+\n%s\n" % (align.query_name, seq, "".join([chr(x+33) for x in qual]))
           refdicts[ref].write(fasta)

for fh in refdicts.values():
    fh.close()


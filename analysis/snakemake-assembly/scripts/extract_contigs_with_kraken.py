import sys
from Bio import SeqIO

prefix = ""
if len(sys.argv) == 4:
    prefix = sys.argv[3]

mapping = {}

for ln in open(sys.argv[1]):
    cols = ln.split("\t")
    species = "_".join(cols[2].lower().split(" ")[0:2])
    print (cols[1], species)
    mapping[cols[1]] = species

filehandles = {}

for rec in SeqIO.parse(open(sys.argv[2]), "fasta"):
    tax = mapping[rec.id]
    if tax not in filehandles:
        filehandles[tax] = open(prefix + tax +'.fasta', 'w')
    SeqIO.write([rec], filehandles[tax], "fasta")



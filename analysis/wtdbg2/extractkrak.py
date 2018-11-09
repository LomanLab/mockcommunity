import sys
import csv

print ("SampleID\tZymo\tPlatform\tExtraction\tSuperNatant\tLength\tLimit\tOverlaps\tContigID\tTaxon\tContigSize")
for fn in sys.argv[1:]:
    path, filename = fn.split("/")

    conditions = path.replace('.fq.wtdbg2.', '-').split("-")

    for ln in open(fn):
        col = ln.split("\t")
        taxa = col[2].split(" ")
        print ("%s\t%s\t%s\t%s %s\t%s" % (path, "\t".join(conditions), col[1], taxa[0], taxa[1], col[3]))


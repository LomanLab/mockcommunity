import sys
import os

GENOMES = [
    "bacillus subtilis",
    "enterococcus faecalis",
    "escherichia coli",
    "listeria monocytogenes",
    "pseudomonas aeruginosa",
    "saccharomyces cerevisiae",
    "salmonella enterica",
    "staphylococcus aureus",
    "cryptococcus neoformans",
    "lactobacillus fermentum",
]

def main():
    print ("\t".join(['SampleID', 'Suffix', 'ContigID', 'Taxon', 'ContigSize']))
    for path in sys.argv[1:]:
        basename = os.path.basename(path)
        uuid = basename.split(".")[0] # get uuid
        suffix = basename.split(".", 1)[1]

        sys.stderr.write(basename)
        sys.stderr.write("\n")
        for line in open(path):
            col = line.split("\t")
            taxa = col[2].split(" ")

            taxon = "%s %s" % (taxa[0], taxa[1])
            if taxon.lower() in GENOMES:
                print ("\t".join([uuid, suffix, col[1], taxon, col[3]]))
            else:
                print ("\t".join([uuid, suffix, col[1], "X", col[3]]))
                #pass

if __name__ == "__main__":
    main()

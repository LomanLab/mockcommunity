import pysam
import sys

print ("Genome\tContig\tQueryName\tALen")
samfile = pysam.AlignmentFile(sys.argv[1], "r")
for align in samfile:
    if not align.is_supplementary and not align.is_secondary and not align.is_unmapped and align.reference_length >= 500:
        ref = samfile.get_reference_name(align.reference_id)
        ref, contig = ref.split(":")

        print ("%s\t%s\t%s\t%s" % (ref, contig, align.query_name, align.alen))

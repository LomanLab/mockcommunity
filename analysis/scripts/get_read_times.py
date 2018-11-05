import csv
import sys
from Bio import SeqIO
import dateutil.parser
import time

for fn in sys.argv[1:]:
    for rec in SeqIO.parse(open(fn), "fastq"):
        fields = rec.description.split(" ")
        read_id = fields[0]
        for f in fields[1:]:
            key, val = f.split("=")
            if key == 'start_time':
                dt = dateutil.parser.parse(val)
                print ("%s\t%s" % (read_id, int(time.mktime(dt.timetuple())) ))


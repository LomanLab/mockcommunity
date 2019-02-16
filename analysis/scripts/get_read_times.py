import csv
import sys
from Bio import SeqIO
import dateutil.parser
import time

def readfq(fp): # this is a generator function
    last = None # this is a buffer keeping the last unprocessed line
    while True: # mimic closure; is it a bad idea?
        if not last: # the first record or a record following a fastq
            for l in fp: # search for the start of the next record
                if l[0] in '>@': # fasta/q header line
                    last = l[:-1] # save this line
                    break
        if not last: break
        name, description, seqs, last = last[1:].partition(" ")[0], last[1:], [], None
        for l in fp: # read the sequence
            if l[0] in '@+>':
                last = l[:-1]
                break
            seqs.append(l[:-1])
        if not last or last[0] != '+': # this is a fasta record
            yield name, description, ''.join(seqs), None # yield a fasta record
            if not last: break
        else: # this is a fastq record
            seq, leng, seqs = ''.join(seqs), 0, []
            for l in fp: # read the quality
                seqs.append(l[:-1])
                leng += len(l) - 1
                if leng >= len(seq): # have read enough quality
                    last = None
                    yield name, description, seq, ''.join(seqs); # yield a fastq record
                    break
            if last: # reach EOF before reading enough quality
                yield name, description, seq, None # yield a fasta record instead
                break

for fn in sys.argv[1:]:
    for name, description, seq, qual in readfq(open(fn)):
        fields = description.split(" ")
        for f in fields:
            if f.startswith('start_time'):
                key, val = f.split("=")
                if key == 'start_time':
                    dt = dateutil.parser.parse(val)
                    print ("%s\t%s" % (name, int(time.mktime(dt.timetuple())) ))


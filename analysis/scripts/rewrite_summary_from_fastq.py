import csv
import sys

# read metadata

reads = dict()

for row in csv.reader(open(sys.argv[1]), dialect='excel-tab'):
    reads[row[0]] = int(row[1])

run_start_time = min(reads.values())

# read each summary file

first = True
for fn in sys.argv[2:]:
    reader = csv.DictReader(open(fn), dialect='excel-tab')
    writer = csv.DictWriter(sys.stdout, fieldnames=reader.fieldnames, dialect='excel-tab')
    if first:
        writer.writeheader()
        first = False
    for row in reader:
        try:
            row['start_time'] = float(reads[row['read_id']] - run_start_time)
            writer.writerow(row)
        except KeyError:
            pass


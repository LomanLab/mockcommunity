import csv
import sys

# read metadata

runs = dict()

for row in csv.reader(open(sys.argv[1]), dialect='excel-tab'):
    print (row)
    runs[row[2]] = int(row[0])

print (runs)

run_start_time = min(runs.values())

# read each summary file

for fn in sys.argv[2:]:
    reader = csv.DictReader(open(fn), dialect='excel-tab')
    writer = csv.DictWriter(sys.stdout, fieldnames=reader.fieldnames, dialect='excel-tab')
    for row in reader:
        run_id = row['run_id']
        print (row)

        exp_start_time = int(runs[run_id])
        start_time = float(row['start_time'])

        row['start_time'] = exp_start_time - run_start_time + start_time 
        writer.writerow(row)

#look up run
#take delta of runid start time and main start time
#add to start time

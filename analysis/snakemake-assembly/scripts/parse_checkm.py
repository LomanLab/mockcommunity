import sys
import re

def parse_checkm(path):
    checkm_fh = open(path)
    header = None
    data = {}
    for line in checkm_fh:
        if line[0] == "-":
            continue
        elif len(line.strip()) == 0:
            continue
        elif "Controlled exit" in line:
            continue

        fields = re.split('\s{2,}', line.strip())
        if not header:
            header = fields
        else:
            data[ fields[0] ] = { header[i]:fields[i] for i in range(len(header))}
    return data

if __name__=="__main__":
    print(parse_checkm(sys.argv[1]))

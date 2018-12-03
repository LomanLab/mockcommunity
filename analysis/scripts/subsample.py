import pysam
import argparse
import random


def main(args):
    with pysam.FastxFile(args.fastx) as fq:
        for entry in fq:
            if random.random() >= (1.0 - args.sample_percentage):
                print(str(entry))

if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser()

    parser.add_argument("fastx")
    parser.add_argument("sample_percentage", type=float)
    main(parser.parse_args())

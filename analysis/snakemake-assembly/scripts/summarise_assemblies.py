import sys
import parse_checkm

species = [
    "bacillus_subtilis",
    "enterococcus_faecalis",
    "escherichia_coli",
    "listeria_monocytogenes",
    "pseudomonas_aeruginosa",
    "saccharomyces_cerevisiae",
    "salmonella_enterica",
    "staphylococcus_aureus",
]

meta_fh = open(sys.argv[2])
fa_meta = {}
for line in meta_fh:
    fields = line.strip().split(",")
    fa_meta[fields[0]] = [fields[1], fields[2]]

manifest_fh = open(sys.argv[3])
uuid_header = manifest_fh.readline().strip().split("\t")
uuid_manifest = {}
for line in manifest_fh:
    fields = line.strip().split("\t")
    uuid_manifest[fields[0]] = dict(zip(uuid_header, fields))

try_checkm = False
if len(sys.argv) == 5:
    try_checkm = True

#print("<html><head></head><body><table>")
#print("""---
#layout: assembly
#title: Assemblies
#---

### Illumina Mock Community Draft References v1.0

#* [Zymo-Isolates-SPAdes-Illumina.fasta](http://nanopore.s3.climb.ac.uk/mockcommunity/v2/Zymo-Isolates-SPAdes-Illumina.fasta) (69 MB, `e7b60972c37869e0e91513a06bdf9d33`)

### Nanopore Assemblies (wtdbg2) v1.1

#""")
print("<table>")
fields = [
    "<tr>",
        "<th>Platform</th>",
        "<th>Zymo</th>",
        "<th>Extraction</th>",
        "<th>L</th>",
        "<th>e</th>",
        "<th>p</th>",

        "<th>Total bp</th>",
        "<th>Contigs</th>",
        "<th>N50</th>",
]

fields.extend([
    "<th>%s</th>" % "".join([x[0] for x in ref.split("_")]) for ref in species
])
fields.append("<th>Download</th>")

fields.append("</tr>")
        
print("\n".join(fields))

stats_fh = open(sys.argv[1])
for line in stats_fh:
    fields = line.strip().split('\t')
    if fields[0] == "Sample_ID":
        continue
    
    fa = fields[0]

    uuid = fa.split('.')[0]
    properties = uuid_manifest[uuid]

    genome_size = int(fields[1])
    n_contigs = int(fields[2])
    n50 = int(fields[5])


    fields = [
        "<tr>",
            "<td>%s</td>" % properties.get("platform", "?"),
            "<td>%s</td>" % properties.get("community", "?"),
            "<td>%s</td>" % properties.get("extraction", "?"),

            "<td>%s</td>" % properties.get("length", "?"),
            "<td>%s</td>" % properties.get("edge", "?"),
            "<td>%s</td>" % properties.get("pmer", "?"),

            "<td>%d</td>" % genome_size,
            "<td>%d</td>" % n_contigs,
            "<td>%d</td>" % n50,
    ]

    fields.extend([
        "<td><img height=150 width=150 src='minidotplots/%s.%s.png'></td>" % (fa.replace(".fa", ""), ref) for ref in species
    ])

    fields.append("<td><a href='http://nanopore.s3.climb.ac.uk/mockcommunity/v3/%s'>Download (%s, <code>%s</code>)</a></br>%s</td>" % (fa, fa_meta[fa][0], fa_meta[fa][1], fa.replace(uuid, "")))
    fields.append("</tr>")

    if try_checkm:
        fields.append("<tr><td colspan=9></td>")

        checkm_d = {}
        checkm_d = parse_checkm.parse_checkm("checkm-%s" % fa.replace(".fa", ".txt"))
        fields.extend([
            "<td style='text-align:center'>%s</td>" % (checkm_d.get(ref, {}).get("Completeness", "?")) for ref in species
        ])
        fields.append("</tr>")
            
    print("\n".join(fields))

#print("</table></body></html>")
print("</table>")

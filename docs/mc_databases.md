---
layout: default
title: Databases
---

### kraken2-microbial (September 2018, 30GB)
A database built by stacking the `kraken2` `--download-library` command for the following database types:

* archaea
* bacteria
* fungi
* protozoa
* viral
* UniVec_Core

`kraken2` downloads and hashes sequences from `RefSeq` that are marked as "complete" or "representative"

**Prepared** 2018-09-03 **by** @samstudio8
* `hash.k2d` (30 GB, `b327a46e5f8122c6ce627aecf13ae5b1`)
* `opts.k2d` (48 B, `e77f42c833b99bf91a8315a3c19f83f7`)
* `taxo.k2d` (1.7 MB, `764fee20387217bd8f28ec9bf955c484`)

```
mkdir kraken2-microbial-fatfree/
cd kraken2-microbial-fatfree/
wget -c https://refdb.s3.climb.ac.uk/kraken2-microbial/hash.k2d
wget https://refdb.s3.climb.ac.uk/kraken2-microbial/opts.k2d
wget https://refdb.s3.climb.ac.uk/kraken2-microbial/taxo.k2d
```
**Note** `wget -c` will allow you to continue a stalled download without starting over!


### maxikraken2_1903_140GB (March 2019, 140GB)
A database built in a similar way to `kraken2-microbial`, but instead allowing hashes to be generated from genomes that are not "complete" or "representative", for the following database types:

* archaea
* bacteria
* fungi
* protozoa
* viral
* human

The database has been made available for sharing by Daniel Fischer (Natural Resources Institute Finland) and was built [using scripts available on Github](https://github.com/fischuu/Kraken_db_install_scripts).
CSC - IT Center for Science, Finland, is acknowledged for computational resources.

**Prepared** 2019-03 **by** @fischuu
* `hash.k2d` (141 GB, `0ef062f3dae7f497fe258f67c2e542fe`)
* `opts.k2d` (48 B, `e77f42c833b99bf91a8315a3c19f83f7`)
* `taxo.k2d` (5.2 MB, `f6591859824de9d1893002d5e8d1eee0`)

```
mkdir maxikraken2_1903_140GB/
cd maxikraken2_1903_140GB/
wget -c https://refdb.s3.climb.ac.uk/maxikraken2_1903_140GB/hash.k2d
wget https://refdb.s3.climb.ac.uk/maxikraken2_1903_140GB/opts.k2d
wget https://refdb.s3.climb.ac.uk/maxikraken2_1903_140GB/taxo.k2d
```
**Note** `wget -c` will allow you to continue a stalled download without starting over!

#!/usr/bin/perl

#Author: Raymond Kiu (2018)
if (scalar(@ARGV) == 1) {
    $infile = shift(@ARGV);
}
else {
    die "\nProgram usage: \n\n\$ assembly_stats.pl FASTA.fasta\n\nAuthor: Raymond Kiu Raymond.Kiu@quadram.ac.uk\n20 June 2018\n\n";
}

$count = 0;
$sum = 0;

open(IN,$infile) or die "unable to read input fasta file '$infile': $!\n";
while(<IN>) {
    chomp;
    if ($_ =~ /^>/) {
        $count++;
        if (defined($seq)) {
            $combinedSeq .= $seq;
            $sum += length($seq);
            push(@lengths, length($seq));
            $seq = '';
        }
    }
    else {
        $seq .= $_;
    }
}
$combinedSeq .= $seq;
$sum += length($seq);
push(@lengths, length($seq));

$average = int($sum / $count);

$add = 0;
$num = 0;

@lengths = sort {$b <=> $a} @lengths;
while ($add < ($sum/2)) {
    $add += $lengths[$num++];
}

$n50 = $lengths[$num-1];

@combinedSeq = split(//, $combinedSeq);
for ($i=0; $i<=$sum; $i++) {
    if (defined($combinedSeq[$i])) {
        $baseCount{$combinedSeq[$i]}++;
    }
}

#printf("\nperc A               : %2.1d\n", ($baseCount{'A'}/$sum) * 100);
#printf("perc C               : %2.1d\n", ($baseCount{'C'}/$sum) * 100);
#printf("perc G               : %2.1d\n", ($baseCount{'G'}/$sum) * 100);
#printf("perc T               : %2.1d\n", ($baseCount{'T'}/$sum) * 100);
#printf("perc GC              : %2.1\n", (($baseCount{'G'}/$sum)+ ($baseCount{'C'}/$sum))*100);
my $gc=(($baseCount{'G'}/$sum)+ ($baseCount{'C'}/$sum))*100;
$rounded = sprintf "%.2f", $gc;
#if (defined($baseCount{'N'}) && ($baseCount{'N'} > 0)) {
#    printf("N percentage %: %2.1d\n", ($baseCount{'N'}/$sum) * 100);
#} else {
#    printf("N percentage %: %2.1d\n", 0);
#}
$Nperc = (($baseCount{'N'}/$sum)*100);
$roundedNperc = sprintf "%.2f", $Nperc;
$Ncount = $baseCount {'N'};
$gapcount = (($baseCount {'-'})/1);


print "Sample_ID\tGenome\tContigs\tMean\tMedian\tN50\tLargest\tGC(%)\tN_count\tN(%)\tGap_count\n";
print "$infile\t$sum\t$count\t$average\t$lengths[int($#lengths/2)]\t$n50\t$lengths[0]\t$rounded\t$Ncount\t$roundedNperc\t$gapcount\n";

#print "Sum contig length    : $sum\n";
#print "Num contigs          : $count\n";
#print "Mean contig length   : $average\n";
#print "Median contig length : $lengths[int($#lengths/2)]\n";
#print "N50 value            : $n50\n";
#print "Max                  : $lengths[0]\n\n";
close(IN);

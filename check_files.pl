use strict;
use Data::Dumper;

if (@ARGV <2){
	print "perl $0 <report file> <datadir>\n";
}
my $in=shift;
my $tocheck=shift;

open IN,$in;

while(<IN>){
	chomp;
	my @a=split(/\t/);
	next if $a[0] eq "Lane Number";
	
	#print "$tocheck/$a[1]/$a[5]\_1.fq.gz\n";
	print "error copy: $a[5]\n" unless -e "$tocheck/$a[1]/$a[5]\_1.fq.gz";
}
print "All Good!!!\n";

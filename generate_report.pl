use strict;
use Data::Dumper;

if (@ARGV < 3){
	print "perl $0 <Project ID> <CSV folder> <machineID_FlowcellID1> <machineID_FlowcellID2> <machineID_FlowcellID3> ...\n";exit(0);
}
my $PID=shift;
my $path=shift;
print "Lane Number\tBGI Sample name\tsubmitter ID\tSpecies\tBarcode\tMachine Sample ID\tRead 1 cycles\tRead 2 Cycles\n";
foreach my $f(@ARGV){
	$f=~s/\/$//;
	my ($machine,$flowcell)=split(/\_/,$f);

	my $tmp=`cat $path/$f*.csv`;
	my @lines=split(/\n/,$tmp);

	foreach (@lines){
		next unless /^\d\,/;
		my @a=split(/\,/);
		next unless $a[1] =~/$PID/;

		print join("\t",@a[0..5,7,8]),"\n";
	}
}

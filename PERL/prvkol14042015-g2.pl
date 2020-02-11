#!/usr/bin/perl 

open NAREDBI, ">$ARGV[0]" or die"ERROR ($!)\n";
open VLEZ, ">>$ARGV[1]" or die"ERROR ($!)\n";
$brnar = $ARGV[2];
print "Vnesi $brnar naredbi:\n";


for(my $i=0; $i < $brnar; $i++)
{	
	$var = <STDIN>;
	chomp $var;
	@naredbi[$i] = $var;
	print VLEZ "$var ";
	if($var =~ m/(\w+) */)
	{
		@pom[$i] = $1;
	}
}
$p = 1;
foreach $nar (@pom)
{
	for(my $j=$p; $j < $brnar; $j++)
	{
		if("$nar" eq "@pom[$j]")
		{
			delete $pom[$j];
		}
	}
	
	print NAREDBI "$nar\n";
	$p++;

}
print "-----------Pecati------------------\n";
foreach $command (@naredbi)
{
	print "$command\n";
}
print "------------Kraj-------------------"



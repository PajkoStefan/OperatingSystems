#!/usr/bin/perl -w
open FH, ">>$ARGV[0]" or die "ERROR ($!)\n";
shift @ARGV;
print "@ARGV\n";
$brarg=@ARGV;
print "$brarg\n";
$i=0;
foreach $zbor (@ARGV)
{
	$zbor="\u\L$zbor";
	#print "$zbor\n";
	if($i==$brarg-1)
	{
		$zbor="$zbor" . ".";
	}
	@rec[$i++]=$zbor;
	
}
print FH "@rec\n";

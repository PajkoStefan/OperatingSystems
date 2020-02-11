#!/usr/bin/perl -w

@imedat = @ARGV;
$brarg = @imedat;

if($brarg == 2)
{

#print "@imedat, brarg: $brarg \n";

open VLEZ, "<$imedat[1]" or die "ERROR: ($!)\n;";

open NAREDBI, "<$imedat[0]" or die "ERROR: ($!)\n;";
$/='\n';
$prva = <NAREDBI>;
$vtora = <VLEZ>;
@vlez = split ' ', $vtora;
@naredbi = split '\n', $prva;

foreach $vle (@vlez)
{	
	$flag=0;

	foreach $nar (@naredbi)
	{
		chomp $nar;
	
		if($nar eq $vle)
		{
			print "\n$vle";
			$flag=1;
		}
		 	
	}	

	if($flag == 0)
	{
		print " $vle";
	}

}

print "\n";
}




else
{
print "Vnesovte pogresen broj na argumenti \n";
}

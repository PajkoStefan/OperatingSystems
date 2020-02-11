#!/usr/bin/perl -w
open FH, "$ARGV[0]" or die "ERROR ($!)\n";
$imedat=$ARGV[0];
if($imedat =~ m/([a-zA-Z]_*\w*).txt/)
{
	$imefix =$1;
}



@datoteka=<FH>;
#print "@datoteka";
while(($pom=<STDIN>) !~ "kraj")
{	
	#open FH1, ">>${imefix}_${pom}.txt" or die "ERROR vnatre ($!)\n";
	$i=1;
	foreach $red (@datoteka)
	{
		$flag=0;
		@zbor=split " ", $red;
		print "red broj $i:\n";	
		foreach $zborce (@zbor)
		{	$_=$zborce;
			if($pom =~ /^$zborce/) #ne $zborce =~ pom! golema greska pazi
			{
				print "najdeno\n";
				$flag=1;	
			}
		}
		print "\n";
		if($flag==1)
		{
			print "$red\n";
			#print FH1 $red;
		}
		$i++;
	}



	#close(FH1);
}
print "Izlegov\n";

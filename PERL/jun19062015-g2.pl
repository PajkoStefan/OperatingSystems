#!/usr/bin/perl -w

open FH1, "$ARGV[0]" or die "ERROR ($!)\n";

open FH2, "$ARGV[1]" or die "ERROR ($!)\n";
if( $ARGV[0] =~ m/(\w+)\.[a-zA-Z]+$/)
{
	$imedat = $1;
	$imedatfix = "$imedat" . "_fix.txt";
}

open FH3, ">$imedatfix" or die"ERROR ($!)\n";

@datoteka = <FH1>;
@dat2= <FH2>;
#print "@dat2";
#$brred=@datoteka;
#print "@datoteka, $brred\n";
$i=0;
foreach $broevi (@dat2)
{
	@broj = split ' ',$broevi;
	print "[ @broj ]";
	foreach $rec ($datoteka[$i])
	{
 		$/=".\n";
 		chomp $rec;	
 		#print "$rec\n";
		@pom = split ' ', $rec;
		print "@pom\n";
		$zbor1[0] = @pom[$broj[0]-1]; #prvzbor (na mesto na vtor)
		$zbor1[1] = @pom[$broj[1]-1]; #vtor zbor (na mesto na prv)
		@pom[$broj[0]-1]=$zbor1[1];
		@pom[$broj[1]-1]=$zbor1[0];
		if($pom[-1] !~ m/\w+\.$/)
		{
		$pom[-1]=$pom[-1] . ".";
		}
				
		print "-- @pom --\n";
		print FH3 "@pom\n";	
	
	}
 $i++;
}

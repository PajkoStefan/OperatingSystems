#!/usr/bin/perl -w

$imedat = shift @ARGV;
@listazb = @ARGV;

print "-- $imedat --";
print "\n";
print "### @listazb ###";
print "\n";
#$zbor = split @listazb
$brzbor=@listazb;
print "brzbor: $brzbor\n\n";

for($i=0; $i<$brzbor; $i++)
{
	if( $listazb[$i] =~ /(\w\w\w)/)
	{
		@pom[$i] = $1;
	} 
}

open FH, "<$imedat" or die "Greska ($!)\n"; 

while(<FH>)
{
	print $_;
	@zbor = split, @listazb;
#	print "-# @zbor #-" . "\n";
	$pombr = @zbor;
#	print "$pombr";

	for(my $j=0; $j<$pombr; $j++)
	{
		for(my $p=0; $p<$brzbor;$p++)
		{
			@zam = $pom[$p];
			if($zbor[$j] =~ m/(@zam)\w*/)	
			{
			#	print "!#!#!#!#!# $zbor[$j] !#!#!#!#!#\n";
				$sovpadjanje{$zbor[$j]} += 1;
			}		
		}
	}
}

@keysovi = keys(%sovpadjanje);
print "@keysovi\n";
$brkeys = @keysovi;
print "\nZborovi za sporedba:" . " --# @pom #--\n\n";
print "Zborovite koi se slicni i broj pati\n";
print "Zborot = broj pati:\n";
for(my $i=0; $i<$brkeys; $i++)
{
	print "#$keysovi[$i]# = $sovpadjanje{$keysovi[$i]}\n";
}

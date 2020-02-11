#!/usr/bin/perl -w

open DAT, "$ARGV[0]" or die "ERROR ($!)\n";
if($ARGV[0] =~ s/(_*-*\w*_*-*\w*_*-*\w+)\.\w+$//)
{
	$imedat=$1;
}
open IZLEZ, ">$imedat" . "_fix.txt" or die "ERROR ($!)\n";

@datoteka = <DAT>;

foreach $rec (@datoteka)
{
	@prec=();
	$/=".\n";
	chomp $rec;
	#print "$rec\n";
	@pom = split ' ', $rec;
	$brzbor = @pom;
	#print "$brzbor\n";
	for(my $i=0; $i<$brzbor;$i++)
	{
		
		#print "++$pom[$i]++\n";
		if($pom[$i] =~ m/(\d+)(\w+)/)
		{
			my $broj = $1;
			my $zbor = $2;
 			#print "$broj : $zbor\n";
			if($broj <= $brzbor-1)
			{
				if($broj=='0')
				{
					@prec[$i+1]=$zbor;	
				}	
				else
				{
				@prec[$broj]=$zbor;
				}	
			}
			else { @prec[$broj]=$zbor . "."	; }	
		}	
		
	}
	if(@prec != 0)
	{
	shift @prec;
	print IZLEZ "@prec\n";
	}
}


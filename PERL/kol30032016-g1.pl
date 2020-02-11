#!/usr/bin/perl -w

open FH1, "$ARGV[0]" or die "ERROR ($!)\n";

@pom=<FH1>;

$granenje=0;
$brfor=0;
#$kompleksnost=0;

foreach $rec (@pom)
{
	
	@zbor=split ' ', $rec;
	$brzbor=@zbor;
	for(my $i=0; $i<$brzbor; $i++)
	{	
		if($zbor[$i] =~ m/([a-zA-Z]\w*)\_*\w*=\w*/)
		{
			$element=$1;
			push(@array, $element);
		}
		
		if( $zbor[$i] =~ m/^if/)
		{
			$granenje++;			
		}
		if( $zbor[$i] =~ m/^elif/)
		{			
			$granenje++;				
		}
	
		if ($zbor[$i] =~ m/^for/)
		{		
			$brfor++;		
		}
	}

}
$brprom = @array;

$i=1;

for(my $s=0; $s<($brprom-1); $s++)
{

	for (my $j=$i; $j<$brprom; $j++)
	{
		if($array[$s] eq $array[$j])
		{ 
			delete $array[$j];
		}
	}
	$i++;	
}
foreach $rec (@array)
{
	if($rec =~ m/[a-zA-Z]\w*_*\w*/)
	{
		print "++ $rec ++\n";
		$brr++;
	}
}
print "Broj na promenlivi koi se kreirani: $brr\n";
print "Granenje (IF/ELIF): $granenje\n";
#print "Kompleksnost: $kompleksnost\n";
print "brfor: $brfor\n";

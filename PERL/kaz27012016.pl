#!/usr/bin/perl -w

open FH, "$ARGV[0]" or die "ERROR ($!)\n";
if ( $ARGV[0] =~ s/(\.[a-zA-Z]+)//)
{
	$imedat="$`.html";
	print "$imedat\n";
}
else {$imedat=$ARGV[0] . ".html"; print "else: $imedat\n";}
open FH1, ">$imedat" or die "ERROR2 ($!)\n";
@datoteka = <FH>;
$flag=0; 
foreach $red (@datoteka)
{	#ako ne e buk
	chomp $red;
	if($red =~ m/(\n)/g)
	{	
		print "<br />";
	}
		
	
	#print "$red\n";
	@zbor = split " ", $red;
	if ($flag==0) # ne e buk vlezi pretrazi
	{
		foreach $zborce (@zbor)
		{	#print "$zborce\n";
			if($zborce =~ m/\<Book\>/)
			{ 
				print FH1 "$zborce\n"; 
				$flag=1; # buk e sega
			}
			else { $flag=0; }
		}
	}
	if( $flag == 1 )
	{	
		#print "Vlegov\n";
		if ( $red !~ m/\<\/Book\>/)
		{	
		#	print "Ne e kraj\n";
		#	print "|| $red ||\n";
			if( $red =~ m/(\s*)\<Ime\>(\s*\w*\s*)\<\/Ime\>/i)
				{
			#	print "ne vleguva\n";
				print FH1 "$1<p>$2</p>\n ";		#print FH1 "$1<Ime>$2</Ime>\n ";			
				}	
			elsif( $red =~ m/(\s*)\<link\>(\s*(\w*)\s*)\<\/link\>/i)
			{
		#	print "ne vleguva\n";
			print FH1 "$1<a href=\"$3\">$2</a>\n";			
			}					
		}
		else { $flag=0; print FH1 "$red\n"; }


	}

	

}

#!/usr/bin/perl -w
open FH, "$ARGV[0]" or die "ERROR ($!)\n";
%skalari=();
%polinja=();
%hashovi=();
%opendat=();
foreach $red (<FH>)
{
	@naredbi = split ' ', $red;
#print "-- @naredbi --\n";
	foreach $zbor (@naredbi)
	{
		#print "!! $zbor !!\n";
		if($zbor =~ m/^\$([a-zA-Z]\w*_*\w*)=/)
		{
			$skalari{$1}=1;
			#print "# $zbor #\n";		
		}		
		if($zbor =~ m/^\$([a-zA-Z]\w*_*\w*)$/)
		{
			$skalari{$1}=1;
			#print "# $zbor #\n";		
		}
		if($zbor =~ m/^\@([a-zA-Z]\w*_*\w*)/)
		{
			$polinja{$1}=1;
			
			#print "# $zbor #\n";
		}
		if($zbor =~ m/^\$([a-zA-Z]\w*_*\w*)\[/)
		{
			$polinja{$1}=1	;		
			#print "# $zbor #\n";
		}
		if($zbor =~ m/^\%([a-zA-Z]\w*_*\w*)/)
		{
			$hashovi{$1}=1;			
			#print "# $zbor #\n";
		}	
		if($zbor =~ m/\<([A-Z0-9]+)\>/)
		{ 
			$opendat{$1}=1; 
			#print "# $zbor #\n";
		}
	}
}
@klskalari = keys(%skalari);
$brkluc1=@klskalari;

@klpolinja=keys(%polinja);
$brkluc2=@klpolinja;

@klhashovi=keys(%hashovi);
$brkluc3=@klhashovi;

@klopendat=keys(%opendat);
$brkluc4=@klopendat;
#@klskalari=keys(%skalari);
#$brkluc=@klucevi;


print "\nBroj Skalari $brkluc1, tie se:\n";
foreach $kluc (@klskalari)
{	print "$kluc\n"; }
print "\nBroj Polinja $brkluc2, tie se:\n";
foreach $kluc2 (@klpolinja)
{	print "$kluc2\n"; }
print "\nBroj Hashovi $brkluc3, tie se:\n";
foreach $kluc3 (@hashovi)
{	print "$kluc3\n"; }
print "\nBroj Opendat $brkluc4, tie se:\n";
foreach $kluc4 (@klopendat)
{	print "$kluc4\n"; }

#!/bin/bash

imedat=$1;
imedatfix=$1;
printf "$imedat\n";

while IFS= read -r line
do
	line=`cat $imedat | sed -e 's/!/./g' -e 's/,/./g' -e 's/-/./g' -e 's/_/./g'`;
	echo "$line\n" > $imedat;
done <"$imedat"

imedatfix=`echo $imedatfix | sed 's/\.[a-zA-Z]*//'`

imedatfix=`echo "$imedatfix""_fix.txt"`
echo $imedatfix
./jun19062015.pl $imedat
cat $imedatfix

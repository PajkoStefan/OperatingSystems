#!/bin/bash

imedat1=$1;
imedat2=$2;
imedatfix=$1;
printf "$imedat1\n";
pom=`cat $imedat1 | sed -e 's/!/./g' -e 's/,/./g' -e 's/-/./g' -e 's/_/./g'`
echo $pom > $imedat1;

imedatfix=`echo $imedatfix | sed 's/\.[a-zA-Z]*/_fix.txt/'`

./jun19062015-g2.pl $imedat1 $imedat2
cat $imedatfix

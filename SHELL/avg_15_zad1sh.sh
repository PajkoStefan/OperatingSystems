#!/bin/bash

#path1=`find ~ -type f -iname "datoteki.dat" | sed 's/datoteki.dat$//'`
#`cd $bitno`


#path2=`find ~ -type f -iname "argumenti.dat" | sed 's/argumenti.dat$//'`

dat="$(find ~ -name datoteki.dat)"

arg="$(find ~ -name argumenti.dat)"

while read datoteka
do
	while read argument
	do
		./avg_15_zad1.pl $datoteka $argument
	done < "$arg"

done < "$dat"

#!/bin/bash

path1=`find ~ -type f -name "naredbi.txt"`
cp $path1 $PWD
path2=`find ~ -type f -name "vlez.txt"`
cp $path2 $PWD
`./prvkol14042015.pl naredbi.txt vlez.txt ` | while read -r line;
do
	name = "$line"
	echo "++ $name ++\n"
	
done >>"izlez.txt"

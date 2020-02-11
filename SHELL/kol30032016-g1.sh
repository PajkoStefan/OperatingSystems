#!/bin/bash

#pom2=`ls -R | grep '.*[.]sh'`
pom2=`find ~ -type f -name "*.sh"`
echo $pom2
for i in $pom2
do
	pom=`echo $i | sed 's/\.sh//g'`
	echo "--${pom}--";
	read -r line < $pom
	if [ -n $line ]
	then
		echo "tocno";
	else
		echo "ne e vo red";	
	fi
	
done

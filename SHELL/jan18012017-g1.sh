#!/bin/bash

prvadat=$1;
shift 
ostanatidat=$@;
#printf "$prvadat\n";
#printf "$ostanatidat\n";

#echo $brdat;


j=0
argv=()
for arg in "$ostanatidat"
do
	arg=`echo $arg | sed 's/\.[a-zA-Z]*//'`
	argv[$j]="${arg}"
	i=$((i + 1))
done

./jan18012017-g1bonus.pl $prvadat ${argv[@]} # JES konecno ${argv[@]}! [@]!!!

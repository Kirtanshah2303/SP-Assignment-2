#!/bin/sh

for i in $(seq 1 8)
do
	for j in $(seq 1 8)
	do
		S=$(((i+j)%2))
		if [ $S -eq 0 ]
		then
			echo -n "■ "
		else
			echo -n "□ "
		fi
	done
	echo
	echo "" # new line
done
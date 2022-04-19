#!/bin/bash

Bytes=$(wc -c < $1)
Lines=$(wc -l < $1)
Words=$(wc -w < $1)

echo $Bytes
echo $Lines
echo $Words

i=1

i=1
Lines=$(wc -l < $1)

while [ $i -le $Lines ]
do

cline=$(head -n $i "$1" | tail -1)
lineCount=$(head -n $i "$1" | tail -1 | wc -w)
echo Line No: $i - Count of Words: $lineCount
let i+=1
done


# tr "[[:space:]&&~]" "\n" <$1 | sed 's/[[:punct:]]$//' | sort -f | uniq -ic > temp.txt

tr "[[:space:]&&~]" "\n" <$1 | sed 's/[[:punct:]]$//' | sort -f | uniq -ic > temp.txt
# tr "[[:space:]&&~]" "\n" <$1 | sed 's/[[:punct:]]$//' | cat -n | sort -uk2 | sort -n | cut -f2-
# | sed 's/[[:punct:]]$//' | sort -f | uniq -ic > temp.txt

sed '/[A-Za-z]/!d' temp.txt > temp1.txt
awk '{if ($1>1) print "Word -",$2,"Count of repetition:",$1}' temp1.txt
rm temp.txt temp1.txt


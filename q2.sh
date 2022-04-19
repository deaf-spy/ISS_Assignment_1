#!/bin/bash

firstRegex="~.*"
secondRegex=".*\~"
> author.txt
> quote.txt

cat author.txt | grep -o $firstRegex quotes2.txt | tr -d "~" | sed "s/^ *//g" > author.txt
cat quote.txt | grep -o $secondRegex quotes2.txt | rev | cut -c2- | cut -c2- | rev > quote.txt 


nl=$(wc -l < author.txt)
i=1
> speech.txt

while [ $i -le $nl ]
do

auth=$(head -n $i author.txt | tail -1)
quote=$(head -n $i quote.txt | tail -1)
echo $auth once said, "\"$quote\"" >> speech.txt
let i+=1

done

rm author.txt
rm quote.txt


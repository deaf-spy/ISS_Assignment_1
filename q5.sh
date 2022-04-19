#!/bin/bash

input=$1
length=$(echo $input | wc -c)
let length-=1
let length1=$((length/2))
echo $length
reversed=$(echo $input | perl -ne 'chomp; print scalar reverse;')


echo $reversed
ch=$(echo "$reversed" | tr "0-9a-zA-Z" "1-9a-zA-Za")
echo $ch

if [ $(($length % 2)) -eq 0 ]
then
first=$(echo ${input:0:$length1} | perl -ne 'chomp; print scalar reverse;')
echo $first${input:$length1:$length1}
else
echo "String is odd so cannot divide in half"
fi
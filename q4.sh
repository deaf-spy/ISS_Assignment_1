#!/bin/bash

csv=$1
csv+=,
num=0
array=()
length=${#csv}
for ((i=0; i<$length; i++ ))
do

ch=${csv:$i:1}
# echo $ch
if [ $ch == "," ]
then 
array+=($num)
let num=0
else
num=$(( $num*10 + $ch ))
fi

done


echo Before Sorted: ${array[@]}


# Bubble sort
for ((j=0; j<$length; j++ ))
do
for ((i=0; i<$length-j-1; i++ ))
do

if [[ ${array[i]} -gt ${array[$((i+1))]} ]]
then

temp=${array[i]}
array[$i]=${array[$((i+1))]}
array[$((i+1))]=$temp 

fi
done
done


echo After Sorted: ${array[@]}

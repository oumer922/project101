#!/bin/bash

echo "enter a number"
read num

result=0
i=0
while ((i * i <= num));
do
result=$i
((i++))
done
echo "square root of $num is $result"

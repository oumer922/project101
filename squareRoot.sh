#!/data/data/com.termux/files/usr/bin/bash

echo "enter a number"
read num
echo "square root of $a is.."
echo $((a))
a=$(bc <<< "scale=0; sqrt(($num))")

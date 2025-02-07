#!/bin/bash
size=5
echo "using seq"
#using seq
for i in $(seq 1 $size); do
    for  x in $(seq 1 $size); do
        echo -n "* "
    done
    echo ""
done
echo "--------------------------------------"
echo "using classic for"
#using classic for
for ((i=0 ;i<$size ; i++)); do
    for ((j=0 ;j<$size ; j++)) do
        echo -n "* "
    done
    echo ""
done

echo "--------------------------------------"
echo "using while loop"
#using while loop
i=0
while [ $i -lt $size ]; do
    j=0
    while [ $j -lt $size ]; do
        echo -n "* "
        j=$((j+1))
    done
    echo ""
    i=$((i+1))
done
echo "--------------------------------------"
echo "using until loop"
#using until loop
i=0
until [ $i -ge $size ]; do
    j=0
    until [ $j -ge $size ]; do
        echo -n "* "
        j=$((j+1))
    done
    echo ""
    i=$((i+1))
done


#!/bin/bash

## check swap space usage, decide if a certain amount of swap space is used
##
## needs to be adjusted to concrete scenario
##

total=$(cat /proc/swaps | grep -v Size | awk '{print $3}')
used=$(cat /proc/swaps | grep -v Size | awk '{print $4}')

pct=$(echo "scale=20;100/$total*$used" | bc)
pctint=$(printf "%.0f" $pct)

if [ $pctint -ge 50 ]
then
  echo "greater 50"
else
  echo "smaller 50"
fi


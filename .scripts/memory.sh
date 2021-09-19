#!/bin/sh

USED=$(free | awk '(NR==2) { print $3}')
TOTAL=$(free | awk '(NR==2) { print $2}')
echo -e "\x0e\x0b $(echo "round(($USED / $TOTAL) * 100)" | qalc -t | sed '3!d; s/\x1b\[[0-9;]*m//g' | cut -c 3-)%"

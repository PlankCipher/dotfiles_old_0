#!/bin/sh

BATTERY=$(cat /sys/class/power_supply/BAT0/capacity)

ICON=''
if [[ $BATTERY -gt 74 ]]; then
  ICON=''
elif [[ $BATTERY -gt 49 ]]; then
  ICON=''
elif [[ $BATTERY -gt 24 ]]; then
  ICON=''
else
  ICON=''
fi

echo -e "\x0d$ICON\x0b $BATTERY%"

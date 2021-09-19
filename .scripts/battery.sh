#!/bin/sh

CAPACITY=$(cat /sys/class/power_supply/BAT0/capacity)
STATUS=$(cat /sys/class/power_supply/BAT0/status)

ICON=''
if [[ "$STATUS" == 'Charging' ]]; then
  ICON=''
else
  if [[ $CAPACITY -gt 74 ]]; then
    ICON=''
  elif [[ $CAPACITY -gt 49 ]]; then
    ICON=''
  elif [[ $CAPACITY -gt 24 ]]; then
    ICON=''
  else
    ICON=''
  fi

  if [[ $CAPACITY -le 15 ]]; then
    notify-send -a 'Battery' "Battery is very low ($CAPACITY%). Plug the charger."
  fi
fi

echo -e "\x0d$ICON\x0b $CAPACITY%"

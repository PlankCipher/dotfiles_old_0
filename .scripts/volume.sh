#!/bin/sh

get_volume () {
  INFO=$(pacmd list-sinks | grep "state\: RUNNING" -B4 -A7 | grep "volume: \(front\|mono\)\|muted:")
  VOL=$(echo "$INFO" | grep -o "[0-9]*%" | head -1 | sed 's/%//')
  MUTED=$(echo "$INFO" | awk '/muted:/ { print $2 }')

  ICON=''
  TEXT=''
  if [[ $MUTED == 'yes' ]]; then
    ICON=''
    TEXT='muted'
  else
    if [[ $VOL -gt 65 ]]; then
      ICON=''
    elif [[ $VOL -gt 32 ]]; then
      ICON=''
    else
      ICON=''
    fi

    TEXT="$VOL%"
  fi

  echo -e "\x0d$ICON\x0b $VOL"
}

case $1 in
  1)
    pactl set-sink-mute @DEFAULT_SINK@ toggle
    sigdwmblocks 3
    ;;

  *)
    get_volume
    ;;
esac

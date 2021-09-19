#!/bin/sh

get_volume () {
  DEFAULT_SINK_NAME=$(pacmd stat | sed '/Default sink name/ !d' | awk '{ print $4 }')
  INFO=$(pacmd list-sinks | sed -E "/name: <$DEFAULT_SINK_NAME>/,/muted:/ !d; /(^\s*volume:)|(^\s*muted:)/ !d")
  VOL=$(echo "$INFO" | awk '{ print $5 }' | sed 's/%//')
  MUTED=$(echo "$INFO" | awk 'NR==2 { print $2 }')

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

  echo -e "\x0f$ICON\x0b $TEXT"
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

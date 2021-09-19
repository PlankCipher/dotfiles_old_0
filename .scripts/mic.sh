#!/bin/sh

# Uses amixer to get current status of mic
# and output an icon and text to be interpreted
# by polybar or just toggles the mic

get_status () {
  DEFAULT_SOURCE_NAME=$(pacmd stat | sed '/Default source name/ !d' | awk '{ print $4 }')
  MUTED=$(pacmd list-sources | sed -E "/name: <$DEFAULT_SOURCE_NAME>/,/muted:/ !d; /^\s*muted:/ !d" | awk '{ print $2 }')

  STATUS='On'
  ICON=''
  if [[ "$MUTED" == 'yes' ]]; then
    STATUS='Off'
    ICON=''
  fi

  echo -e "\x10$ICON\x0b $STATUS"
}


case $1 in
  1 | toggle)
    pactl set-source-mute @DEFAULT_SOURCE@ toggle
    sigdwmblocks 4
    ;;

  *)
    get_status
    ;;
esac

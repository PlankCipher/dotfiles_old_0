#!/bin/sh

# Uses amixer to get current status of mic
# and output an icon and text to be interpreted
# by polybar or just toggles the mic

get_status () {
  FRONT_RIGHT_STATUS=$(amixer sget Capture | awk '/Front Right:/ { print $7 }' | cut -d '[' -f 2 | cut -d ']' -f 1)
  FRONT_LEFT_STATUS=$(amixer sget Capture | awk '/Front Left:/ { print $7 }' | cut -d '[' -f 2 | cut -d ']' -f 1)

  STATUS="N/A"
  MIC_ICON="N/A"
  if [ $FRONT_RIGHT_STATUS == $FRONT_LEFT_STATUS ]; then
    if [ $FRONT_RIGHT_STATUS == "off" ]; then
      MIC_ICON=""
    else
      MIC_ICON=""
    fi

    STATUS="$FRONT_RIGHT_STATUS"
  else
    MIC_ICON=""
    STATUS="${FRONT_LEFT_STATUS^} ${FRONT_RIGHT_STATUS^}"
  fi

  echo -e "\x0e$MIC_ICON\x0b ${STATUS^}"
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

#!/bin/sh

case $1 in
  1)
    notify-send -a 'Date' "$(date +%d-%m-%Y)"
    ;;

  *)
    echo -e "\x0c\x0b $(date +%H:%M)"
    ;;
esac

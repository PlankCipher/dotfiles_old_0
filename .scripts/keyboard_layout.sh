#!/bin/sh

LAYOUT=$(xset -q | grep LED | awk '{ print $10 }')

case $LAYOUT in
  00000000)
    echo 'us'
    ;;

  00001000)
    echo 'ara'
    ;;
esac

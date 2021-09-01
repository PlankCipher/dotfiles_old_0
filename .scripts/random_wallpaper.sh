#!/bin/sh

WALLS_NUM=$(ls $HOME/.config/wallpapers/ | wc -l)
$HOME/.scripts/set_bg.sh $HOME/.config/wallpapers/$(shuf -i 0-$(( $WALLS_NUM - 1 )) -n 1).*

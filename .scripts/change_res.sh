#!/bin/sh

OUTPUT_NAME=$(xrandr | grep -Po '.+(?=\sconnected)')
SCALEX=$(echo '1600/1366' | node -p)
SCALEY=$(echo '900/768' | node -p)

xrandr --output $OUTPUT_NAME --mode 1366x768 --panning 1600x900 --scale "$SCALEX"x"$SCALEY"

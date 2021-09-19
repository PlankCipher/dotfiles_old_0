#!/bin/sh

xrandr | grep "HDMI1 connected"
EXIT_CODE=$?
if [[ $EXIT_CODE -eq 0 ]]; then
  ~/.scripts/dual_monitor.sh
fi

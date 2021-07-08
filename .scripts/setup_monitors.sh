#!/bin/sh

xrandr | grep "HDMI1 connected"
EXIT_CODE=$?
if [[ $EXIT_CODE -ne 0 ]]; then
  ~/.scripts/change_res.sh
else
  ~/.scripts/dual_monitor.sh
fi

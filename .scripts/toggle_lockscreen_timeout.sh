#!/bin/sh

toggle_lockscreen_timeout () {
  pgrep xautolock > /dev/null

  # If the previous command exited with non-zero
  # status, then no xautolock process running
  if [[ $? -ne 0 ]]; then
    xautolock -time 1 -locker "$HOME/.scripts/i3lock_fancy_multimonitor/lock -n -p -g" &
  else
    killall -9 xautolock > /dev/null
  fi
}

get_timeout () {
  pgrep xautolock > /dev/null

  if [[ $? -ne 0 ]]; then
    echo -e "\x0c\x0b Off"
  else
    echo -e "\x0c\x0b On"
  fi
}

case $1 in
  1 | toggle)
    toggle_lockscreen_timeout && sigdwmblocks 1
    ;;

  *)
    get_timeout
    ;;
esac

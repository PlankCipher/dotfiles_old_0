#!/bin/sh

toggle_lockscreen_timeout () {
  pgrep xautolock > /dev/null

  # If the previous command exited with a non-zero
  # status, then no xautolock process is running
  if [[ $? -ne 0 ]]; then
    xautolock -time 1 -locker "$HOME/.scripts/i3lock_fancy_multimonitor/lock -n -p -g" &
  else
    TIMEOUT=$(ps xo args | grep xautolock | grep -v grep | cut -d ' ' -f 3)

    case $TIMEOUT in
      1)
        killall -9 xautolock > /dev/null
        xautolock -time 5 -locker "$HOME/.scripts/i3lock_fancy_multimonitor/lock -n -p -g" &
        ;;

      5)
        killall -9 xautolock > /dev/null
        xautolock -time 10 -locker "$HOME/.scripts/i3lock_fancy_multimonitor/lock -n -p -g" &
        ;;

      10)
        killall -9 xautolock > /dev/null
        xautolock -time 30 -locker "$HOME/.scripts/i3lock_fancy_multimonitor/lock -n -p -g" &
        ;;

      30)
        killall -9 xautolock > /dev/null
        ;;
    esac
  fi
}

get_timeout () {
  pgrep xautolock > /dev/null

  if [[ $? -ne 0 ]]; then
    echo -e "\x0d\x0b Off"
  else
    echo -e "\x0d\x0b $(ps xo args | grep xautolock | grep -v grep | cut -d ' ' -f 3)m"
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

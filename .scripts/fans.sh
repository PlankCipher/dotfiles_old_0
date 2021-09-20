#!/bin/sh

CPU_FAN=$(echo "scale=2; $(sensors | grep 'Processor Fan' | awk '{ print $3 }') / 1000" | bc)
GPU_FAN=$(echo "scale=2; $(sensors | grep 'Video Fan' | awk '{ print $3 }') / 1000" | bc)
BOOSTED=false

# Gameshift mode (fans at BOOST speed)
if (( $(echo "$CPU_FAN >= 5" | bc) )) && (( $(echo "$GPU_FAN >= 5" | bc) )); then
  BOOSTED=true
fi

get_status () {
  OUTPUT="\x0d\x0b $CPU_FAN"
  if (( $(echo "$CPU_FAN >= 1.0" | bc) )); then
    OUTPUT+="K"
  fi

  OUTPUT+=" $GPU_FAN"
  if (( $(echo "$GPU_FAN >= 1.0" | bc) )); then
    OUTPUT+="K"
  fi

  if $BOOSTED; then
    OUTPUT+=' (G)'
  fi

  echo -e $OUTPUT
}

toggle () {
  if $BOOSTED; then
    sudo dell-g5se-fanctl.py
  else
    sudo killall dell-g5se-fanctl.py
    sudo dell-g5se-fanctl -b
  fi
}

case $1 in
  toggle)
    toggle
    ;;

  *)
    get_status
    ;;
esac

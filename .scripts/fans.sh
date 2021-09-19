#!/bin/sh

CPU_FAN=$(echo "scale=2; $(sensors | grep 'Processor Fan' | awk '{ print $3 }') / 1000" | bc)
GPU_FAN=$(echo "scale=2; $(sensors | grep 'Video Fan' | awk '{ print $3 }') / 1000" | bc)

OUTPUT="\x0d\x0b $CPU_FAN"
if (( $(echo "$CPU_FAN >= 1.0" | bc) )); then
  OUTPUT+="K"
fi

OUTPUT+=" $GPU_FAN"

if (( $(echo "$GPU_FAN >= 1.0" | bc) )); then
  OUTPUT+="K"
fi

# Gameshift mode (fans at BOOST speed)
if (( $(echo "$CPU_FAN >= 5" | bc) )) && (( $(echo "$GPU_FAN >= 5" | bc) )); then
  OUTPUT+=' (G)'
fi

echo -e $OUTPUT

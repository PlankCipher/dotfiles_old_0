#!/bin/sh

OUTPUT=""

DEVICES=$(hcitool dev)
if [[ $(echo "$DEVICES" | wc -l) -gt 1 ]]; then
  OUTPUT="On"
  CONNECTIONS=$(hcitool con)
  if [[ $(echo "$CONNECTIONS" | wc -l) -gt 1 ]]; then
    CONN_INFO=$(bluetoothctl -- info $(echo "$CONNECTIONS" | awk 'NR==2{ print $3 }'))
    NAME=$(echo "$CONN_INFO" | grep Name)
    FOUND=$?
    if [[ $FOUND -eq 0 ]]; then
      OUTPUT=$(echo "$NAME" | cut -d ' ' -f 2-)
    else
      ALIAS=$(echo "$CONN_INFO" | grep Alias)
      FOUND=$?
      if [[ $FOUND -eq 0 ]]; then
        OUTPUT=$(echo "$ALIAS" | cut -d ' ' -f 2-)
      fi
    fi
  fi
else
  OUTPUT="\x11Off\x0b"
fi

OUTPUT_TRUNC=$(echo "$OUTPUT" | cut -c -11 | sed 's/ $//')

if [[ "$OUTPUT_TRUNC" != "$OUTPUT" ]]; then
  OUTPUT="$OUTPUT_TRUNC..."
fi

echo -e "\x10\x0b $OUTPUT"

#!/bin/sh

EMOJI=$(awk -F '\t' '{ print $1 " " $4 " (" $5 ") [" $2 " / " $3 "]"}' $HOME/.scripts/dmenu/dmenu_emoji/all_emojis.txt | dmenu -p 'Emoji:' -l 15)

EXIT_CODE=$?
if [[ $EXIT_CODE -ne 0 ]]; then
  exit $EXIT_CODE
fi

EMOJI=$(echo -n "$EMOJI" | awk '{ print $1 }')
echo -n "$EMOJI" | xclip -sel c
notify-send -a 'dmenu_emoji' "$EMOJI was copied to your clipboard"

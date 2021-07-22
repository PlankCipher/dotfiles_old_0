#!/bin/sh

# Simple script to change playing song
# using a dmenu

NEXT_SONG="$(mpc listall | dmenu -p 'Play:' -i -l 15)"

# Avoid playing next song if the previous
# command exited with a non zero exit code
# in case rofi was closed without choosing anything
EXIT_CODE=$?
if [ $EXIT_CODE -ne 0 ]; then
  exit $EXIT_CODE
fi

# Get next song's position in the playlist
# (if exists) and play it
POSITION=1
mpc listall | while read -r SONG; do
  if [[ "$SONG" == "$NEXT_SONG" ]]; then
    mpc play $POSITION && sigdwmblocks 6
    break
  else
    POSITION=$((POSITION + 1))
  fi
done

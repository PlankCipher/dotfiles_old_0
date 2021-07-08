#!/bin/sh

run () {
  if [[ $1 ]]; then
    INPUT=$(echo "$1" | dmenu -p 'Calculate:' -l 15)
    exit_on_esc
    RESULT=$(echo "$INPUT" | qalc | sed '3!d; s/\x1b\[[0-9;]*m//g' | cut -c 3-)
    run "$RESULT"
  else
    INPUT=$(printf '%s' | dmenu -p 'Calculate:' -l 15)
    exit_on_esc
    RESULT=$(echo "$INPUT" | qalc | sed '3!d; s/\x1b\[[0-9;]*m//g' | cut -c 3-)
    run "$RESULT"
  fi
}

exit_on_esc () {
  EXIT_CODE=$?
  if [[ $EXIT_CODE -ne 0 ]]; then
    exit $EXIT_CODE
  fi
}

run

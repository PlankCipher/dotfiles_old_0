#!/bin/sh

USAGE=$($HOME/.scripts/cpu.sh -d 0)
echo -e "\x10\x0b $USAGE"

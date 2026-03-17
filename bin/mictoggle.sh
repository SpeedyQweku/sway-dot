#!/usr/bin/env bash

pactl set-source-mute @DEFAULT_SOURCE@ toggle

MUTED=$(pactl get-source-mute @DEFAULT_SOURCE@ | awk '{print $2}')

if [ "$MUTED" = "yes" ]; then
    dunstify -a "Microphone" -r 91190 -u normal \
    -h string:x-dunst-stack-tag:mic \
    "󰍭  Mic Muted"
else
    dunstify -a "Microphone" -r 91190 -u normal \
    -h string:x-dunst-stack-tag:mic \
    "󰍬  Mic Active"
fi

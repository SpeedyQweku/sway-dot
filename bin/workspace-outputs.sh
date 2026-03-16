#!/usr/bin/env bash

# Get first connected output that isn't eDP-1
EXTERNAL=$(swaymsg -t get_outputs | jq -r '.[] | select(.name != "eDP-1") | select(.active == true) | .name' | head -1)

if [[ -n "$EXTERNAL" ]]; then
    swaymsg "workspace 10, move workspace to output $EXTERNAL"
fi

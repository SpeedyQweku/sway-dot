#!/bin/bash


STATE_FILE="$HOME/.cache/dnd_state"


enable_dnd() {
    dunstify -r 91190 "   DND Enabled" && sleep 1
    dunstctl set-paused true
    touch "$STATE_FILE"  # Create the file
}

disable_dnd() {
    dunstctl close-all
    dunstctl set-paused false
    dunstify -r 91190 "   DND Disabled"
    rm -f "$STATE_FILE"  # Remove the file
}

if [ "$(dunstctl is-paused)" = "false" ]; then
    enable_dnd
else
    disable_dnd
fi
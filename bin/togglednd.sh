#!/bin/bash


mute_apps() {
    pactl list sink-inputs | awk '/^Sink Input #/{id=$3} /application.process.binary.*(Discord|telegram-desktop)/{print id}' | tr -d '#' | while read idx; do
        pactl set-sink-input-mute "$idx" "$1"
    done
}

if dunstctl is-paused | grep -q false; then
    dunstify -a "Do Not Disturb" -r 91190 -u critical \
    -h string:x-dunst-stack-tag:dnd \
    " Do Not Disturb Enabled"
    sleep 0.5
    dunstctl set-paused true
    mute_apps 1
    # echo ""
else
    dunstctl set-paused false
    mute_apps 0
    dunstify -a "Do Not Disturb" -r 91190 -u normal \
    -h string:x-dunst-stack-tag:dnd \
    " Do Not Disturb Disabled"
    # echo ""
fi


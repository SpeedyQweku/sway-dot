#!/usr/bin/env bash

TOUCHPAD="1267:12795:ASUE120D:00_04F3:31FB_Touchpad"

STATUS=$(swaymsg -t get_inputs | jq -r ".[] | select(.identifier==\"$TOUCHPAD\") | .libinput.send_events")

if [[ "$STATUS" == "enabled" ]]; then
    swaymsg input "$TOUCHPAD" events disabled
    dunstify "Touchpad" "Disabled" -i input-touchpad-off
else
    swaymsg input "$TOUCHPAD" events enabled
    dunstify "Touchpad" "Enabled" -i input-touchpad
fi

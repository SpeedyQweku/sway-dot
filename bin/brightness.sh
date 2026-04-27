#!/usr/bin/env bash

# Requirements:
#   - brightnessctl
#   - libnotify (notify-send)

STEP=1  # percentage

get_brightness() {
    # returns brightness percentage
    brightnessctl -m | awk -F, '{print $4}' | sed 's/%//'
}

send_notification() {
    brightness=$(get_brightness)
    notify-send -a "Brightness" -r 91191 -u low " Brightness: ${brightness}%"
}

case "$1" in
    up)
        brightnessctl set +${STEP}%
        ;;
    down)
        brightnessctl set ${STEP}%-
        ;;
    *)
        echo "Usage: $0 {up|down}"
        exit 1
        ;;
esac

send_notification


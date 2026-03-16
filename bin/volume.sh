#!/usr/bin/env bash

STEP=5

get_volume() {
    pamixer --get-volume
}

is_muted() {
    pamixer --get-mute
}

send_notification() {
    volume=$(get_volume)
    muted=$(is_muted)
    if [ "$muted" = "true" ]; then
        dunstify -a "Volume" -r 91190 -u low -h string:x-dunst-stack-tag:volume "󰖁 Muted"
    else
        dunstify -a "Volume" -r 91190 -u low -h string:x-dunst-stack-tag:volume \
            -h int:value:"$volume" "󰕾 Volume: ${volume}%"
    fi
}

# Set default sink to Bluetooth if connected
BT_SINK=$(pactl list sinks short | grep -i bluez | awk '{print $2}' | head -1)
if [[ -n "$BT_SINK" ]]; then
    pactl set-default-sink "$BT_SINK"
fi

case "$1" in
    up)
        pamixer --increase $STEP
        ;;
    down)
        pamixer --decrease $STEP
        ;;
    toggle)
        pamixer --toggle-mute
        ;;
    *)
        echo "Usage: $0 {up|down|toggle}"
        exit 1
        ;;
esac

send_notification

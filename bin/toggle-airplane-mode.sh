#!/usr/bin/env bash


NOTIFY_ID=9999  # Fixed ID so notifications replace each other

wifi_status=$(nmcli radio wifi)

if [[ "$wifi_status" == "enabled" ]]; then
    nmcli radio all off
    rfkill block bluetooth
    dunstify -u normal -r "$NOTIFY_ID" -i airplane-mode-symbolic \
        "Airplane Mode" "ON — all radios disabled"
else
    nmcli radio all on
    rfkill unblock bluetooth
    dunstify -u normal -r "$NOTIFY_ID" -i network-wireless-symbolic \
        "Airplane Mode" "OFF — all radios enabled"
fi
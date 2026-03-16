#!/usr/bin/env bash

# Check current status of Wi-Fi and WWAN
STATUS=$(nmcli radio all | awk 'NR==2 {print $2}')

if [[ "$STATUS" == "enabled" ]]; then
    nmcli radio all off
    echo "Airplane mode: ON"
else
    nmcli radio all on
    echo "Airplane mode: OFF"
fi


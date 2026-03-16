#!/usr/bin/env bash

# Usage: ./leds_control.sh high
#        ./leds_control.sh low

TARGET="$1"

if [[ "$TARGET" != "high" && "$TARGET" != "low" ]]; then
    echo "Usage: $0 <high|low>"
    exit 1
fi

# Function to get current brightness in lowercase
get_brightness() {
    asusctl leds get | awk '{print tolower($5)}'
}

CURRENT=$(get_brightness)

# Loop until we reach the target
while [[ "$CURRENT" != "$TARGET" ]]; do
    if [[ "$TARGET" == "high" ]]; then
        asusctl leds next   # increase brightness
    else
        asusctl leds prev   # decrease brightness
    fi
    sleep 0.1             # small delay to avoid spamming
    CURRENT=$(get_brightness)
done

echo "Keyboard brightness set to $TARGET"


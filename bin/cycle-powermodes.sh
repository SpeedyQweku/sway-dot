#!/usr/bin/env bash
# File: cycle-powermodes.sh
# Cycles through ASUS profiles and sends a Dunst notification

PROFILES=("Quiet" "Balanced" "Performance")

# Get current active profile (from first line only)
CURRENT=$(asusctl profile get | head -n1 | awk '{print $3}')

# Find index of current profile
INDEX=0
for i in "${!PROFILES[@]}"; do
    if [[ "${PROFILES[$i]}" == "$CURRENT" ]]; then
        INDEX=$i
        break
    fi
done

# Compute next profile (cycle)
NEXT_INDEX=$(( (INDEX + 1) % ${#PROFILES[@]} ))
NEXT_PROFILE=${PROFILES[$NEXT_INDEX]}

# Set the next profile
asusctl profile set "$NEXT_PROFILE"

if [[ $? -eq 0 ]]; then
    notify-send "ASUS Profile" "Switched to $NEXT_PROFILE mode" -i preferences-system-performance
else
    notify-send "ASUS Profile" "Failed to switch profile" -u critical
fi


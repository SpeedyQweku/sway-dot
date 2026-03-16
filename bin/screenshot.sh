#!/bin/bash
case $1 in
    full)
        FILE=~/Pictures/Screenshots/$(date +'%Y-%m-%d-%H%M%S.png')
        grim "$FILE"
        notify-send "Screenshot" "Full screen captured"
        swappy -f "$FILE" &
        ;;
    select)
        FILE=~/Pictures/Screenshots/$(date +'%Y-%m-%d-%H%M%S.png')
        grim -g "$(slurp)" "$FILE"
        notify-send "Screenshot" "Selection captured"
        swappy -f "$FILE" &
        ;;
    window)
        FILE=~/Pictures/Screenshots/$(date +'%Y-%m-%d-%H%M%S.png')
        WINDOW_GEOMETRY=$(swaymsg -t get_tree | jq -r '.. | objects | select(.focused==true) | "\(.rect.x),\(.rect.y) \(.rect.width)x\(.rect.height)"' | head -1)
        if [ -z "$WINDOW_GEOMETRY" ]; then
            notify-send "Screenshot" "Error: Could not get window geometry"
            exit 1
        fi
        grim -g "$WINDOW_GEOMETRY" "$FILE"
        notify-send "Screenshot" "Window captured"
        swappy -f "$FILE" &
        ;;
    clipboard)
        grim -g "$(slurp)" - | wl-copy
        notify-send "Screenshot" "Copied to clipboard"
        ;;
esac

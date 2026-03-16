#!/usr/bin/env bash

MAIN="eDP-1"

EXTERNAL=$(swaymsg -t get_outputs | jq -r '.[].name' | grep -v "$MAIN" | head -1)

if [[ -z "$EXTERNAL" ]]; then
    dunstify "Display" "No external monitor detected" -u normal
    exit 1
fi

# Write CSS to temp file
CSS=$(mktemp /tmp/wofi-monitor-XXXXXX.css)
cat > "$CSS" <<'EOF'
* {
    font-family: "JetBrains Mono";
    font-size: 12px;
}
window {
    background-color: #0d0d0d;
    border: 1px solid #e5001c;
    border-radius: 0px;
}
#input {
    background-color: #0d0d0d;
    color: #e0e0e0;
    border: none;
    border-bottom: 1px solid #e5001c;
    padding: 8px 12px;
}
#inner-box {
    background-color: #0d0d0d;
}
#entry {
    padding: 6px 12px;
    color: #888888;
}
#entry:selected {
    background-color: #1a0000;
    color: #ffffff;
}
EOF

CHOICE=$(printf "󰍜  left\n󰍛  right\n󰍙  above\n󰍚  below\n󰍪  mirror\n󰍫  disconnect" | wofi \
    --show dmenu \
    --prompt "  Display" \
    --width 250 \
    --height 230 \
    --lines 6 \
    --style "$CSS")

rm -f "$CSS"

CHOICE=$(echo "$CHOICE" | awk '{print $NF}')

case "$CHOICE" in
    left)
        swaymsg output "$EXTERNAL" enable position 0 0
        EXT_WIDTH=$(swaymsg -t get_outputs | jq -r ".[] | select(.name==\"$EXTERNAL\") | .current_mode.width")
        swaymsg output "$MAIN" position "$EXT_WIDTH" 0
        ;;
    right)
        MAIN_WIDTH=$(swaymsg -t get_outputs | jq -r ".[] | select(.name==\"$MAIN\") | .current_mode.width")
        swaymsg output "$EXTERNAL" enable position "$MAIN_WIDTH" 0
        swaymsg output "$MAIN" position 0 0
        ;;
    above)
        EXT_HEIGHT=$(swaymsg -t get_outputs | jq -r ".[] | select(.name==\"$EXTERNAL\") | .current_mode.height")
        swaymsg output "$EXTERNAL" enable position 0 0
        swaymsg output "$MAIN" position 0 "$EXT_HEIGHT"
        ;;
    below)
        MAIN_HEIGHT=$(swaymsg -t get_outputs | jq -r ".[] | select(.name==\"$MAIN\") | .current_mode.height")
        swaymsg output "$EXTERNAL" enable position 0 "$MAIN_HEIGHT"
        swaymsg output "$MAIN" position 0 0
        ;;
    mirror)
        swaymsg output "$EXTERNAL" enable same-as "$MAIN"
        ;;
    disconnect)
        swaymsg output "$EXTERNAL" disable
        ;;
esac

[[ -n "$CHOICE" ]] && dunstify "Display" "$EXTERNAL → $CHOICE" -u normal

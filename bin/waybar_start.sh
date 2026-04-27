#!/usr/bin/env bash

# Kill existing waybar instances if they exist
if pgrep -x waybar > /dev/null; then
    pkill -x waybar
fi

# Start a new waybar instance
# In .config/sway/config
waybar -c ~/.config/sway/waybar/config -s ~/.config/sway/waybar/style.css

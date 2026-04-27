#!/bin/bash

app_id=$(swaymsg -t get_tree | jq -r '.. | select(.focused? == true and .type? == "con") | .app_id // empty' 2>/dev/null | head -n1)

# Fallback for XWayland apps that have no app_id
if [ -z "$app_id" ]; then
    app_id=$(swaymsg -t get_tree | jq -r '.. | select(.focused? == true and .type? == "con") | .window_properties.class // empty' 2>/dev/null | head -n1)
fi

# Clean up common ugly names
case "$app_id" in
    org.telegram.desktop) app_id="Telegram" ;;
    google-chrome|google-chrome-stable) app_id="Chrome" ;;
    chromium) app_id="Chromium" ;;
    org.mozilla.firefox|firefox) app_id="Firefox" ;;
    code|code-oss) app_id="VS Code" ;;
    com.obsproject.Studio) app_id="OBS" ;;
    thunar) app_id="Files" ;;
    com.spotify.Client|spotify) app_id="Spotify" ;;
    discord) app_id="Discord" ;;
    mpv) app_id="MPV" ;;
    vlc) app_id="VLC" ;;
    org.qbittorrent.qBittorrent) app_id="qBittorrent" ;;
    steam) app_id="Steam" ;;
    obsidian) app_id="Obsidian" ;;
    null|"") app_id="" ;;
esac

echo "$app_id"
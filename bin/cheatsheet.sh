#!/usr/bin/env bash

CSS=$(mktemp /tmp/wofi-cheat-XXXXXX.css)
cat > "$CSS" << 'EOF'
* { font-family: "JetBrains Mono"; font-size: 12px; }
window { background-color: #0d0d0d; border: 1px solid #e5001c; border-radius: 0px; }
#input { background-color: #0d0d0d; color: #e0e0e0; border: none; border-bottom: 1px solid #e5001c; padding: 8px 12px; }
#inner-box { background-color: #0d0d0d; }
#entry { padding: 6px 12px; color: #888888; }
#entry:selected { background-color: #1a0000; color: #ffffff; }
EOF

CHOICE=$(printf "neovim\ntmux\nsway" | wofi \
    --show dmenu \
    --prompt "  Cheatsheet" \
    --width 250 \
    --height 120 \
    --lines 3 \
    --style "$CSS")

rm -f "$CSS"

[[ -z "$CHOICE" ]] && exit 0

alacritty \
    --title cheatsheet \
    --option "window.dimensions.columns=80" \
    --option "window.dimensions.lines=30" \
    -e glow -p ~/.config/sway/bin/cheatsheet/$CHOICE.md

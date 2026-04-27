#!/bin/bash

if pkill -f "yad --calendar" 2>/dev/null; then
    exit 0
fi

yad --calendar \
    --undecorated \
    --fixed \
    --close-on-unfocus \
    --no-buttons \
    --width=300 \
    --height=200 \
    --title="calendar" \
    --on-top \
    2>/dev/null &

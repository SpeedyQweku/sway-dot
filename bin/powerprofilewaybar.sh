#!/bin/bash

profile=$(asusctl profile get 2>/dev/null | grep "Active" | awk -F': ' '{print $2}' | tr -d '[:space:]')


case "$profile" in
    Performance)
        icon=""
        label="P"
        ;;
    Balanced)
        icon=""
        label="B"
        ;;
    Quiet)
        icon=""
        label="Q"
        ;;
    *)
        icon=""
        label="Unknown"
        ;;
esac

echo "{\"text\": \"$icon $label\", \"class\": \"$profile\"}"
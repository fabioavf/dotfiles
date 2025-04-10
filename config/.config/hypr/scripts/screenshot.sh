#!/bin/bash
# Usage: screenshot.sh [region|full]

case "$1" in
    region)
        grim -g "$(slurp)" - | wl-copy
        notify-send "Screenshot" "Region copied to clipboard"
        ;;
    full)
        grim - | wl-copy
        notify-send "Screenshot" "Full screen copied to clipboard"
        ;;
    *)
        echo "Usage: screenshot.sh [region|full]"
        exit 1
        ;;
esac

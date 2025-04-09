#!/bin/bash

# Get the current keyboard layout
get_layout() {
    hyprctl getoption input:kb_layout -j | jq -r '.str'
}

# Function to create JSON output for waybar
create_output() {
    layout=$(get_layout)

    if [[ "$layout" == "us" ]]; then
        echo '{"text": "🇺🇸 EN", "tooltip": "Current layout: US English", "class": "en"}'
    elif [[ "$layout" == "us(intl)" || "$layout" == "us intl" ]]; then
        echo '{"text": "🌐 INTL", "tooltip": "Current layout: US International", "class": "intl"}'
    else
        echo '{"text": "⌨️ '"$layout"'", "tooltip": "Current layout: '"$layout"'", "class": "other"}'
    fi
}

# Toggle between layouts
if [[ "$1" == "toggle" ]]; then
    current=$(get_layout)

    if [[ "$current" == "us" ]]; then
        hyprctl keyword input:kb_layout "us(intl)"
    else
        hyprctl keyword input:kb_layout "us"
    fi

    # Output the new status after a short delay to ensure it's updated
    sleep 0.1
    create_output
    exit 0
fi

# Default output (current status)
create_output

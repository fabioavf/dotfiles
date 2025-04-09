#!/bin/bash

HOSTNAME=$(hostname)
CONFIG_DIR="$HOME/.config/waybar"

if [ "$HOSTNAME" = "fabioEndeavour" ]; then
    CONFIG_FILE="$CONFIG_DIR/config-pc.jsonc"
elif [ "$HOSTNAME" = "fabiosMacbook" ]; then
    CONFIG_FILE="$CONFIG_DIR/config-macbook.jsonc"
else
    CONFIG_FILE="$CONFIG_DIR/config.jsonc"
fi

# Kill any existing Waybar instance
pkill waybar

# Launch Waybar with the selected config and style
echo "Launching Waybar on $HOSTNAME with config: $CONFIG_FILE"
exec waybar -c "$CONFIG_FILE" -s "$HOME/.config/waybar/style.css"

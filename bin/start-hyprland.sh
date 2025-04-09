#!/bin/bash
HOSTNAME=$(hostname)
CONFIG_DIR="/home/fabio/.config/hypr"

if [ "$HOSTNAME" = "fabioEndeavour" ]; then
    ln -sf "$CONFIG_DIR/hyprland-pc.conf" "$CONFIG_DIR/machine-specific.conf"
elif [ "$HOSTNAME" = "fabiosMacbook" ]; then
    ln -sf "$CONFIG_DIR/hyprland-macbook.conf" "$CONFIG_DIR/machine-specific.conf"
else
    ln -sf "$CONFIG_DIR/hyprland-default.conf" "$CONFIG_DIR/machine-specific.conf"
fi

exec Hyprland

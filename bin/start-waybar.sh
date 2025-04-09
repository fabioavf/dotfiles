#!/bin/bash
set -e  # Exit immediately if a command exits with non-zero status

HOSTNAME=$(hostname)
CONFIG_DIR="$HOME/.config/waybar"
LOG_FILE="/tmp/waybar-debug.log"

echo "Starting Waybar script on $HOSTNAME" > $LOG_FILE

# Check if config directory exists
if [ ! -d "$CONFIG_DIR" ]; then
    echo "Error: Config directory $CONFIG_DIR does not exist" >> $LOG_FILE
    exit 1
fi

# Set config files based on hostname
if [ "$HOSTNAME" = "fabioEndeavour" ]; then
    CONFIG_FILE="$CONFIG_DIR/config-pc.jsonc"
    STYLE_FILE="$CONFIG_DIR/style.css"
elif [ "$HOSTNAME" = "fabiosMacbook" ]; then
    CONFIG_FILE="$CONFIG_DIR/config-macbook.jsonc"
    STYLE_FILE="$CONFIG_DIR/style.css"
else
    CONFIG_FILE="$CONFIG_DIR/config.jsonc"
    STYLE_FILE="$CONFIG_DIR/style.css"
fi

# Check if config files exist
if [ ! -f "$CONFIG_FILE" ]; then
    echo "Error: Config file $CONFIG_FILE does not exist" >> $LOG_FILE
    exit 1
fi

if [ ! -f "$STYLE_FILE" ]; then
    echo "Error: Style file $STYLE_FILE does not exist" >> $LOG_FILE
    exit 1
fi

echo "Config file: $CONFIG_FILE" >> $LOG_FILE
echo "Style file: $STYLE_FILE" >> $LOG_FILE

# Check if Waybar is running before killing
if pgrep waybar > /dev/null; then
    echo "Killing existing Waybar..." >> $LOG_FILE
    pkill waybar || echo "Failed to kill Waybar (error $?)" >> $LOG_FILE
    sleep 1  # Wait a bit longer for shutdown
    echo "Waybar killed" >> $LOG_FILE
else
    echo "No existing Waybar instance found" >> $LOG_FILE
fi

# Check if waybar command exists
if ! command -v waybar &> /dev/null; then
    echo "Error: waybar command not found" >> $LOG_FILE
    exit 1
fi

echo "Launching Waybar..." >> $LOG_FILE
# Use nohup to ensure it keeps running even if the terminal closes
nohup waybar -c "$CONFIG_FILE" -s "$STYLE_FILE" >> $LOG_FILE 2>&1 &
WAYBAR_PID=$!

# Check if waybar process is actually running
if ps -p $WAYBAR_PID > /dev/null; then
    echo "Waybar launched with PID $WAYBAR_PID" >> $LOG_FILE
    disown $WAYBAR_PID
    echo "Script completed successfully" >> $LOG_FILE
else
    echo "Error: Failed to start Waybar" >> $LOG_FILE
    exit 1
fi

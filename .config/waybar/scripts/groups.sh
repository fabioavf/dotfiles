#!/bin/bash
# Create this file as ~/.config/waybar/scripts/groups.sh

# Create the necessary directories for the scripts
mkdir -p ~/.config/waybar/scripts

# Improved keyboard-layout.sh script
cat > ~/.config/waybar/scripts/keyboard-layout.sh << 'EOF'
#!/bin/bash

# Get the current keyboard layout
get_layout() {
    layout=$(hyprctl devices -j | jq -r '.keyboards[] | select(.name | contains("keyboard")) | .active_keymap')
    if [[ "$layout" == *"us"* ]]; then
        echo "en"
    else
        echo "intl"
    fi
}

# Toggle between US and your secondary layout
toggle_layout() {
    current=$(get_layout)
    if [[ "$current" == "en" ]]; then
        hyprctl keyword input:kb_layout us,intl
        hyprctl switchxkblayout -n
        new_layout="intl"
    else
        hyprctl keyword input:kb_layout us,intl
        hyprctl switchxkblayout -n
        new_layout="en"
    fi
}

# Format output for waybar
format_output() {
    layout=$(get_layout)
    if [[ "$layout" == "en" ]]; then
        icon=""
        text="EN"
        tooltip="Current layout: US English\nClick to switch layout"
        class="en"
    else
        icon=""
        text="INT"
        tooltip="Current layout: International\nClick to switch layout"
        class="intl"
    fi

    echo "{\"text\": \"$icon $text\", \"tooltip\": \"$tooltip\", \"class\": \"$class\"}"
}

# Main execution
if [[ "$1" == "toggle" ]]; then
    toggle_layout
fi

format_output
EOF

# Improved audio-switcher.sh script
cat > ~/.config/waybar/scripts/audio-switcher.sh << 'EOF'
#!/bin/bash

# Get the current default audio sink
get_default_sink() {
    pactl info | grep 'Default Sink' | cut -d ' ' -f 3
}

# Get sink friendly name
get_sink_name() {
    sink_id="$1"
    pactl list sinks | grep -A10 "Name: $sink_id" | grep 'Description:' | sed 's/.*Description: \(.*\)/\1/'
}

# Get all available audio sinks
get_all_sinks() {
    pactl list short sinks | cut -f 2
}

# Switch to the next available sink
switch_sink() {
    current_sink=$(get_default_sink)
    sinks=($(get_all_sinks))

    for i in "${!sinks[@]}"; do
        if [[ "${sinks[$i]}" == "$current_sink" ]]; then
            next_index=$(( (i + 1) % ${#sinks[@]} ))
            next_sink="${sinks[$next_index]}"
            pactl set-default-sink "$next_sink"

            # Move all current streams to the new sink
            pactl list short sink-inputs | cut -f 1 | while read stream; do
                pactl move-sink-input "$stream" "$next_sink"
            done

            break
        fi
    done
}

# Format output for waybar
format_output() {
    current_sink=$(get_default_sink)
    sink_name=$(get_sink_name "$current_sink")

    # Determine icon based on sink name
    if [[ "$sink_name" == *"HDMI"* ]]; then
        icon=""
    elif [[ "$sink_name" == *"Headphone"* || "$sink_name" == *"headphone"* ]]; then
        icon=""
    elif [[ "$sink_name" == *"Speaker"* || "$sink_name" == *"speaker"* ]]; then
        icon=""
    elif [[ "$sink_name" == *"Bluetooth"* ]]; then
        icon=""
    else
        icon=""
    fi

    # Create shortened name for display
    short_name=$(echo "$sink_name" | cut -c 1-10)
    if [[ ${#sink_name} -gt 10 ]]; then
        short_name="${short_name}..."
    fi

    echo "{\"text\": \"$icon $short_name\", \"tooltip\": \"Current audio: $sink_name\nClick to switch audio output\"}"
}

# Main execution
if [[ "$1" == "switch" ]]; then
    switch_sink
fi

format_output
EOF

# Make the scripts executable
chmod +x ~/.config/waybar/scripts/keyboard-layout.sh
chmod +x ~/.config/waybar/scripts/audio-switcher.sh

echo "Waybar scripts have been created and made executable."

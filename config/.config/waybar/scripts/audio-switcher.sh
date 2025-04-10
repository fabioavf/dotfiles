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

    # If we have no sinks, exit
    if [ ${#sinks[@]} -eq 0 ]; then
        return
    fi

    # Find the current sink and switch to the next one
    for i in "${!sinks[@]}"; do
        if [[ "${sinks[$i]}" == "$current_sink" ]]; then
            next_index=$(( (i + 1) % ${#sinks[@]} ))
            next_sink="${sinks[$next_index]}"
            pactl set-default-sink "$next_sink"

            # Move all current streams to the new sink
            pactl list short sink-inputs | cut -f 1 | while read stream; do
                pactl move-sink-input "$stream" "$next_sink"
            done

            # Signal waybar to update immediately
            pkill -RTMIN+1 waybar

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
    short_name=$(echo "$sink_name" | cut -c 1-15)
    if [[ ${#sink_name} -gt 15 ]]; then
        short_name="${short_name}..."
    fi

    # List all available sinks for the tooltip
    tooltip="Current audio output: $sink_name\n\nAvailable outputs:"
    for sink in $(get_all_sinks); do
        name=$(get_sink_name "$sink")
        if [[ "$sink" == "$current_sink" ]]; then
            tooltip+="\n• $name [active]"
        else
            tooltip+="\n• $name"
        fi
    done
    tooltip+="\n\nClick to switch output"

    # Output in JSON format for waybar
    echo "{\"text\": \"$icon $short_name\", \"tooltip\": \"$tooltip\"}"
}

# Main execution
if [[ "$1" == "switch" ]]; then
    switch_sink
    # Output the updated information after switching
    format_output
else
    # Normal output without switching
    format_output
fi

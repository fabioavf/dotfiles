#!/bin/bash

# Get current workspace
current=$(hyprctl activeworkspace -j | jq '.id')

# Get all workspace IDs
workspaces=$(hyprctl workspaces -j | jq -r '.[] | .id')

# Find the previous workspace, if current is 1, stay on 1
if [ "$current" -gt 1 ]; then
    # Find the previous workspace
    prev=$(echo "$workspaces" | sort -n | grep -B1 "^$current$" | head -1)
    if [ "$prev" = "$current" ]; then
        # If grep didn't find a previous workspace (maybe we're not on a numbered one)
        prev=$((current - 1))
        # Ensure we don't go below 1
        if [ "$prev" -lt 1 ]; then
            prev=1
        fi
    fi
else
    # We're already on workspace 1, stay there
    prev=1
fi

# Move the window to the previous workspace
hyprctl dispatch movetoworkspacesilent "$prev"

# Switch to that workspace
hyprctl dispatch workspace "$prev"

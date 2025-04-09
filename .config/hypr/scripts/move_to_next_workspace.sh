#!/bin/bash

# Get current workspace
current=$(hyprctl activeworkspace -j | jq '.id')

# Get all workspace IDs
workspaces=$(hyprctl workspaces -j | jq -r '.[] | .id')

# Find the highest workspace ID
highest_id=$(echo "$workspaces" | sort -n | tail -1)

# Calculate the next workspace ID
if [ "$current" -eq "$highest_id" ]; then
    # We're on the highest workspace, create a new one
    next=$((highest_id + 1))
else
    # Find the next workspace
    next=$(echo "$workspaces" | sort -n | grep -A1 "^$current$" | tail -1)
    if [ "$next" = "$current" ]; then
        # If grep didn't find a next workspace (maybe we're not on a numbered one)
        next=$((current + 1))
    fi
fi

# Move the window to the next workspace
hyprctl dispatch movetoworkspacesilent "$next"

# Switch to that workspace
hyprctl dispatch workspace "$next"

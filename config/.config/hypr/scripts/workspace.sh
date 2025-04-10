#!/bin/bash
# Usage: workspace.sh next|prev

direction="$1"

# Get current workspace
current=$(hyprctl activeworkspace -j | jq '.id')
# Get all workspace IDs
workspaces=$(hyprctl workspaces -j | jq -r '.[] | .id')

if [ "$direction" = "next" ]; then
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
            next=$((current + 1))
        fi
    fi

    # Move the window to the next workspace
    hyprctl dispatch movetoworkspacesilent "$next"
    # Switch to that workspace
    hyprctl dispatch workspace "$next"
elif [ "$direction" = "prev" ]; then
    if [ "$current" -gt 1 ]; then
        # Find the previous workspace
        prev=$(echo "$workspaces" | sort -n | grep -B1 "^$current$" | head -1)
        if [ "$prev" = "$current" ]; then
            prev=$((current - 1))
            if [ "$prev" -lt 1 ]; then
                prev=1
            fi
        fi
    else
        prev=1
    fi

    # Move the window to the previous workspace
    hyprctl dispatch movetoworkspacesilent "$prev"
    # Switch to that workspace
    hyprctl dispatch workspace "$prev"
fi

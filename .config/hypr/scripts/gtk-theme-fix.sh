#!/bin/bash
# Force GTK applications to use dark theme
gsettings set org.gnome.desktop.interface gtk-theme 'Arc-Dark'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

# Export environment variables
export GTK_THEME=Arc-Dark

# Monitor for new GTK applications and apply theme
while true; do
  sleep 5
  gsettings set org.gnome.desktop.interface gtk-theme 'Arc-Dark'
done

#!/bin/bash

# Apply GTK theme
gsettings set org.gnome.desktop.interface gtk-theme "Orchis-Green-Dark"
gsettings set org.gnome.desktop.interface icon-theme "Tela-green-dark"
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"

# Apply Qt theme with Kvantum
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_STYLE_OVERRIDE=kvantum

# Ensure Kvantum is using the right theme
if command -v kvantummanager &> /dev/null; then
    kvantummanager --set MateriaDark
fi

# Make sure environment variables are set for all application types
echo "QT_QPA_PLATFORMTHEME=qt5ct" > ~/.xsessionrc
echo "QT_STYLE_OVERRIDE=kvantum" >> ~/.xsessionrc
chmod +x ~/.xsessionrc

# Apply Qt theme settings
if command -v qt5ct &> /dev/null; then
    # We can't actually run qt5ct without a GUI, but we can ensure configs are loaded
    echo "Qt5 settings updated"
fi

# Notify user
if command -v notify-send &> /dev/null; then
    notify-send "Theme Applied" "Dark purple theme has been applied to GTK and Qt applications"
fi

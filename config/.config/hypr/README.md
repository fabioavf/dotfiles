# Hyprland Configuration

<div align="center">

![Hyprland Logo](https://raw.githubusercontent.com/hyprwm/Hyprland/main/assets/header.svg)

**A modern, modular and visually polished Hyprland configuration**

![GitHub last commit](https://img.shields.io/github/last-commit/fabioavf/hyprland-config?style=flat-square)
![GitHub stars](https://img.shields.io/github/stars/fabioavf/hyprland-config?style=flat-square)
![License](https://img.shields.io/github/license/fabioavf/hyprland-config?style=flat-square)

![Screenshot](https://path-to-your-screenshot.png)

</div>

## ✨ Features

- **Modular Configuration**: Clean, organized config files divided by function
- **Multi-device Support**: Dedicated configs for different machines (MacBook/PC)
- **Dynamic Workspaces**: Smart workspace management with dynamic creation
- **Elegant Animations**: Smooth animations with carefully tuned bezier curves
- **Visual Polish**: Amber gold theme with subtle blurring and rounded corners
- **Secure Lockscreen**: Minimalist, stylish lockscreen with HyprLock
- **Seamless Workflow**: Optimized keybindings for maximum productivity
- **Theme Integration**: Consistent theming across GTK and Qt applications
- **Media Controls**: Integrated volume, brightness and media playback controls

## 📋 Requirements

- **Hyprland** (latest version recommended)
- **SwayOSD**: For on-screen display indicators
- **Grim, Slurp, wl-copy**: For screenshot functionality
- **Waybar**: For the top bar
- **wofi**: For application launcher
- **swaybg**: For wallpaper
- **Qt5/6 and GTK**: For application theming (qt5ct, kvantum)
- **alacritty**: Terminal emulator
- **JetBrains Mono Nerd Font**: For text and icons

## 🛠️ Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/fabioavf/hyprland-config.git ~/.config/hypr
   ```

2. Install required dependencies:
   ```bash
   # For Arch-based distros
   sudo pacman -S hyprland waybar wofi swayosd swaybg grim slurp wl-clipboard \
       qt5ct kvantum alacritty jq polkit-kde-agent

   # Install JetBrains Mono Nerd Font
   yay -S ttf-jetbrains-mono-nerd
   ```

3. Setup machine-specific configuration:
   ```bash
   # For PC
   ln -sf ~/.config/hypr/hyprland-pc.conf ~/.config/hypr/machine-specific.conf

   # For MacBook
   ln -sf ~/.config/hypr/hyprland-macbook.conf ~/.config/hypr/machine-specific.conf
   ```

4. Make scripts executable:
   ```bash
   chmod +x ~/.config/hypr/scripts/*.sh
   ```

5. Log out and select Hyprland as your window manager at the login screen

## 🔧 Configuration Structure

```
~/.config/hypr/
├── hyprland.conf                # Main entry point that sources other configs
├── machine-specific.conf        # Symlink to either PC or MacBook config
├── hyprlock.conf                # Lock screen configuration
├── shared/                      # Core shared configurations
│   ├── env.conf                 # Environment variables & app definitions
│   ├── input.conf               # Input device settings
│   ├── settings.conf            # Visual settings and animations
│   ├── window-rules.conf        # Window rules
│   ├── bindings.conf            # Key and mouse bindings
│   └── autostart.conf           # Autostart applications
└── scripts/
    ├── apply-theme.sh           # Theme application script
    ├── gtk-theme-fix.sh         # GTK theming fix
    ├── lockscreen.sh            # Lock screen script
    ├── workspace.sh             # Workspace management script
    └── screenshot.sh            # Screenshot utility
```

## ⌨️ Key Bindings

### Core Controls
- `Super + Return`: Open terminal
- `Super + Q`: Close active window
- `Super + Space`: Launch application menu (wofi)
- `Super + M`: Exit Hyprland
- `Super + SHIFT + R`: Reload Hyprland config
- `Super + SHIFT + L`: Lock screen

### Window Management
- `Super + V`: Toggle floating window
- `Super + P`: Toggle pseudo-tiling
- `Super + J`: Toggle split orientation
- `Super + F11` or `Super + SHIFT + F`: Toggle fullscreen

### Window Movement
- `Super + Arrow Keys`: Move focus
- `Super + SHIFT + Arrow Keys`: Move window
- `Super + Mouse Drag`: Move window
- `Super + Right Mouse Drag`: Resize window

### Workspace Navigation
- `Super + 1-0`: Switch to workspace 1-10
- `Super + SHIFT + 1-0`: Move window to workspace 1-10
- `Super + Mouse Wheel`: Switch to next/previous workspace
- `Super + SHIFT + Mouse Wheel`: Move window to next/previous workspace
- `Super + S`: Toggle special workspace (scratchpad)

### Other
- `Alt + Space`: Toggle keyboard layout
- `Super + Period`: Open emoji selector
- `Super + H`: Edit Hyprland config

### Media Controls
- Volume keys: Adjust volume with OSD
- Media keys: Control media playback
- Caps Lock: Show Caps Lock indicator

## 🎨 Theming

The configuration uses an Amber Gold theme with dark backgrounds, featuring:

- Rounded corners with subtle blur effects
- Amber gold borders with gradient effects
- Dark background with transparency

To change GTK/Qt themes:
```bash
~/.config/hypr/scripts/apply-theme.sh
```

## 📱 Device-Specific Features

### MacBook Configuration
- HiDPI display scaling (1.6x)
- MacOS-like keyboard shortcuts
- Touchpad gestures
- Command key as Super key

### PC Configuration
- 4K display scaling (2x)
- Traditional PC keybindings
- Multi-monitor support
- Auto-launched gaming utilities

## 💡 Customization

1. **Change wallpaper**:
   - Replace `~/Pictures/Wallpapers/w4.jpg` with your image
   - Update path in `shared/autostart.conf`

2. **Modify theme colors**:
   - Edit border colors in `shared/settings.conf`

3. **Change applications**:
   - Edit the variables in `shared/env.conf`

4. **Add autostart applications**:
   - Add to `shared/autostart.conf` or machine-specific config

## 🔄 Updates

To update the configuration:

```bash
cd ~/.config/hypr
git pull
```

## 🐛 Troubleshooting

- **Display issues**: Check your monitor configuration in machine-specific config
- **Missing applications**: Ensure all required packages are installed
- **Theme not applying**: Run `apply-theme.sh` and restart applications
- **GTK apps not themed**: Run `gtk-theme-fix.sh`

## 📜 License

This configuration is released under the MIT License. See the [LICENSE](LICENSE) file for details.

## 🙏 Credits

- [Hyprland](https://github.com/hyprwm/Hyprland) for the amazing wayland compositor
- [SwayOSD](https://github.com/ErikReider/SwayOSD) for the on-screen display
- [Waybar](https://github.com/Alexays/Waybar) for the status bar
- Original wallpapers by [Unsplash](https://unsplash.com)
- Various theming components from the Hyprland community

---

<div align="center">
    <i>Made with ❤️ by <a href="https://github.com/fabioavf">Fabio Amorelli</a></i>
</div>

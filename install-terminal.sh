#!/usr/bin/bash

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
FONTS_DIR="$HOME/.local/fonts/"

# Dark theme
gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"

# Download JetBrainsMono Nerd Font to a temp directory
wget -P /tmp/ https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip

# Create fonts directory
mkdir -p "$FONTS_DIR"

# Unzip fonts to the fonts directory
unzip /tmp/JetBrainsMono.zip -d "$FONTS_DIR"

# Apply Gnome terminal settings (Had to install the font first)
dconf load /org/gnome/terminal/ < "$FONTS_DIR/terminal-settings.dconf"


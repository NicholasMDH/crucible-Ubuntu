#!/usr/bin/bash

FONTS_DIR="$HOME/.local/share/fonts"

# Dark theme
gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"

# Check if fonts are already installed
if ! fc-list | grep -i jetbrains &> /dev/null; then
  echo "Installing JetBrains Mono Nerd Font"

  # Download JetBrainsMono Nerd Font to a temp directory
  wget -P /tmp/ https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip

  # Create fonts directory
  mkdir -p "$FONTS_DIR"

  # Unzip fonts to the fonts directory
  unzip /tmp/JetBrainsMono.zip -d "$FONTS_DIR"

  # Add the new directory to the fc-cache so the terminal can find the fonts
  fc-cache -fv "$FONTS_DIR"
else
  echo "JetBrains Mono Nerd Font already installed"
fi

# Apply Gnome terminal settings (Had to install the font first)
dconf load /org/gnome/terminal/ < ./terminal-settings.dconf

# Install Starship terminal
curl -sS https://starship.rs/install.sh | sh

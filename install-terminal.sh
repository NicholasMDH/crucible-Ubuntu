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
if ! which starship &>/dev/null; then
  curl -sS https://starship.rs/install.sh | sh
else
  echo "Starship already installed"
fi

# Create .local/bin directory
mkdir -p ~/.local/bin

# Add ~/.local/bin to PATH if it exists and isn't already in PATH
if [ -d "$HOME/.local/bin" ] && [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
    export PATH="$HOME/.local/bin:$PATH"
fi

# Install uv (installs to .local/bin)
if ! which uv &>/dev/null; then
  curl -LsSf https://astral.sh/uv/install.sh | sh
else
  echo "uv already installed"
fi

# Install Rust (have to check if cargo is installed)
if ! which cargo &>/dev/null; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
else
  echo "Rust/Cargo already installed"
fi

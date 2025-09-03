#!/usr/bin/bash

set -e

# Source utility functions
source utils.sh

if ! is_installed "zsh"; then
  echo "tmux is not installed."
  exit 1
fi

ZSH_DIR="$HOME/.oh-my-zsh/"

# Check if TPM is already installed
if [ -d "$ZSH_DIR" ]; then
  echo "oh-my-zsh is already installed in $ZSH_DIR"
else
  echo "Installing oh-my-zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  echo "oh-my-zsh installed successfully!"
  echo "Now installing plugins..."

  # Install tmux packages by calling the binary directly
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi


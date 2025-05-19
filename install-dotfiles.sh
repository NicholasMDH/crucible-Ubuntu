#!/usr/bin/bash

ORIGINAL_DIR=$(pwd)
REPO_URL="https://github.com/NicholasMDH/dotfiles"
REPO_NAME="dotfiles"

# Source utility functions
source utils.sh

if ! is_installed "stow"; then
  echo "Install stow first"
  exit 1
fi

cd ~

# Check if the repository already exists
if [ -d "$REPO_NAME" ]; then
  echo "Repository '$REPO_NAME' already exists. Skipping clone"
else
  git clone "$REPO_URL"
fi

# Check if the clone was successful
if [ $? -eq 0 ]; then
  cd "$REPO_NAME"

  # Have to remove the original .bashrc before I can stow mine
  mv ~/.bashrc ~/.bashrc.bak

  # Run `stow` for each subdirectory
  for dir in */; do
      # Skip .git and any non-stow directories
      [[ "$dir" == ".git/" ]] && continue
      echo "Stowing $dir"
      stow "${dir%/}"
  done
else
  echo "Failed to clone the repository."
  exit 1
fi

# Add ~/bin to PATH if it exists and isn't already in PATH
if [ -d "$HOME/bin" ] && [[ ":$PATH:" != *":$HOME/bin:"* ]]; then
    export PATH="$HOME/bin:$PATH"
fi

# cd back into original directory so install-tpm.sh works
cd "$ORIGINAL_DIR"

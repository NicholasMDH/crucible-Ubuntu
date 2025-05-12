#!/usr/bin/bash

set -e

# Source utility functions
source utils.sh

if ! is_installed "tmux"; then
  echo "tmux is not installed."
  exit 1
fi

TPM_DIR="$HOME/.tmux/plugins/tpm"

# Check if TPM is already installed
if [ -d "$TPM_DIR" ]; then
  echo "TPM is already installed in $TPM_DIR"
else
  echo "Installing Tmux Plugin Manager (TPM)..."
  git clone https://github.com/tmux-plugins/tpm $TPM_DIR
fi

echo "TPM installed successfully!"
echo "Now opening tmux session and installing plugins..."

# Create new "tpm_install_session" tmux session
tmux new-session -d -s tpm_install_session

# Install tmux packages by calling the binary directly
"$TPM_DIR/bin/install_plugins"

# Attach to the created session
tmux attach -t tpm_install_session

exit 0


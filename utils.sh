#!/usr/bin/bash

# Function to check if a package is installed
is_installed() {
#   dpkg-query -W "$1" &> /dev/null
  which "$1" &>/dev/null # Also look into 'command -v "$1" &>/dev/null
}

# Function to install packages if not already installed
install_packages() {
  local packages=("$@")

  for pkg in "${packages[@]}"; do
    if ! is_installed "$pkg"; then
      echo "[ MISS ] $pkg will be installed"
      sudo apt install -y "$pkg"
    fi
    echo "[ OK ] $pkg is installed"
  done
} 

#!/usr/bin/bash

SNAPS=(
  "spotify"
  "discord"
  "htop"
)

CLASSIC_SNAPS=(
  "code" # --classic
  "obsidian" # --classic
  "nvim" # --classic
)

for snap in "${SNAPS[@]}"; do
  if ! snap list | grep -i "$snap" &> /dev/null; then
    echo "Installing Snap: $snap"
    sudo snap install "$snap"
  else
    echo "snap already installed: $snap"
  fi
done

# TODO: Figure out a more elegant way to refactor this
echo "Installing classic snaps"
for snap in "${CLASSIC_SNAPS[@]}"; do
  if ! snap list | grep -i "$snap" &> /dev/null; then
    echo "Installing Snap: $snap"
    sudo snap install "$snap" --classic
  else
    echo "snap already installed: $snap"
  fi
done

SNAPS=(
  "spotify"
  "discord"
  "code"
  "obsidian"
  "nvim"
  "htop"
)

for snap in "${SNAPS[@]}"; do
  if ! snap list | grep -i "$snap" &> /dev/null; then
    echo "Installing Snap: $snap"
    snap install "$snap"
  else
    echo "snap already installed: $snap"
  fi
done

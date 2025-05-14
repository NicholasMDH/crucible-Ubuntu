# NicholasMDH's fork of Typecraft's Crucible 🛠️

My version of [Typecraft's Crucible project](https://github.com/typecraft-dev/crucible) that I have modified to install my preferred packages and configurations for Ubuntu.

## Features

- 🔄 Automated system & package updates
- 📦 Package installation by categories:
  - System utilities
  - Development tools
  - System maintenance tools
  - Desktop environment (i3 tiling window manager)
  - Media packages
  - Fonts
- 📄 All of my favorite scripts for automating Linux
- 🛠️ Remap the CapsLock key to Escape (set in i3 config)
- 🎮 Snap integration for specific applications
- ⚙️ Automatic service configuration
- 🔧 GNOME extensions and hotkey configuration

## Prerequisites

- A fresh Ubuntu Linux installation
- Internet connection
- sudo privileges

## Installation

1. Clone this repository:

```bash
git clone https://github.com/NicholasMDH/crucible-Ubuntu
```

2. Run the setup script:

```bash
./run.sh
```

3. Follow the prompts to select the packages you want to install.

4. The script will handle the rest of the setup process.

5. After the setup is complete, you can reboot your system to see the changes.

# Changelog
This is just v0 of the tool to get a basic setup, there are still various things I want to add, like:
- The programming languages I use most often (Python, C++, and Rust)
- Office tools
- Miscellaneous tools/apt packages that I forgot to include in the original script
- A custom mode to allow you to choose which blocks of packages to install (replacing/refactoring dev mode)

Also, feel free to reach out or submit issues/PRs with any changes you'd like to see made!

# Credit where credit is due!
This is a fork of [Typecraft's Crucible project](https://github.com/typecraft-dev/crucible), all I did was customize it to suit my needs. Thanks, nerd.
Check out his content on [YouTube](https://www.youtube.com/@typecraft_dev), he's a great person to follow for neovim/linux stuff.

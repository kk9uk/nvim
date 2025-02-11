#!/usr/bin/env bash

set -eEuo pipefail
trap 'echo "[ERROR]: Line $LINENO of $0"' ERR

# Put AppImage at .local/bin
mkdir -p $HOME/.local/bin
sudo apt install curl fuse -y
curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.appimage
chmod 755 nvim-linux-x86_64.appimage
mv nvim-linux-x86_64.appimage $HOME/.local/bin/nvim

# LSP dependencies
sudo apt install python3.11-venv unzip ripgrep -y

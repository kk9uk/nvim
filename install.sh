#!/usr/bin/env bash

set -eEuo pipefail
trap 'echo "[ERROR]: Line $LINENO of $0"' ERR

# Put AppImage at .local/bin
sudo apt install curl fuse -y
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod 755 nvim.appimage
mv nvim.appimage $HOME/.local/bin/nvim

# Install NVChad
git clone -b v2.0 https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
nvim

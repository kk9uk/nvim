#!/usr/bin/env bash

set -eEuo pipefail
trap 'echo "[ERROR]: Line $LINENO of $0"' ERR

# Put AppImage at .local/bin
sudo apt install curl fuse -y
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod 755 nvim.appimage
mv nvim.appimage $HOME/.local/bin/nvim

# Let him cook.
nvim

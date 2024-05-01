#!/usr/bin/env bash

set -eEuo pipefail
trap 'echo "ERROR: Line $LINENO of $0"' ERR

# Put AppImage at .local/bin
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod 755 nvim.appimage
mv nvim.appimage $HOME/.local/bin/nvim

# Install packer.nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim $HOME/.local/share/nvim/site/pack/packer/start/packer.nvim

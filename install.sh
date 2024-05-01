#!/usr/bin/env bash

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod 755 nvim.appimage
mv nvim.appimage /usr/local/bin/nvim

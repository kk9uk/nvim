## Usage
> 0. Clean up

    rm -rf ~/.config/nvim;
    rm -rf ~/.local/share/nvim;
    rm -rf ~/.local/state/nvim;

> 1. Clone this

    git clone https://github.com/kk9uk/nvim.git ~/.config/nvim

> 2. Install [latest](https://medium.com/thelinux/the-correct-way-to-install-the-neovim-42f3076f9b88) Neovim & [packer.nvim](https://github.com/wbthomason/packer.nvim)

    bash ~/.config/nvim/install.sh

> 3. Let him cook

    nvim ~/.config/nvim/lua/kk9uk/packer.lua
    :so
    :PackerSync
    nvim

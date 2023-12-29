## Usage
> 0. Clean up

    rm -rf ~/.config/nvim
    rm -rf ~/.local/share/nvim
    rm -rf ~/.local/state/nvim

> 1. Clone this

    git clone https://github.com/kk9uk/nvim.git ~/.config/nvim

> 2. Install [packer.vim](https://github.com/wbthomason/packer.nvim)

    git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

> 3. Let him cook

    nvim ~/.config/nvim/lua/kk9uk/packer.lua
    :so
    :PackerSync
    nvim

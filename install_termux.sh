#!/bin/bash

# Update repositories and install dependencies
apt update -y && apt install nodejs yarn git lua-language-server -y

# Store the current directory
orig_dir=$PWD

cd ~/.config/nvim

# Install packer
echo "Installing packer.."
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Install plugins
nvim '+source ~/.config/nvim/lua/settings.lua' '+source ~/.config/nvim/lua/plugins.lua' +PackerUpdate '+echo "You may now leave with :qa"'

# Install and build coc.nvim
cd ~/.local/share/nvim/site/pack/packer/start/coc.nvim/
echo "Building coc.nvim.."
yarn build
echo "Installing coc.nvim.. This may take a while."
yarn install

echo "NeoVim setup complete!"

cd $orig_dir
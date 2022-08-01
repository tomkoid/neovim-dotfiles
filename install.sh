#!/bin/bash

error=false
if [ ! -f "/usr/bin/node" ]
then
  echo "Please install node.js first to run this script"
  error=true
fi

if [ ! -f "/usr/bin/yarn" ]
then
  echo "Please install yarn first to run this script"
  error=true
fi

if [ ! -f "/usr/bin/git" ]
then
  echo "Please install git first to run this script"
  error=true
fi

if [ $error == true ]
then
  exit 1
fi

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

echo "You may need to install Ubuntu Font Family, JetBrains Mono and Nerd Fonts for emoji and symbols to work."

cd $orig_dir

#!/bin/bash

echo "===================================="
echo " _   _ _____ _____     _____ __  __ "
echo "| \ | | ____/ _ \ \   / /_ _|  \/  |"
echo "|  \| |  _|| | | \ \ / / | || |\/| |"
echo "| |\  | |__| |_| |\ V /  | || |  | |"
echo "|_| \_|_____\___/  \_/  |___|_|  |_|"
echo "===================================="

echo "1 - Arch / Arch based distributions"
echo "2 - Fedora / Fedora based distributions"
echo "3 - Debian / Debian based distributions"
echo "4 - Gentoo / Gentoo based distributions"
echo "5 - Termux"
echo "6 - Other"

read -p "Please enter your Linux distribution: " distribution

echo "=========================="
echo "1. Installing dependencies"
echo "=========================="

case $distribution in
  1)
    distribution_name="Arch"
    sudo pacman -Syy ttf-ubuntu-font-family ttf-jetbrains-mono neovim git --noconfirm --needed || echo "Error when installing dependencies"
    ;;
  2)
    distribution_name="Fedora"
    sudo dnf install jetbrains-mono-fonts neovim git || echo "Error when installing dependencies"
    ;;
  3)
    distribution_name="Debian"
    sudo apt-get install ttf-ubuntu-font-family fonts-jetbrains-mono neovim git || echo "Error when installing dependencies"  
    ;;
  4)
    distribution_name="Gentoo"
    sudo emerge media-fonts/ubuntu-font-family media-fonts/jetbrains-mono app-editors/neovim dev-vcs/git || echo "Error when installing dependencies"
    ;;
  5)
    distribution_name="Termux"
    apt update -y && apt install nodejs yarn git lua-language-server -y || echo "Error when installing dependencies"
    ;;
  6)
    distribution_name="Other"
    echo "Please install dependencies manually with your package manager"
    ;;
esac

if [ ! $distribution_name == "Termux" ]
then
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
fi

echo "Done."

echo "==================================="
echo "2. Installing packer plugin manager"
echo "==================================="

# Store the current directory
orig_dir=$PWD

# Create config directory for NeoVim if it doesn't exist
if [ ! -d "$HOME/.config/nvim" ]
then
  mkdir -p $HOME/.config/nvim
fi

cd ~/.config/nvim

if [ ! -d "$HOME/.local/share/nvim/site/pack/packer" ]
then
  # Install packer
  echo "Installing packer.."
  git clone --depth 1 https://github.com/wbthomason/packer.nvim\
   ~/.local/share/nvim/site/pack/packer/start/packer.nvim || echo "Error when cloning packer"
else
  echo "Skipped installing packer. Packer is already installed"
fi

echo "Done."

echo "========================="
echo "3. Installing all plugins"
echo "========================="

# Launch NeoVim and install plugins
nvim '+source ~/.config/nvim/lua/settings.lua' '+source ~/.config/nvim/lua/plugins.lua' +PackerUpdate '+echo "You may now leave with :qa"' || echo "Error when installing plugins"

echo "Done."

echo "================================="
echo "4. Build and install intellisense"
echo "================================="

# Install and build coc.nvim
cd ~/.local/share/nvim/site/pack/packer/start/coc.nvim/
echo "Building coc.nvim.."
yarn build
echo "Installing coc.nvim.. This may take a while."
yarn install || echo "Error when installing coc.nvim"

echo "NeoVim installation complete!"

if [ $distribution_name == "Other" ]
then
  echo "You may need to install Ubuntu Font Family, JetBrains Mono and Nerd Fonts for emoji and symbols to work."
fi

cd $orig_dir

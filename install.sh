#!/bin/sh

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
echo "5 - Void / Void based distributions"
echo "6 - Termux"
echo "7 - Other"

read -p "Please enter your Linux distribution / package manager: " distribution

echo "=========================="
echo "1. Installing dependencies"
echo "=========================="

case $distribution in
  1)
    distribution_name="Arch"
    sudo pacman -Syy ttf-ubuntu-font-family ttf-jetbrains-mono neovim git nodejs ttf-fira-code ttf-fira-mono ttf-fira-sans --noconfirm --needed || exit 1
    ;;
  2)
    distribution_name="Fedora"
    sudo dnf install jetbrains-mono-fonts neovim git npm || exit 1
    sudo npm install -g node || exit 1
    ;;
  3)
    distribution_name="Debian"
    sudo apt-get install fonts-jetbrains-mono git npm || exit 1
    sudo npm install -g node || exit 1 
    ;;
  4)
    distribution_name="Gentoo"
    sudo emerge media-fonts/ubuntu-font-family media-fonts/jetbrains-mono app-editors/neovim dev-vcs/git net-libs/nodejs || exit 1
    ;;
  5)
    distribution_name="Void"
    sudo xbps-install -S ttf-ubuntu-font-family font-firacode neovim git nodejs || exit 1 
    ;;
  6)
    distribution_name="Termux"
    apt update -y && apt install nodejs git lua-language-server -y || exit 1
    ;;
  7)
    distribution_name="Other"
    echo "Please install dependencies manually with your package manager"
    ;;
esac

# if [ ! $distribution_name == "Termux" ] || [ ! $distribution_name == "Nix" ] || [ ! $distribution_name == "NixOS" ]
# then
#   error=false
#   if [ ! -f "/usr/bin/node" ]
#   then
#     echo "Please install node.js first to run this script"
#     error=true
#   fi
  
#   if [ ! -f "/usr/bin/yarn" ] && [ ! -f "/usr/local/bin/yarn" ]
#   then
#     echo "Please install yarn first to run this script"
#     error=true
#   fi
  
#   if [ ! -f "/usr/bin/git" ]
#   then
#     echo "Please install git first to run this script"
#     error=true
#   fi

#   if [ ! -f "/usr/bin/nvim" ] && [ ! -f "/snap/bin/nvim" ]
#   then
#     echo "Please install neovim first to run this script"
#     error=true
#   fi
  
#   if [ $error == true ]
#   then
#     exit 1
#   fi
# fi

echo "Done."

echo "==================================="
echo "2. Initializng NeoVim configuration"
echo "==================================="

# Store the current directory
orig_dir=$PWD

# Create config directory for NeoVim if it doesn't exist
if [ ! -d "$HOME/.config/nvim" ]
then
  mkdir -p $HOME/.config/nvim
fi

cd ~/.config/nvim

echo "Done."

# echo "========================="
# echo "3. Installing all plugins"
# echo "========================="
#
# # Launch NeoVim and install plugins
# nvim '+source ~/.config/nvim/lua/settings.lua' '+source ~/.config/nvim/lua/plugins.lua' --headless -c "autocmd User PackerComplete quitall" -c 'PackerSync' || exit 1
#
# echo "Done."

# echo "======================================="
# echo "3. Building and installing intellisense"
# echo "======================================="

# Install and build coc.nvim
# cd ~/.local/share/nvim/site/pack/packer/start/coc.nvim/
# echo "Building coc.nvim.."
# yarn build
# echo "Installing coc.nvim.. This may take a while."
# yarn install || exit 1

echo "NeoVim installation complete!"

if [ $distribution_name == "Other" ] || [ $distribution_name == "Termux" ]
then
  echo "You may need to install Ubuntu Font Family, JetBrains Mono, FiraCode and Nerd Fonts for emoji and symbols to work."
fi

cd $orig_dir

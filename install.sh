# Install packer
echo "Installing packer.."
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Install plugins
nvim '+source ~/.config/nvim/lua/settings.lua' '+source ~/.config/nvim/lua/plugins.lua' +PackerUpdate '+echo "You may now leave with :qa"'

echo "NeoVim setup complete!"

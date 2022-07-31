vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("PACKER", { clear = true }),
  pattern = "plugins.lua",
  command = "source <afile> | PackerCompile"
})

return require("packer").startup({
  function(use)
    use("wbthomason/packer.nvim")
    use("honza/vim-snippets")
    use("tpope/vim-commentary")
    use("nvim-lua/plenary.nvim")
    use("nvim-lualine/lualine.nvim")
    use("preservim/nerdtree")
    use("terryma/vim-multiple-cursors")
    use("ryanoasis/vim-devicons")
    use("neoclide/coc.nvim")
    use("voldikss/vim-floaterm")
    use("chrisbra/Colorizer")
    use("junegunn/fzf")
    use("nvim-telescope/telescope.nvim")
    use("nvim-telescope/telescope-fzf-native.nvim")
    use("nvim-telescope/telescope-symbols.nvim")
    use("nvim-telescope/telescope-file-browser.nvim")
    use("ap/vim-css-color")
    use("junegunn/vim-emoji")
    use("github/copilot.vim")
    use("ziglang/zig.vim")
    use {
	'goolord/alpha-nvim',
    	requires = { 'kyazdani42/nvim-web-devicons' },
    }

  end,
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end,
    },
  },
})

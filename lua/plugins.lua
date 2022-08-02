local enable_plugins = true

vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("PACKER", { clear = true }),
  pattern = "plugins.lua",
  command = "source <afile> | PackerCompile"
})

require("packer").startup({
  function(use)
    if enable_plugins == true then

    -- PACKAGE MANAGERS
    use("wbthomason/packer.nvim")

    -- EXTRA PLUGINS
    use("honza/vim-snippets")
    use("tpope/vim-commentary")
    use("nvim-lua/plenary.nvim")
    use("terryma/vim-multiple-cursors")
    use("ryanoasis/vim-devicons")
    use("voldikss/vim-floaterm")
    use("chrisbra/Colorizer")
    use("junegunn/fzf")
    use("ap/vim-css-color")
    use("junegunn/vim-emoji")
    use("kyazdani42/nvim-web-devicons")
    use("numToStr/Sakura.nvim")
    use("vimwiki/vimwiki")
    use("junegunn/goyo.vim")
    use {
	    "nvim-lualine/lualine.nvim",
	    requires = { "kyazdani42/nvim-web-devicons", opt = true }
    }
    use {
	    'goolord/alpha-nvim',
    	requires = { 'kyazdani42/nvim-web-devicons' },
    }

    -- FILE MANAGEMENT
    use("preservim/nerdtree")

    -- COLORSCHEMES
    use("RRethy/nvim-base16")

    -- TELESCOPE PLUGINS
    use("nvim-telescope/telescope.nvim")
    use("nvim-telescope/telescope-fzf-native.nvim")
    use("nvim-telescope/telescope-symbols.nvim")
    use("nvim-telescope/telescope-file-browser.nvim")

    -- LANGUAGE SUPPORT
    use("neoclide/coc.nvim")
    use("github/copilot.vim")
    use("ziglang/zig.vim")
    use("neovim/nvim-lspconfig")

    end

  end,
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end,
    },
  },
})

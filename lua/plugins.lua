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
    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
    use("nvim-treesitter/playground")
    use("honza/vim-snippets")
    use("tpope/vim-commentary")
    use("nvim-lua/plenary.nvim")
    use("terryma/vim-multiple-cursors")
    use("ryanoasis/vim-devicons")
    use("voldikss/vim-floaterm")
    use {
      "norcalli/nvim-colorizer.lua",
      config = function() require("colorizer").setup() end
    } -- colorize hex colors
    use("junegunn/fzf")
    use("junegunn/vim-emoji")
    use("kyazdani42/nvim-web-devicons")
    use("numToStr/Sakura.nvim")
    use("vimwiki/vimwiki")
    use("junegunn/goyo.vim")
    use("lukas-reineke/indent-blankline.nvim")
    use {
      "windwp/nvim-ts-autotag",
      config = function() require('nvim-ts-autotag').setup() end
    }
    use {
	    "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end
    }
    use {
      'lewis6991/gitsigns.nvim',
      config = function()
        require('gitsigns').setup()
      end
    }
    use {
	    "nvim-lualine/lualine.nvim",
	    requires = { "kyazdani42/nvim-web-devicons", opt = true }
    }
    use {
	    'goolord/alpha-nvim',
    	requires = { 'kyazdani42/nvim-web-devicons' },
    }
    use('MunifTanjim/prettier.nvim')

    -- FILE MANAGEMENT
    -- use("preservim/nerdtree")
    -- use {
    --   'nvim-tree/nvim-tree.lua',
    --   requires = {
    --     'nvim-tree/nvim-web-devicons', -- file icons
    --   },
    -- }
    use {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v2.x",
      requires = { 
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
      }
    }

    -- COLORSCHEMES
    use("RRethy/nvim-base16")
    use { "catppuccin/nvim", as = "catppuccin" }

    -- TELESCOPE PLUGINS
    use("nvim-telescope/telescope.nvim")
    use("nvim-telescope/telescope-fzf-native.nvim")
    use("nvim-telescope/telescope-symbols.nvim")
    use("nvim-telescope/telescope-file-browser.nvim")

    -- LANGUAGE SUPPORT
    use {
      'VonHeikemen/lsp-zero.nvim',
        requires = {
          -- LSP Support
          {'neovim/nvim-lspconfig'},
          {'williamboman/mason.nvim'},
          {'williamboman/mason-lspconfig.nvim'},

          -- Autocompletion
          {'hrsh7th/nvim-cmp'},
          {'hrsh7th/cmp-buffer'},
          {'hrsh7th/cmp-path'},
          {'saadparwaiz1/cmp_luasnip'},
          {'hrsh7th/cmp-nvim-lsp'},
          {'hrsh7th/cmp-nvim-lua'},

          -- Snippets
          {'L3MON4D3/LuaSnip'},
          {'rafamadriz/friendly-snippets'},
        }
    }
    -- use("github/copilot.vim")
    use("ziglang/zig.vim")
    use("neovim/nvim-lspconfig")
    use("alaviss/nim.nvim")
    use {
      "akinsho/flutter-tools.nvim",
      requires = { "nvim-lua/plenary.nvim" },
      config = function()
        require("flutter-tools").setup()
      end,
    }
    use {
      "rust-lang/rust.vim",
      config = function ()
        vim.g.rustfmt_autosave = 1
      end
    }

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

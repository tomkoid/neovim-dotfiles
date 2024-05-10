-- local enable_plugins = true
--
-- vim.api.nvim_create_autocmd("BufWritePost", {
-- 	group = vim.api.nvim_create_augroup("LAZY", { clear = true }),
-- 	pattern = "plugins.lua",
-- 	command = "source <afile> | Lazy sync",
-- })

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- EXTRA PLUGINS
  {
    "nvim-treesitter/nvim-treesitter",
    -- lazy = false,
    cmd = "TSUpdate",
  },
  "nvim-treesitter/playground",
  "honza/vim-snippets",
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },
  "nvim-lua/plenary.nvim",
  {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  "mg979/vim-visual-multi",
  "ryanoasis/vim-devicons",
  "voldikss/vim-floaterm",
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  }, -- colorize hex colors
  "junegunn/fzf",
  { "junegunn/vim-emoji" },
  "kyazdani42/nvim-web-devicons",
  "vimwiki/vimwiki",
  { "junegunn/goyo.vim" },
  {
    "lukas-reineke/indent-blankline.nvim",
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "f-person/git-blame.nvim",
    config = function()
      require("gitblame").setup({ enabled = true })
    end,
  },
  {
    "lambdalisue/suda.vim",
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons", opt = true },
  },

  -- FILE MANAGEMENT
  -- use("preservim/nerdtree")
  -- use {
  --   'nvim-tree/nvim-tree.lua',
  --   requires = {
  --     'nvim-tree/nvim-web-devicons', -- file icons
  --   },
  -- }
  "nvim-tree/nvim-tree.lua",

  -- COLORSCHEMES
  "RRethy/nvim-base16",
  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    name = "catppuccin",
    config = function()
      vim.cmd("colorscheme catppuccin-mocha")
    end,
  },

  -- TELESCOPE PLUGINS
  "nvim-telescope/telescope.nvim",
  "nvim-telescope/telescope-fzf-native.nvim",
  "nvim-telescope/telescope-symbols.nvim",
  "nvim-telescope/telescope-file-browser.nvim",

  -- TABS
  -- "romgrk/barbar.nvim",

  -- NOICE
  {
    "folke/noice.nvim",
    -- event = "VeryLazy",
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      { "MunifTanjim/nui.nvim" },
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      { "rcarriga/nvim-notify" },
    },
  },

  -- LANGUAGE SUPPORT
  {
    "VonHeikemen/lsp-zero.nvim",
    dependencies = {
      -- LSP Support
      {
        "neovim/nvim-lspconfig",
        dependencies = {
          -- Useful status updates for LSP.
          -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
          {
            "j-hui/fidget.nvim",
            opts = {},
          },
          -- `neodev` configures Lua LSP for your Neovim config, runtime and plugins
          -- used for completion, annotations and signatures of Neovim apis
          { "folke/neodev.nvim", opts = {} },
        },
      },
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
      { "WhoIsSethDaniel/mason-tool-installer.nvim" },

      -- Autocompletion
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "saadparwaiz1/cmp_luasnip" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" },

      -- Snippets
      { "L3MON4D3/LuaSnip" },
      { "rafamadriz/friendly-snippets" },
    },
  },
  -- Highlight todo, notes, etc in comments
  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { signs = false },
  },
  -- { "mattn/efm-langserver" },
  -- {
  -- 	"creativenull/efmls-configs-nvim",
  -- 	version = "v1.x.x", -- version is optional, but recommended
  -- 	dependencies = { "neovim/nvim-lspconfig" },
  -- },
  { "nvimtools/none-ls.nvim", event = "VeryLazy" },
  -- { "glepnir/lspsaga.nvim",      branch = "main" },
  {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup()
    end,
  },
  -- { "zbirenbaum/copilot.lua" },
  {
    "Exafunction/codeium.vim",
    config = function()
      -- Change '<C-g>' here to any keycode you like.
      vim.keymap.set("i", "<C-c>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true, silent = true })
      vim.keymap.set("i", "<c-;>", function()
        return vim.fn["codeium#CycleCompletions"](1)
      end, { expr = true, silent = true })
      vim.keymap.set("i", "<c-,>", function()
        return vim.fn["codeium#CycleCompletions"](-1)
      end, { expr = true, silent = true })
      vim.keymap.set("i", "<c-x>", function()
        return vim.fn["codeium#Clear"]()
      end, { expr = true, silent = true })
    end,
  },
  -- { "mhartington/formatter.nvim" },
  {
    "heavenshell/vim-jsdoc",
    build = "make install",
  },

  "habamax/vim-godot",
  "ziglang/zig.vim",
  "neovim/nvim-lspconfig",
  "alaviss/nim.nvim",
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = true,
  },
  {
    "akinsho/flutter-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("flutter-tools").setup()
    end,
  },
  {
    "rust-lang/rust.vim",
    config = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
})

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
		-- cmd = "TSUpdate"
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
	"terryma/vim-multiple-cursors",
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
	"numToStr/Sakura.nvim",
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
		"f-person/git-blame.nvim",
		config = function()
			require("gitblame").setup({ enabled = true })
		end,
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
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

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
	{ "mattn/efm-langserver" },
	{
		"creativenull/efmls-configs-nvim",
		version = "v1.x.x", -- version is optional, but recommended
		dependencies = { "neovim/nvim-lspconfig" },
	},
	-- { "glepnir/lspsaga.nvim",      branch = "main" },
	{
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup()
		end,
	},
	{ "zbirenbaum/copilot.lua" },
	{ "mhartington/formatter.nvim" },

	"ziglang/zig.vim",
	"neovim/nvim-lspconfig",
	"alaviss/nim.nvim",
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

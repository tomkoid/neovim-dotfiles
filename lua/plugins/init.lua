---@author tomkoid
---@license MIT

return {
	"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically

	-- "gc" to comment visual regions/lines
	-- { "numToStr/Comment.nvim", opts = {} },

	{ -- Adds git related signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		opts = {},
	},

	{
		-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
		"catppuccin/nvim",
		priority = 1000, -- Make sure to load this before all the other start plugins.
		init = function()
			-- Load the colorscheme here.
			-- Like many other themes, this one has different styles, and you could load
			-- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
			vim.cmd.colorscheme("catppuccin-mocha")

			-- You can configure highlights by doing something like:
			vim.cmd.hi("Comment gui=none")
		end,
	},

	-- Highlight todo, notes, etc in comments
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},

	{
		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
				disabled_filetypes = { "NERDTree", "NvimTree_1" },
			},
		},
	},
	{ "vimwiki/vimwiki" },
	{
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	}, -- colorize hex colors
	{
		"f-person/git-blame.nvim",
		config = function()
			require("gitblame").setup({ enabled = true })
		end,
	},
	{
		"lambdalisue/suda.vim",
	},
	{ "windwp/nvim-ts-autotag" },
	-- Lazy.nvim
	{
		"hiasr/vim-zellij-navigator.nvim",
		config = function()
			require("vim-zellij-navigator").setup()
		end,
	},

	{
		"danymat/neogen",
		config = function()
			local neogen = require("neogen")

			neogen.setup({
				snippet_engine = "luasnip",
			})

			local opts = { noremap = true, silent = true }
			vim.keymap.set("n", "<leader>nc", function () neogen.generate({ snippet_engine = "luasnip"}) end, opts)
		end
	},
}

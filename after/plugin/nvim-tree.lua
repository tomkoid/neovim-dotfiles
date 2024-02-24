require("nvim-tree").setup()

-- Enable NvimTree transparency
vim.cmd([[hi NvimTreeNormal guibg=NONE ctermbg=NONE]])

-- refresh every 500 ms
vim.g.nvim_tree_auto_refresh = 500

local g = vim.g
local o = vim.o

-- Set colorscheme
vim.cmd(":colorscheme onedark")

-- Basic settings
o.termguicolors = true
o.number = true
o.cursorline = true
o.wrap = true

-- New window behavior
o.splitbelow = true
o.splitright = true

-- Decrease update time
o.timeoutlen = 500
o.updatetime = 200

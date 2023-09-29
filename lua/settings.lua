local highlight = vim.highlight
local g = vim.g
local o = vim.o

o.encoding = "utf-8"

-- Set tabsize
o.shiftwidth = 2
o.tabstop = 2

-- Basic settings
o.termguicolors = true
o.relativenumber = true
o.number = true
o.cursorline = true
o.wrap = true
o.expandtab = true
o.autochdir = false -- Change CWD after opening a file
o.showcmd = true
o.showmatch = true
o.showmode = true
o.hidden = true
o.scrolloff = 10
--o.smarttab = true
--o.smartcase = true
o.autoindent = true
o.autoread = true
o.wildmenu = true
o.wildmode = "list:longest"
o.wildignore = "*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*xlsx"
o.backspace = "indent,eol,start"

-- Search
o.hlsearch = false
o.incsearch = true

g.rehash256 = 1
g.syntastic_auto_jump = false

-- Enable mouse
o.mouse = "a"

-- Clipboard
o.clipboard = "unnamedplus"

-- Highlights for Neovide
-- Need to use `vim.cmd`, because NeoVim still doesn't have any API on this
-- NEW:
-- vim.cmd[[highlight LineNr           guifg=#5b6268 ctermfg=8    guibg=#282c34 ctermbg=none  cterm=none]]
-- vim.cmd[[highlight VertSplit        guifg=#1c1f24 ctermfg=0    guifg=#5b6268 ctermbg=8     cterm=none]]
-- vim.cmd[[highlight Statement        guifg=#98be65 ctermfg=2    guibg=none    ctermbg=none  cterm=none]]
-- vim.cmd[[highlight Directory        guifg=#51afef ctermfg=4    guibg=none    ctermbg=none  cterm=none]]
-- vim.cmd[[highlight NERDTreeClosable guifg=#98be65 ctermfg=2]]
-- vim.cmd[[highlight NERDTreeOpenable guifg=#5b6268 ctermfg=8]]
-- vim.cmd[[highlight Comment          guifg=#A6A6A6 ctermfg=4    guibg=none    ctermbg=none  cterm=italic]]
-- vim.cmd[[highlight Constant         guifg=#93B9F6 ctermfg=12   guibg=none    ctermbg=none  cterm=none]]
-- vim.cmd[[highlight Special          guifg=#8DB2EE ctermfg=4    guibg=none    ctermbg=none  cterm=none]]
-- vim.cmd[[highlight Identifier       guifg=#5699af ctermfg=6    guibg=none    ctermbg=none  cterm=none]]
-- vim.cmd[[highlight PreProc          guifg=#c678dd ctermfg=5    guibg=none    ctermbg=none  cterm=none]]
-- vim.cmd[[highlight String           guifg=#7A8AD4 ctermfg=12   guibg=none    ctermbg=none  cterm=none]]
-- vim.cmd[[highlight Number           guifg=#ff6c6b ctermfg=1    guibg=none    ctermbg=none  cterm=none]]
-- vim.cmd[[highlight Function         guifg=#ff6c6b ctermfg=1    guibg=none    ctermbg=none  cterm=none]]
-- OLD:
-- highlight.create("LineNr", { guifg = "#5b6268", ctermfg = 8, guibg = "#282c34", ctermbg = "none",  cterm = "none" }, false)
-- highlight.create("VertSplit", { guifg = "#1c1f24", ctermfg = 0, guibg = "#5b6268", ctermbg = 8, cterm = "none" }, false)
-- highlight.create("Statement", { guifg = "#98be65", ctermfg = 2, guibg = "none", ctermbg = "none", cterm = "none" }, false)
-- highlight.create("Directory", { guifg = "#51afef", ctermfg = 4, guibg="none", ctermbg="none", cterm="none" }, false)
-- highlight.create("NERDTreeClosable", { guifg = "#98be65", ctermfg = 2 }, false)
-- highlight.create("NERDTreeOpenable", { guifg = "#5b6268", ctermfg = 8 }, false)
-- highlight.create("Comment", { guifg = "#A6A6A6",  ctermfg = 4, guibg = "none", ctermbg = "none", cterm = "italic" }, false)
-- highlight.create("Constant", { guifg = "#93B9F6", ctermfg = 12, guibg = "none", ctermbg = "none", cterm = "none" }, false)
-- highlight.create("Special", { guifg = "#8DB2EE", ctermfg = 4, guibg = "none", ctermbg = "none", cterm = "none" }, false)
-- highlight.create("Identifier", { guifg = "#5699af", ctermfg = 6, guibg = "none", ctermbg = "none", cterm = "none" }, false)
-- highlight.create("PreProc", { guifg = "#c678dd", ctermfg = 5, guibg = "none", ctermbg = "none", cterm = "none" }, false)
-- highlight.create("String", { guifg = "#7A8AD4", ctermfg = 12, guibg = "none", ctermbg = "none", cterm = "none" }, false)
-- highlight.create("Number", { guifg = "#ff6c6b", ctermfg = 1, guibg = "none", ctermbg = "none", cterm = "none" }, false)
-- highlight.create("Function", { guifg = "#ff6c6b", ctermfg = 1, guibg = "none", ctermbg = "none", cterm = "none" }, false)

-- New window behavior
o.splitbelow = true
o.splitright = true

-- Fix lualine in NERDTree
o.laststatus = 3

-- Decrease update time
o.timeoutlen = 400
o.updatetime = 100

-- Set colorscheme
--vim.cmd.colorscheme "catppuccin-mocha"

-- Plugins
-- empty setup using defaults
-- require("nvim-tree").setup()

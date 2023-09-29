function telescope_files()
	local utils = require("telescope.utils")
	require("telescope.builtin").find_files({ cwd = utils.buffer_dir() })
end

local function map(m, k, v)
	vim.keymap.set(m, k, v, { silent = true })
end

--local telescope = require('telescope.builtin')

-- Map leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- best keybindings ever
map("v", "J", ":m '>+1<cr>gv=gv")
map("v", "K", ":m '<-2<cr>gv=gv")

map("n", "<leader>t", ":NvimTreeToggle<cr>") -- open nvim tree
--map("n", "<leader>ff", telescope.find_files) -- open telescope file manager
--map("n", "<leader>fg", telescope.live_grep) -- open telescope live grep
--map("n", "<leader>fb", telescope.buffers) -- open list of all buffers in telescope
--map("n", "<leader>fh", telescope.help_tags) -- open help tags
map("n", "<leader>ff", ":Telescope find_files<CR>") -- open telescope file manager
map("n", "<leader>fg", ":Telescope live_grep<CR>") -- open telescope file manager
map("n", "<leader>fb", ":Telescope buffers<CR>") -- open telescope file manager
map("n", "<leader>fh", ":Telescope help_tags<CR>") -- open telescope file manager
--map("n", "<leader>fb", telescope.buffers) -- open list of all buffers in telescope
--map("n", "<leader>fh", telescope.help_tags) -- open help tags
map("n", "<leader>s", "<c-w>w") -- switch focus to next window
map("n", "<c-left>", ":tabprevious<cr>") -- switch to previous tab
map("n", "<c-right>", ":tabnext<cr>") -- switch to next tab
map("n", "<c-b>", ":vnew term://zsh<cr>") -- open new terminal
map("t", "<esc>", [[<c-\><c-n>]]) -- enable esc in terminal mode
map("n", "d-v", "")
map("n", "<f4>", ":nohlsearch<cr>") -- clear search highlighting
map("n", "<c-h>", ":vertical resize -5<cr>") -- increase window size by 5%
map("n", "<c-l>", ":vertical resize +5<cr>") -- decrease window size window by 5%
map("n", "<leader>e", "<esc>$") -- go to the end of the line
map("n", "<leader>a", "<esc>^") -- go to the start of the line

-- LSP SAGA
map("n", "<leader>rr", ":Lspsaga rename<CR>")
map("n", "<leader>ca", ":Lspsaga code_action<CR>")
map("n", "<leader>gd", ":Lspsaga peek_definition<CR>")

-- TABS
map("n", "<leader>n", ":BufferNext<CR>") -- next tab
map("n", "<leader>mn", ":BufferMoveNext<CR>") -- move to next
map("n", "<leader>p", ":BufferPrevious<CR>") -- previous tab
map("n", "<leader>mp", ":BufferMovePrevious<CR>") -- move previous
map("n", "<leader>x", ":BufferClose<CR>") -- close tab

-- intellisense
-- vim.api.nvim_set_keymap("i", "<tab>", "coc#pum#visible() ? coc#pum#next(1): '<tab>'", {noremap = true, silent = true, expr = true})

-- vim.api.nvim_set_keymap("i", "<cr>", "coc#pum#visible() ? coc#pum#confirm(): '<cr>'", {noremap = true, silent = true, expr = true})

function telescope_files()
  local utils = require("telescope.utils")
  require("telescope.builtin").find_files({ cwd = utils.buffer_dir() })
end

local function map(m, k, v)
  vim.keymap.set(m, k, v, { silent = true })
end



-- Map leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

map("v", "J", ":m '>+1<cr>gv=gv")
map("v", "K", ":m '<-2<cr>gv=gv")

map('n', '<leader>t', ":NvimTreeToggle<cr>") -- open telescope file manager
map('n', '<leader>f', ":lua telescope_files()<cr>") -- open telescope file manager
map("n", "<leader>s", "<c-w>w") -- switch focus to next window
map("n", "<c-left>", ":tabprevious<cr>") -- switch to previous tab
map("n", "<c-right>", ":tabnext<cr>") -- switch to next tab
map("n", "<c-b>", ":vnew term://zsh<cr>") -- open new terminal
map("t", "<esc>", [[<c-\><c-n>]]) -- enable esc in terminal mode
map("n", "d-v", "")
map("n", "<f4>", ":nohlsearch<cr>") -- clear search highlighting
map("n", "<c-h>", ":vertical resize -5<cr>") -- increase window size by 5%
map("n", "<c-l>", ":vertical resize +5<cr>") -- decrease window size window by 5%
map('n', '<leader>e', '<esc>$') -- go to the end of the line
map('n', '<leader>a', '<esc>^') -- go to the start of the line

-- TABS
map("n", "<leader>n", ":BufferNext<CR>") -- next tab
map("n", "<leader>mn", ":BufferMoveNext<CR>") -- move to next 
map("n", "<leader>p", ":BufferPrevious<CR>") -- previous tab
map("n", "<leader>mp", ":BufferMovePrevious<CR>") -- move previous 
map("n", "<leader>x", ":BufferClose<CR>") -- close tab

-- intellisense
-- vim.api.nvim_set_keymap("i", "<tab>", "coc#pum#visible() ? coc#pum#next(1): '<tab>'", {noremap = true, silent = true, expr = true})

-- vim.api.nvim_set_keymap("i", "<cr>", "coc#pum#visible() ? coc#pum#confirm(): '<cr>'", {noremap = true, silent = true, expr = true})

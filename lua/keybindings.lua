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

vim.keymap.set("v", "j", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "k", ":m '<-2<cr>gv=gv")

map('n', '<c-t>', ':NeoTreeShowToggle<cr>') -- toggle nvim-tree
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
map('i', '<c-e>', '<esc>a') -- go to the end of the line
map('i', '<c-a>', '<esc>i') -- go to the start of the line

-- intellisense
-- vim.api.nvim_set_keymap("i", "<tab>", "coc#pum#visible() ? coc#pum#next(1): '<tab>'", {noremap = true, silent = true, expr = true})

-- vim.api.nvim_set_keymap("i", "<cr>", "coc#pum#visible() ? coc#pum#confirm(): '<cr>'", {noremap = true, silent = true, expr = true})

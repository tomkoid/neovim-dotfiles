local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

-- Map leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

map('n', '<C-t>', ':NvimTreeToggle<CR>') -- Toggle nvim-tree
map('n', '<leader>f', ':Telescope find_files<CR>') -- Open Telescope file manager
map("n", "<leader>w", "<C-W>W") -- Switch focus to next window
map("n", "<C-Left>", ":tabprevious<CR>") -- Switch to previous tab
map("n", "<C-Right>", ":tabnext<CR>") -- Switch to next tab
map("n", "<C-b>", ":vnew term://zsh<CR>") -- Open new terminal
map("t", "<Esc>", [[<C-\><C-n>]]) -- Enable ESC in terminal mode
map("n", "D-v", "")
map("n", "<F4>", ":nohlsearch<CR>") -- Clear search highlighting
map("n", "<C-h>", ":vertical resize -5<CR>") -- Increase window size by 5%
map("n", "<C-l>", ":vertical resize +5<CR>") -- Decrease window size window by 5%
map('i', '<C-E>', '<ESC>A') -- Go to the end of the line
map('i', '<C-A>', '<ESC>I') -- Go to the start of the line

-- Intellisense
-- vim.api.nvim_set_keymap("i", "<TAB>", "coc#pum#visible() ? coc#pum#next(1): '<TAB>'", {noremap = true, silent = true, expr = true})

-- vim.api.nvim_set_keymap("i", "<CR>", "coc#pum#visible() ? coc#pum#confirm(): '<CR>'", {noremap = true, silent = true, expr = true})

local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

map('n', '<C-t>', ':NERDTreeToggle<CR>')
map("n", "<C-s>", "<C-W>W")
map("n", "<C-Left>", ":tabprevious<CR>")
map("n", "<C-Right>", ":tabnext<CR>")
map("n", "<C-b>", ":vnew term://zsh<CR>")
map("t", "<Esc>", [[<C-\><C-n>]])
map("n", "<F4>", ":nohlsearch<CR>")

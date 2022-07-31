local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

map('n', '<C-t>', ':NERDTreeToggle<CR>') -- Toggle NERDTree
map("n", "<C-s>", "<C-W>W") -- Switch focus to next window
map("n", "<C-Left>", ":tabprevious<CR>") -- Switch to previous tab
map("n", "<C-Right>", ":tabnext<CR>") -- Switch to next tab
map("n", "<C-b>", ":vnew term://zsh<CR>") -- Open new terminal
map("t", "<Esc>", [[<C-\><C-n>]]) -- Enable ESC in terminal mode
map("n", "<F4>", ":nohlsearch<CR>") -- Clear search highlighting
map("n", "<C-h>", ":vertical resize +5<CR>") -- Increase window size by 5%
map("n", "<C-l>", ":vertical resize -5<CR>") -- Decrease window size window by 5%

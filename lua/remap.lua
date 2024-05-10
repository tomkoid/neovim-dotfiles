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

-- disable highlight on esc
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- tmux
map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>")
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>")
map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>")
map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>")

map("n", "<leader>lg", ":LazyGit<CR>")              -- open lazygit
map("n", "<leader>t", ":NvimTreeToggle<cr>")        -- open nvim tree
map("n", "<leader>ff", ":Telescope find_files<CR>") -- open telescope file manager
map("n", "<leader>fg", ":Telescope live_grep<CR>")  -- open telescope file manager
map("n", "<leader>fb", ":Telescope buffers<CR>")    -- open telescope file manager
map("n", "<leader>fh", ":Telescope help_tags<CR>")  -- open telescope file manager
map("n", "<leader>hh", vim.lsp.buf.hover)           -- open telescope file manager
map("n", "<leader>s", "<c-w>w")                     -- switch focus to next window
map("n", "<leader>bf", vim.lsp.buf.format)                    -- switch focus to next window
map("n", "<c-left>", ":tabprevious<cr>")            -- switch to previous tab
map("n", "<c-right>", ":tabnext<cr>")               -- switch to next tab
map("n", "<c-b>", ":vnew term://zsh<cr>")           -- open new terminal
map("t", "<esc>", [[<c-\><c-n>]])                   -- enable esc in terminal mode
map("n", "d-v", "")
map("n", "<f4>", ":nohlsearch<cr>")                 -- clear search highlighting
map("n", "<c-h>", ":vertical resize -5<cr>")        -- increase window size by 5%
map("n", "<c-l>", ":vertical resize +5<cr>")        -- decrease window size window by 5%
map("n", "<leader>e", "<esc>$")                     -- go to the end of the line
map("n", "<leader>a", "<esc>^")                     -- go to the start of the line

-- Trouble
map("n", "<leader>rr", vim.lsp.buf.rename)
map("n", "<leader>ca", vim.lsp.buf.code_action)
map("n", "<leader>gd", ":Trouble lsp_definitions<CR>")

-- TABS
map("n", "<leader>n", ":BufferNext<CR>")          -- next tab
map("n", "<leader>mn", ":BufferMoveNext<CR>")     -- move to next
map("n", "<leader>p", ":BufferPrevious<CR>")      -- previous tab
map("n", "<leader>mp", ":BufferMovePrevious<CR>") -- move previous
map("n", "<leader>x", ":BufferClose<CR>")         -- close tab

-- intellisense
-- vim.api.nvim_set_keymap("i", "<tab>", "coc#pum#visible() ? coc#pum#next(1): '<tab>'", {noremap = true, silent = true, expr = true})

-- vim.api.nvim_set_keymap("i", "<cr>", "coc#pum#visible() ? coc#pum#confirm(): '<cr>'", {noremap = true, silent = true, expr = true})

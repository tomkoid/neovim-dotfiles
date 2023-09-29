-- Close NeoVim window if last window opened is NERDTree
vim.cmd("autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif")

-- Inline diagnostics
vim.cmd("autocmd CursorHold * lua vim.diagnostic.open_float(nil, {focusable = false})")

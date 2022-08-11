function! s:check_back_space() abort
  let col = col(".") - 1
  return !col || getline(".")[col - 1] =~ "\s"
endfunction

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"

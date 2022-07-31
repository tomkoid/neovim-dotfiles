set number
set cursorline
" set cursorcolumn
filetype on
filetype plugin on
filetype indent on

syntax on

set guifont=JetBrains\ Mono:h11
" set guifont=Ubuntu\ Mono\ Bold:h11

set shiftwidth=4
set tabstop=4
set expandtab
set autochdir                   " Change CWD after opening a file
set nobackup
set scrolloff=10
set nowrap
set incsearch
set ignorecase
set smartcase
set smarttab
set showcmd
set showmode
set showmatch
set hlsearch
set history=1000
set noequalalways               " Don't resize split after toggling NERDTree

noh

set mouse=nicr
set mouse=a

set clipboard+=unnamedplus      " Copy/paste between vim and other programs.
set hidden                      " Needed to keep multiple buffers open
set t_Co=256                    " Set if term supports 256 colors.
syntax enable
let g:rehash256 = 1

set autoindent
set autoread
set backspace=indent,eol,start
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*xlsx

nnoremap <C-b> :vnew term://fish<CR>
tnoremap <Esc> <C-\><C-n>

set splitbelow splitright

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

"colors.filetypes": ["*"]

:colorscheme onedark

highlight LineNr           guifg=#5b6268 ctermfg=8    guibg=#282c34 ctermbg=none  cterm=none
highlight VertSplit        guifg=#1c1f24 ctermfg=0    guifg=#5b6268 ctermbg=8     cterm=none
highlight Statement        guifg=#98be65 ctermfg=2    guibg=none    ctermbg=none  cterm=none
highlight Directory        guifg=#51afef ctermfg=4    guibg=none    ctermbg=none  cterm=none
highlight NERDTreeClosable guifg=#98be65 ctermfg=2
highlight NERDTreeOpenable guifg=#5b6268 ctermfg=8
highlight Comment          guifg=#A6A6A6 ctermfg=4    guibg=none    ctermbg=none  cterm=italic
highlight Constant         guifg=#93B9F6 ctermfg=12   guibg=none    ctermbg=none  cterm=none
highlight Special          guifg=#8DB2EE ctermfg=4    guibg=none    ctermbg=none  cterm=none
highlight Identifier       guifg=#5699af ctermfg=6    guibg=none    ctermbg=none  cterm=none
highlight PreProc          guifg=#c678dd ctermfg=5    guibg=none    ctermbg=none  cterm=none
highlight String           guifg=#7A8AD4 ctermfg=12   guibg=none    ctermbg=none  cterm=none
highlight Number           guifg=#ff6c6b ctermfg=1    guibg=none    ctermbg=none  cterm=none
highlight Function         guifg=#ff6c6b ctermfg=1    guibg=none    ctermbg=none  cterm=none

call plug#begin()
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tc50cal/vim-terminal'
Plug 'tpope/vim-commentary'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/preservim/nerdtree' | Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin'
Plug 'https://github.com/ryanoasis/vim-devicons'
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N
Plug 'https://github.com/neoclide/coc.nvim' " Auto Completion
Plug 'https://github.com/voldikss/vim-floaterm'
Plug 'https://github.com/chrisbra/Colorizer'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-startify'
" Plug 'glepnir/dashboard-nvim'			    Startup Dashboard
Plug 'ap/vim-css-color'                            " Color previews for CSS
Plug 'junegunn/goyo.vim'                           " Distraction-free viewing
Plug 'junegunn/limelight.vim'                      " Hyperfocus on a range
Plug 'junegunn/vim-emoji'                          " Vim needs emojis!
Plug 'github/copilot.vim'                          " GitHub Copilot
Plug 'ziglang/zig.vim'

call plug#end()

let g:startify_custom_header=[
\ " _____               _         _     _",
\ "|_   _|__  _ __ ___ | | _____ (_) __| |",
\ "  | |/ _ \\| '_ ` _ \\| |/ / _ \\| |/ _` |",
\ "  | | (_) | | | | | |   < (_) | | (_| |",
\ "  |_|\\___/|_| |_| |_|_|\\_\\___/|_|\\__,_|",
\ ]

let g:neovide_refresh_rate=60
let g:neovide_transparency=0.95
let g:neovide_scroll_animation_length = 0.3
let g:neovide_cursor_animation_length=0.13
let g:neovide_cursor_trail_length=0.9
let g:neovide_cursor_antialiasing=v:true
let g:neovide_cursor_unfocused_outline_width=0.125
let g:neovide_cursor_vfx_mode = "sonicboom"
let g:neovide_cursor_vfx_opacity=200.0
let g:neovide_cursor_vfx_particle_lifetime=1.2
let g:neovide_cursor_vfx_particle_density=7.0
let g:neovide_cursor_vfx_particle_speed=10.0
let g:neovide_cursor_vfx_particle_phase=1.5
let g:neovide_remember_window_size = v:true

if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif

nnoremap <silent><C-t> :NERDTreeToggle<CR>
nnoremap <silent><C-Left> :tabprevious<CR>
nnoremap <silent><C-Right> :tabnext<CR>
nnoremap <silent><C-k> :vertical resize +5<CR>
nnoremap <silent><C-l> :vertical resize -5<CR>
nnoremap <D-v> "+p
nnoremap <silent><F3> :noh<CR> " Clear search highlighting
nnoremap <silent><F4> :set wrap!<CR>
nnoremap <silent><C-S> <C-W>W

" Close NeoVim if NERDTree is the last window
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

let g:NERDTreeDirArrowCollapsible="-"
let g:NERDTreeDirArrowExpandable="*"

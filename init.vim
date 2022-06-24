set nocompatible
set number
set cursorline
" set cursorcolumn
filetype on
filetype plugin on
filetype indent on

syntax on

set shiftwidth=4
set tabstop=4
set expandtab
set nobackup
set scrolloff=10
set nowrap
set incsearch
set ignorecase
set smartcase
set showcmd
set showmode
set showmatch
set hlsearch
set history=1000

set autoindent
set autoread
set backspace=indent,eol,start

set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*xlsx

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

:colorscheme onedark

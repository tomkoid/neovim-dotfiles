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
set smarttab
set showcmd
set showmode
set showmatch
set hlsearch
set history=1000
set mouse=a

set autoindent
set autoread
set backspace=indent,eol,start
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*xlsx

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

:colorscheme onedark

call plug#begin()
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/preservim/nerdtree' | Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin'
Plug 'https://github.com/ryanoasis/vim-devicons'
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N
Plug 'https://github.com/neoclide/coc.nvim' " Auto Completion
Plug 'https://github.com/tc50cal/vim-terminal'
call plug#end()

nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" Close NeoVim if NERDTree is the last window
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

let g:NERDTreeDirArrowCollapsible="-"
let g:NERDTreeDirArrowExpandable="*"

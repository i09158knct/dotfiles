set nocompatible
filetype off


" Theme
color pablo
set background=dark
set t_Co=256
syntax on


" Editor
set noswapfile
set nobackup
set hidden
set autoread


" Edit
set mouse=a
set backspace=indent,eol,start
set whichwrap=b,s,h,s,<,>,[,]


" Indent
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set autoindent
set smartindent
set smarttab

autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4


" View
set cursorline
set ruler
set scrolloff=5
set showmatch
set nowrap


" Search
set hlsearch
set incsearch
set wrapscan
set ignorecase
set smartcase


" Filer
set wildmenu
set wildmode=list:full


" File Types
au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee



" Plugin
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle'))
endif

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'kchmck/vim-coffee-script'


" Key Bindings
inoremap <C-@> <C-[>

inoremap <C-n> <Down>
inoremap <C-p> <Up>
inoremap <C-f> <Right>
inoremap <C-b> <Left>

inoremap <C-a> <Home>
inoremap <C-e> <End>

inoremap <C-c> <C-n>

inoremap <C-d> <Delete>
inoremap <C-h> <C-h>

nnoremap ; :


" End
filetype plugin indent on
filetype indent on
syntax on

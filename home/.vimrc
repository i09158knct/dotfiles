set nocompatible


" Theme
colorscheme pablo
set background=dark
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
set autoindent
set smartindent
set smarttab


" View
set cursorline
set ruler
set scrolloff=3
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



" Key
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

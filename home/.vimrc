set nocompatible
filetype off



""" Theme
color desert
set background=dark
set t_Co=256
syntax on



""" Editor
"set noswapfile
"set nobackup
set hidden
set autoread



""" Window
set splitbelow
set splitright



""" Edit
set mouse=a
set clipboard=unnamed,autoselect
set backspace=indent,eol,start
set whichwrap=b,s
"set whichwrap=b,s,h,l,<,>,[,]



""" Indentation
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set autoindent
set smartindent
set smarttab

autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4



""" View
set cursorline
set ruler
set scrolloff=3
set showmatch
set nowrap

augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END



""" Search
set hlsearch
set incsearch
set wrapscan
set ignorecase
set smartcase



""" Filer
set wildmenu
set wildmode=list:full



""" File Types
au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee



""" Plugin
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle'))
endif

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'kchmck/vim-coffee-script'



""" Key Bindings
let mapleader = ","
inoremap <C-@> <C-[>

"nnoremap m <Nop>
"nnoremap t <Nop>
"nnoremap s <Nop>
"nnoremap Q <Nop>
"nnoremap ZZ <Nop>
"nnoremap ZQ <Nop>


"" Emacs
inoremap <C-n> <Down>
inoremap <C-p> <Up>
inoremap <C-f> <Right>
inoremap <C-b> <Left>

inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-k> <ESC>

inoremap <C-d> <Delete>
inoremap <C-h> <C-h>


"" Window
nnoremap <C-t> <C-w>w
nnoremap <C-w><C-v> :new<CR>
nnoremap <C-w><C-h> :vne<CR>
inoremap <C-t> <C-w>w
inoremap <C-w><C-v> <ESC>:new<CR>
inoremap <C-w><C-h> <ESC>:vne<CR>


inoremap <C-c> <C-n>


""" End
filetype plugin indent on
filetype indent on
syntax on

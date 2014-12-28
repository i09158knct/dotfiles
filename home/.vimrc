set nocompatible
filetype off



""" Theme
"color desert
set background=dark
set t_Co=256
set notitle



""" Editor
set noswapfile
set nobackup
set backupskip=/tmp/*,/private/tmp/*
set hidden
set autoread



""" Window
set splitbelow
set splitright



""" Edit
"set clipboard=unnamed
set backspace=indent,eol,start



""" Indentation
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set autoindent
set smartindent
set smarttab



""" View
set ruler
set scrolloff=3
set showmatch
set matchtime=2
set nowrap
set sidescroll=1
set sidescrolloff=3
set list
set listchars=tab:\ \ ,extends:>,precedes:<

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



""" Plugins
" if has('vim_starting')
"   set runtimepath+=~/.vim/bundle/neobundle.vim
"   call neobundle#rc(expand('~/.vim/bundle'))
" endif
"
" NeoBundle 'Shougo/neobundle.vim'
" NeoBundle 'Shougo/vimproc'



""" Key Bindings
let mapleader = ","
inoremap <C-,> ,
inoremap <C-@> <C-[>

"nnoremap ZZ <Nop>
"nnoremap ZQ <Nop>


"" Emacs
inoremap <C-n> <Down>
inoremap <C-p> <Up>
inoremap <C-f> <Right>
inoremap <C-b> <Left>

inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-y> <C-r>"

inoremap <C-d> <Delete>
inoremap <C-h> <C-h>



""" End
filetype plugin indent on
filetype indent on
syntax on

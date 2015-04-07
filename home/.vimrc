set nocompatible
filetype off



""" Theme
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
set completeopt=menu,preview
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
if has('vim_starting')
  if &compatible
    set nocompatible
  endif
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'fatih/vim-go'
NeoBundle 'tomasr/molokai'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'vim-jp/vimdoc-ja'
call neobundle#end()
NeoBundleCheck
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")


""" Key Bindings
let mapleader = ","
nnoremap <Leader>/ :NERDTreeToggle<CR>
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

""" QuickRun
"QuickRun -outputter/buffer/split ":botright"
let g:quickrun_config = {
\   '_': {
\     'outputter/buffer/split': ':botright 12sp'
\   },
\   'cpp': {
\     'command': 'g++',
\     'cmdopt': '-std=c++11'
\   }
\ }


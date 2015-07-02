set nocompatible

syntax on
filetype off


" Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive'

Plugin 'tpope/vim-endwise'

Plugin 'tpope/vim-surround'

Plugin 'tpope/vim-commentary'

Plugin 'scrooloose/nerdtree'
nnoremap <f2> :NERDTreeToggle<cr>
if has("gui_running")
  autocmd VimEnter * NERDTree
  let NERDTreeMinimalUI = 1
endif

Plugin 'scrooloose/syntastic'
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args='--ignore=E501'
let g:syntastic_javascript_checkers = ['jshint']

Plugin 'kien/ctrlp.vim'

Plugin 'bling/vim-airline'
let g:airline_powerline_fonts = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#default#layout = [
    \ [ 'c' ],
    \ [ 'b', 'a', 'z', 'warning' ]
    \ ]

Plugin 'jiangmiao/auto-pairs'

Plugin 'godlygeek/tabular'

Plugin 'altercation/vim-colors-solarized'
let g:solarized_termcolors = 256

Plugin 'joonty/vdebug.git'

Plugin 'digitaltoad/vim-jade'

call vundle#end()
filetype on
filetype plugin indent on


" Settings
set autoindent
set smartindent
set backspace=indent,eol,start

set expandtab
set smarttab
set tabstop=2
set softtabstop=2
set shiftwidth=2

set ignorecase
set smartcase
set incsearch
set hlsearch
set showmatch

set noerrorbells
set novisualbell

set wildmenu
set wildmode=longest,full
set wildignorecase

set title
set laststatus=2
set shortmess=at
set splitbelow
set splitright

set wrap
set ruler
set number
set cursorline
set scrolloff=4

set noswapfile
set lazyredraw
set ttyfast
set confirm

if has('clipboard')
  if has('unnamedplus')
    set clipboard=unnamed,unnamedplus
  else
    set clipboard=unnamed
  endif
endif

set mouse=a
set mousehide
set history=1000
set tags=./tags;

set t_Co=256
set background=dark

colorscheme solarized


" Commands
command W w !sudo tee % > /dev/null


" Mappings
let mapleader = "`"

map j gj
map k gk
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

:imap <leader><leader> <Esc>

nnoremap <leader>/ :nohlsearch<CR>

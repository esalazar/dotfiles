execute pathogen#infect()

syntax enable
filetype plugin indent on

set nocompatible
set autoindent
set smartindent
set expandtab
set smarttab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set backspace=2
set ai
set si
set wrap
set ignorecase
set smartcase
set incsearch
set hlsearch
set magic
set showmatch
set ruler
set visualbell
set history=2000
set wildmenu
set mouse=a
set ttymouse=xterm2
set t_Co=256
set splitbelow
set splitright
set tags=./tags;
set noswapfile
set background=dark
set nu

if has("gui_running")
  autocmd VimEnter * NERDTree
  let NERDTreeMinimalUI=1
endif

let g:solarized_termcolors=256
colorscheme solarized

nnoremap <f2> :NERDTreeToggle<cr>

:imap ;; <Esc>

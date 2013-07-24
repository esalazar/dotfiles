set nocompatible

execute pathogen#infect()

syntax enable
filetype plugin indent on

set autoindent
set smartindent
set expandtab
set smarttab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set backspace=2
set ignorecase
set smartcase
set incsearch
set hlsearch
set showmatch
set visualbell
set wildmenu
set title
set splitbelow
set splitright
set ruler
set number
set cursorline
set wrap
set noswapfile
set ttyfast
set mouse=a
set history=2000
set t_Co=256
set tags=./tags;
set background=dark

if has("gui_running")
  autocmd VimEnter * NERDTree
  let NERDTreeMinimalUI=1
endif

let g:solarized_termcolors=256
colorscheme solarized

nnoremap <f2> :NERDTreeToggle<cr>

:imap ;; <Esc>

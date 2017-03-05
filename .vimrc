set nocompatible

syntax on
filetype off


" Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage itself
Plugin 'gmarik/Vundle.vim'

" Create a git wrapper
Plugin 'tpope/vim-fugitive'

" End if, def, and other statements
Plugin 'tpope/vim-endwise'

" Adjust indentation based on file
Plugin 'tpope/vim-sleuth'

" Change surounding parens or quotes
Plugin 'tpope/vim-surround'

" Allow comment shortcuts
Plugin 'tpope/vim-commentary'

" Provide syntax checking
Plugin 'scrooloose/syntastic'
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args='--ignore=E501'
let g:syntastic_javascript_checkers = ['jshint']

" Show git changes in a file
Plugin 'mhinz/vim-signify'
let g:signify_sign_change = '~'

" Add a filesystem explorer
Plugin 'scrooloose/nerdtree'
nnoremap <f2> :NERDTreeToggle<cr>
if has("gui_running")
  autocmd VimEnter * NERDTree
  let NERDTreeMinimalUI = 1
endif

" Fuzzy search working directory
Plugin 'ctrlpvim/ctrlp.vim'
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" Search with ack
Plugin 'mileszs/ack.vim'
cnoreabbrev Ack Ack!

" Enhance status line
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_powerline_fonts = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#default#layout = [
    \ [ 'c' ],
    \ [ 'b', 'a', 'warning', 'error' ]
    \ ]
let g:airline_theme='base16'

" Complete parens, brackets, and quotes
Plugin 'jiangmiao/auto-pairs'

" Identify indentation with lines
Plugin 'Yggdroot/indentLine'
let g:indentLine_char = '│'

" Align text
Plugin 'godlygeek/tabular'

" Autocomplete engine
Plugin 'Valloric/YouCompleteMe'
let g:ycm_collect_identifiers_from_tags_files = 1

" Highlight matching tags
Plugin 'Valloric/MatchTagAlways'

" Introduce new colorspace
Plugin 'chriskempson/base16-vim'
let base16colorspace=256
"
" Color highlighter
Plugin 'ap/vim-css-color'

" Coffeescript support
Plugin 'kchmck/vim-coffee-script'

" Jade support
Plugin 'digitaltoad/vim-jade'

" Rails support
Plugin 'tpope/vim-rails'

call vundle#end()
filetype plugin indent on


" Settings
set autoindent
set smartindent
au! FileType python setl nosmartindent
set backspace=indent,eol,start

set expandtab
set smarttab
set tabstop=2
set softtabstop=2
set shiftwidth=2

set ignorecase
set magic
set smartcase
set incsearch
set hlsearch
set showmatch

set timeoutlen=1000 ttimeoutlen=0
set noerrorbells
set novisualbell

set wildmenu
set wildmode=longest,full
set wildignorecase
set wildignore=*.o,*.obj,*.bak,*.exe,*pyc,*zip

set title
set laststatus=2
set shortmess=at
set conceallevel=0
set splitbelow
set splitright

set wrap
set ruler
set number
set cursorline
set scrolloff=2

set encoding=utf8
set t_Co=256
set background=dark
colorscheme base16-railscasts

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
set history=2000
set tags=./tags;


" Commands
command W w !sudo tee % > /dev/null


" Abbreviations
iabbrev teh the


" Mappings
let mapleader = "\<Space>"

map j gj
map k gk
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

inoremap <leader><Enter> <Esc>
onoremap <leader><Enter> <Esc>
vnoremap <leader><Enter> <Esc>gV

nnoremap Q <nop>
nnoremap Y y$
nnoremap <leader>/ :nohlsearch<CR>

autocmd FileType python nnoremap <buffer> <F9> :exec '!clear; python' shellescape(@%, 1)<cr>

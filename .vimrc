set nocompatible


"" Plugins
call plug#begin('~/.vim/plugged')

" Create a git wrapper
Plug 'tpope/vim-fugitive'

" End if, def, and other statements
Plug 'tpope/vim-endwise'

" Adjust indentation based on file
Plug 'tpope/vim-sleuth'

" Change surounding parens or quotes
Plug 'tpope/vim-surround'

" Allow comment shortcuts
Plug 'tpope/vim-commentary'

" Provide syntax checking
Plug 'scrooloose/syntastic'
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = '--ignore=E501'
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_check_on_wq = 0

" Show git changes in a file
Plug 'mhinz/vim-signify'
let g:signify_sign_change = '~'

" Add a filesystem explorer
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
nnoremap <f2> :NERDTreeToggle<cr>
if has("gui_running")
  autocmd VimEnter * NERDTree
  let NERDTreeMinimalUI = 1
endif

" Fuzzy search working directory
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'

" Search with ack
Plug 'mileszs/ack.vim'
cnoreabbrev Ack Ack!

" Tag projects
Plug 'ludovicchabant/vim-gutentags'

" Enhance status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline_symbols_ascii = 1
let g:airline_theme = 'bubblegum'
let g:airline#extensions#default#layout = [
    \ [ 'a', 'c' ],
    \ [ 'b', 'error', 'warning' ]
    \ ]
let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ '' : 'V',
    \ 's'  : 'S',
    \ 'S'  : 'S',
    \ '' : 'S',
    \ }

" Complete parens, brackets, and quotes
Plug 'jiangmiao/auto-pairs'

" Identify indentation with lines
Plug 'Yggdroot/indentLine'
let g:indentLine_char = '│'

" Align text
Plug 'godlygeek/tabular'

" Autocomplete engine
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --gocode-completer --tern-completer  --clang-completer' }
let g:ycm_goto_buffer_command = 'horizontal-split'
let g:ycm_seed_identifiers_with_syntax = 1

" Highlight matching tags
Plug 'Valloric/MatchTagAlways', { 'for': ['html', 'xhtml', 'xml', 'jinja'] }

" Introduce new colorspace
Plug 'chriskempson/base16-vim'
let base16colorspace = 256
"
" Color highlighter
Plug 'ap/vim-css-color'

" Javascript support
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

" Coffeescript support
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }

" Jade support
Plug 'digitaltoad/vim-jade', { 'for': 'pug' }

" Rails support
Plug 'tpope/vim-rails', { 'for': ['ruby', 'haml'] }

call plug#end()


"" Settings

" Indents
set autoindent
set smartindent
set backspace=indent,eol,start

" Tabbing
set expandtab
set smarttab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Searching
set ignorecase
set magic
set smartcase
set incsearch
set hlsearch
set showmatch

" Global interface
set title
set laststatus=2
set shortmess=at
set timeoutlen=1000 ttimeoutlen=0
set noerrorbells
set novisualbell
set confirm
set lazyredraw
set ttyfast

" Code interface
set wrap
set ruler
set number
set cursorline
set scrolloff=2
set conceallevel=0

" Menus
set wildmenu
set wildmode=longest,full
set wildignorecase
set wildignore=*.o,*.obj,*.bak,*.exe,*pyc,*zip

" Windows
set splitbelow
set splitright

" Theme
set encoding=utf8
set t_Co=256
set background=dark
colorscheme base16-tomorrow-night

" Clipboard support
if has('clipboard')
  if has('unnamedplus')
    set clipboard=unnamed,unnamedplus
  else
    set clipboard+=unnamed
  endif
endif

" Mouse support
set mouse=a
set mousehide

" Undoing
if has("persistent_undo")
    set undodir=~/.vim/undo/
    set undofile
endif

" Misc
set history=2000
set tags=./tags;
set noswapfile


"" Commands
command W w !sudo tee % > /dev/null


"" Abbreviations
iabbrev teh the


"" Mappings
let mapleader = "\<Space>"

" Movements
map j gj
map k gk

" Windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Escaping
inoremap <leader><Enter> <Esc>
onoremap <leader><Enter> <Esc>
vnoremap <leader><Enter> <Esc>gV

" Plugins
nnoremap <Leader>a :Ack!<Space>
nnoremap <Leader>d :YcmCompleter GoToDeclaration<cr>
nnoremap <leader>f :FZF<cr>

" Misc
nnoremap Q <nop>
nnoremap Y y$
nnoremap <leader>/ :nohlsearch<CR>


"" Filetypes

" Python
autocmd FileType python setlocal completeopt-=preview
autocmd FileType python nnoremap <buffer> <F9> :exec '!clear; python' shellescape(@%, 1)<cr>

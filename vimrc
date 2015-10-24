" Vim settings
set nocompatible

" Use Vundle for bundle management https://github.com/gmarik/Vundle.vim
" set the runtime path to include Vundle and initialize
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Support
Plugin 'rking/ag.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/syntastic'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-endwise.git'
Plugin 'vim-scripts/matchit.zip'
Plugin 'mattn/emmet-vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'mbbill/undotree'

" Display
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bronson/vim-trailing-whitespace'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" Ruby
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'vim-scripts/ruby-matchit'

" Javascript
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'elzr/vim-json'
Plugin 'kchmck/vim-coffee-script'

" Templating, markdown, etc.
Plugin 'tpope/vim-haml'
Plugin 'plasticboy/vim-markdown'

" Haskell
Plugin 'neovimhaskell/haskell-vim'

" Elm
Plugin 'lambdatoast/elm.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let mapleader = ";" " Leader

set backspace=2   " Make backspace behave like in other programs
set nobackup
set nowritebackup
set noswapfile
set ruler
set showcmd
set laststatus=2
set number
set shortmess=atI

" Tab settings
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

set list listchars=tab:»·,trail:·,nbsp:· " Trailing whitespace

" Show column at 80
set textwidth=80
set colorcolumn=+1

" Tag completion using excuberant ctags
set tags=tags;/
set wildignore+=*/tmp/*,*/.git/*,*/.bundle/*,*/coverage/*,*/public/*,*/log/*,*/vendor/*,*/doc/*

" Search settings
set incsearch
set hlsearch
set ignorecase
set infercase
set smartcase
nmap <leader>hs :let @/=""<CR>

" Persistent undo
set undofile
set undodir=~/.vim/undo
set undolevels=1000
set undoreload=10000

" Solarized color scheme
syntax on
color solarized
set background=dark

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
set grepprg=ag\ --nogroup\ --nocolor " Use Ag over Grep
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0

" Syntastic settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': [], 'passive_filetypes': ['ruby'] }
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [], 'passive_filetypes': [] }
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_html_checkers = ['eslint']

" Airline settings
set guifont=Meslo\ LG\ M\ for\ Powerline
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols = {}
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline#extensions#tabline#enabled = 1     " Show buffers
let g:airline#extensions#tabline#fnamemod = ':t' " Only show buffer file names

" Buffergator settings
let g:buffergator_viewport_split_policy = 'R'

" Gitgutter settings
let g:gitgutter_max_signs = 10000

" Move around windows with Ctrl and movement keys
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map <leader>n :NERDTreeToggle<CR> " Ctrl-n for NERDTree

" Always use vertical diffs
set diffopt+=vertical

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Switch from old to new ruby hash syntax
nmap <leader>h :%s/:\([^=,'"]*\) =>/\1:/gc<CR>

" Turn on spell checking for certain files
autocmd Bufread,BufNewFile *.md setlocal spell
autocmd FileType gitcommit setlocal spell

" Syntax highlighting for es6
autocmd BufRead,BufNewFile *.es6 setfiletype javascript

" Disable hiding quotes for json
let g:vim_json_syntax_conceal = 0
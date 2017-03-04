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
Plugin 'mileszs/ack.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
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
Plugin 'janko-m/vim-test'
Plugin 'valloric/youcompleteme'
Plugin 'mtth/scratch.vim'
Plugin 'ludovicchabant/vim-gutentags'

" Display
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'flazz/vim-colorschemes'

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
Plugin 'flowtype/vim-flow'

" Templating, markdown, etc.
Plugin 'tpope/vim-haml'
Plugin 'plasticboy/vim-markdown'

" Haskell
Plugin 'neovimhaskell/haskell-vim'

" Elm
Plugin 'lambdatoast/elm.vim'

" Elixir
Plugin 'elixir-lang/vim-elixir'

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
set relativenumber
set shortmess=atI

" Tab settings
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

set list listchars=tab:»·,trail:·,nbsp:· " Trailing whitespace

" Show column at 80
set colorcolumn=80

" Tag completion using excuberant ctags
set tags=tags;/
set wildignore+=*/tmp/*,*.so,*.swp,*.zip*/.git/*,*/.bundle/*,*/coverage/*,*/public/*,*/log/*,*/vendor/*,*/doc/*,*.o,*.obj,.git,node_modules/**,bower_components/**,**/node_modules/**,_build/**,deps/**,*.beam

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
syntax enable
set background=dark
if $SSH_CONNECTION
  let g:solarized_termcolors=256
endif
colorscheme solarized

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor " Use Ag over Grep
  let g:ackprg = 'ag --vimgrep'
  let g:ctrlp_user_command = 'ag %s --path-to-ignore ~/.agignore -l --hidden --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

" Syntastic settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
"let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': [], 'passive_filetypes': ['ruby'] }
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [], 'passive_filetypes': [] }
let g:syntastic_ruby_checkers = ['rubocop', 'reek']
let g:syntastic_javascript_checkers = ['eslint', 'flow']
let g:syntastic_html_checkers = ['eslint', 'flow']
let g:syntastic_javascript_flow_exe = 'flow'
let g:syntastic_haskell_checkers = ['hlint']
let g:syntastic_python_checkers = ['pep8']

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

map <leader>n :NERDTreeToggle<CR> " leader-n for NERDTree

" Always use vertical diffs
set diffopt+=vertical

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Switch from old to new ruby hash syntax
nmap <leader>h :%s/:\([^=,'"]*\) =>/\1:/gc<CR>

" Turn on spell checking for certain files
autocmd Bufread,BufNewFile *.md setlocal spell
autocmd FileType gitcommit setlocal spell

" Syntax highlighting for es6 and flow
autocmd BufRead,BufNewFile *.es6 setfiletype javascript
let g:javascript_plugin_flow = 1

" Disable hiding quotes for json
let g:vim_json_syntax_conceal = 0

" JSX in js files
let g:jsx_ext_required = 0

" Elixir
autocmd FileType elixir map <leader><space> :TestFile<CR>

" Disable flow type checking on save
let g:flow#enable = 0
autocmd FileType javascript map <leader><space> :FlowType<CR>

let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_key_invoke_completion = '<leader><tab>'

" Python
au FileType python setl sw=2 sts=2 et

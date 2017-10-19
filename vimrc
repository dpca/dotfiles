" Vim settings
set nocompatible

" Use vim-plug for bundle management https://github.com/junegunn/vim-plug

" Automatically install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if has('nvim')
  let g:python_host_prog  = '/usr/local/bin/python2'
  let g:python3_host_prog  = '/usr/local/bin/python3'
endif

call plug#begin('~/.vim/bundle')

" Support
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ervandew/supertab'
Plug 'honza/vim-snippets'
Plug 'janko-m/vim-test'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'junegunn/vim-easy-align'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mbbill/undotree'
Plug 'mileszs/ack.vim'
Plug 'mtth/scratch.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'w0rp/ale'
Plug 'SirVer/ultisnips'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'valloric/youcompleteme', { 'do': './install.py' }
Plug 'vim-scripts/matchit.zip'

" Display
Plug 'altercation/vim-colors-solarized'
Plug 'bronson/vim-trailing-whitespace'
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Ruby
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'vim-scripts/ruby-matchit', { 'for': 'ruby' }

" Javascript
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'elzr/vim-json', { 'for': 'javascript' }
Plug 'flowtype/vim-flow', { 'for': 'javascript' }
Plug 'kchmck/vim-coffee-script', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }

" Templating, markdown, etc.
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'tpope/vim-haml', { 'for': 'haml' }

" Haskell
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }

" Elm
Plug 'lambdatoast/elm.vim', { 'for': 'elm' }

" Elixir
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }

" All of your Plugins must be added before the following line
call plug#end()

let mapleader = ";" " Leader

set backspace=2   " Make backspace behave like in other programs
set colorcolumn=80 " Show column at 80
set diffopt+=vertical " Always use vertical diffs
set laststatus=2
set list listchars=tab:»·,trail:·,nbsp:· " Trailing whitespace
set nobackup
set noswapfile
set nowritebackup
set number
set relativenumber
set ruler
set shortmess=atI
set showcmd

" Tab settings
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Persistent undo
set undofile
set undodir=~/.vim/undo
set undolevels=1000
set undoreload=10000

" Search settings
set incsearch
set hlsearch
set ignorecase
set infercase
set smartcase

" Tag completion using excuberant ctags
set tags=tags;/
set wildignore+=*/tmp/*,*.so,*.swp,*.zip*/.git/*,*/.bundle/*,*/coverage/*,*/public/*,*/log/*,*/vendor/*,*/doc/*,*.o,*.obj,.git,node_modules/**,bower_components/**,**/node_modules/**,_build/**,deps/**,*.beam

" Move around windows with Ctrl and movement keys
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Speedier viewport scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

nmap <leader>hs :let @/=""<CR>
map <leader>n :NERDTreeToggle<CR> " leader-n for NERDTree
nnoremap <leader><leader> <c-^> " Switch between the last two files

" EasyAlign settings
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" YCM settings
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_key_invoke_completion = '<leader><tab>'
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" UltiSnips settings
let g:UltiSnipsExpandTrigger = "<leader><tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Solarized color scheme
syntax enable
set background=dark
if $SSH_CONNECTION
  let g:solarized_termcolors=256
  let g:solarized_termtrans=1
endif
colorscheme solarized

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor " Use Ag over Grep
  let g:ackprg = 'ag --vimgrep'
endif

nnoremap <C-p> :FZF<CR>

let g:ale_linters = {
\ 'javascript': ['eslint', 'flow'],
\ 'ruby': ['rubocop', 'reek'],
\}
let g:ale_fixers = {
\ 'javascript': ['prettier'],
\}
let g:ale_javascript_eslint_use_global = 1
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5'
let g:ale_lint_delay = 2000

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

" Turn on spell checking for certain files
autocmd Bufread,BufNewFile *.md setlocal spell
autocmd FileType gitcommit setlocal spell

" Javascript settings
autocmd BufRead,BufNewFile *.es6 setfiletype javascript
let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0 " JSX in js files
let g:vim_json_syntax_conceal = 0 " Disable hiding quotes for json
let g:flow#enable = 0 " Disable flow type checking on save
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.php, *.jsx"
autocmd FileType javascript map <leader><space> :FlowType<CR>
"autocmd FileType javascript set formatprg=prettier\ --stdin\ --parser\ flow\ --single-quote\ --trailing-comma\ es5

" Elixir settings
autocmd FileType elixir map <leader><space> :TestFile<CR>

" Python settings
au FileType python setl sw=2 sts=2 et

" Ruby settings
nmap <leader>h :%s/:\([^=,'"]*\) =>/\1:/gc<CR>

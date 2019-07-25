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
  let g:python_host_prog  = 'python2'
  let g:python3_host_prog = 'python3'
endif

call plug#begin('~/.vim/bundle')

" Support
Plug 'christoomey/vim-tmux-navigator'
Plug 'docunext/closetag.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'ervandew/supertab'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
"Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/matchit.zip'
Plug 'w0rp/ale'

" Completion
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}

" Display
Plug 'altercation/vim-colors-solarized'
Plug 'bronson/vim-trailing-whitespace'
Plug 'flazz/vim-colorschemes'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'mengelbrecht/lightline-bufferline'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Javascript
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

" Typescript
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }

" Ruby
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'vim-scripts/ruby-matchit', { 'for': 'ruby' }

" Haskell
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }

" Elm
Plug 'elmcast/elm-vim', { 'for': 'elm' }

" Reason
Plug 'reasonml-editor/vim-reason-plus', { 'for': 'reason' }

" Templating, markdown, etc.
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

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

" This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

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

" Solarized color scheme
syntax enable
set background=dark
if $SSH_CONNECTION
  let g:solarized_termcolors=256
  let g:solarized_termtrans=1
endif
colorscheme solarized

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('rg')
  set grepprg=rg\ --nogroup\ --nocolor " Use Ag over Grep
  let g:ackprg = 'rg --vimgrep'
endif

nnoremap <C-p> :FZF<CR>

let g:SuperTabDefaultCompletionType = '<C-n>'

" ALE settings
"
"let g:ale_enabled = 0
let g:ale_linters = {
\ 'javascript': ['eslint', 'flow'],
\ 'typescript': ['tslint'],
\ 'python': ['flake8', 'pylint'],
\ 'ruby': ['rubocop', 'reek'],
\}
let g:ale_fixers = {
\ 'javascript': ['prettier'],
\}
let g:ale_javascript_eslint_use_global = 1
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5'
let g:ale_lint_delay = 2000

nmap <silent> [v <Plug>(ale_previous_wrap)
nmap <silent> ]v <Plug>(ale_next_wrap)

" Coc settings

set hidden " Required for operations modifying multiple buffers like rename.
set showtabline=2 " Always show tabline
set shortmess+=c " don't give |ins-completion-menu| messages.

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> <leader><space> :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Lightline settings

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left':  [
      \     [ 'mode', 'paste' ],
      \     [ 'gitbranch', 'modified' ],
      \     [ 'filename' ],
      \     [ 'cocstatus' ],
      \   ],
      \   'right': [
      \     [ 'lineinfo' ],
      \     [ 'percent' ],
      \     [ 'fileformat', 'fileencoding', 'filetype' ],
      \     [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
      \   ],
      \ },
      \ 'tabline': {
      \   'left': [ [ 'buffers' ] ],
      \   'right': [ [ ] ],
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'cocstatus': 'coc#status'
      \ },
      \ 'component_expand': {
      \   'linter_checking': 'lightline#ale#checking',
      \   'linter_warnings': 'lightline#ale#warnings',
      \   'linter_errors': 'lightline#ale#errors',
      \   'linter_ok': 'lightline#ale#ok',
      \   'buffers': 'lightline#bufferline#buffers',
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel',
      \ },
      \ }

let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_warnings = "\uf071 "
let g:coc_status_warning_sign = "\uf071 "
let g:lightline#ale#indicator_errors = "\uf05e "
let g:coc_status_error_sign = "\uf05e "
let g:lightline#ale#indicator_ok = "\uf00c"
let g:lightline#bufferline#filename_modifier = ':t'

" Gitgutter settings
let g:gitgutter_max_signs = 10000

" Tagbar
nmap <F8> :TagbarToggle<CR>

" Turn on spell checking for certain files
autocmd Bufread,BufNewFile *.md setlocal spell
autocmd Bufread,BufNewFile *.rst setlocal spell
autocmd FileType gitcommit setlocal spell

" Javascript settings
autocmd BufRead,BufNewFile *.es6 setfiletype javascript
let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0 " JSX in js files
let g:vim_json_syntax_conceal = 0 " Disable hiding quotes for json
let g:flow#enable = 0 " Disable flow type checking on save
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.php, *.jsx"
"autocmd FileType javascript set formatprg=prettier\ --stdin\ --parser\ flow\ --single-quote\ --trailing-comma\ es5

" Ruby settings
autocmd FileType ruby nmap <leader>h :%s/:\([^=,'"]*\) =>/\1:/gc<CR>

" Haskell settings
autocmd FileType haskell setlocal tabstop=4 shiftwidth=4

" Elm settings
autocmd FileType elm setlocal tabstop=4 shiftwidth=4

" Markdown settings
let g:vim_markdown_folding_disabled = 1
autocmd FileType rst normal zR

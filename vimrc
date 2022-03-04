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
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'mbbill/undotree'
Plug 'preservim/nerdcommenter'
"Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/matchit.zip'
Plug 'nvim-lua/plenary.nvim'

" Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'amiralies/coc-flow', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'fannheyward/coc-pyright', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-solargraph', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
"Plug 'ruanyl/coc-apollo', {'do': 'yarn install --frozen-lockfile', 'for': ['typescript', 'typescriptreact']}

" Display
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'bronson/vim-trailing-whitespace'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim'
Plug 'feline-nvim/feline.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Navigation
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Git
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'

" All of your Plugins must be added before the following line
call plug#end()

let mapleader = ";" " Leader

set backspace=2   " Make backspace behave like in other programs
set colorcolumn=80 " Show column at 80
set diffopt+=vertical " Always use vertical diffs
set laststatus=2
set list listchars=tab:»·,trail:·,nbsp:· " Trailing whitespace
set number
set ruler
set shortmess=atI
set showcmd
set signcolumn=yes
set splitbelow " Preview window on bottom

" Protect changes between writes
set swapfile
set directory^=~/.vim/swap//

set writebackup " Protect against crash during write
set nobackup " Do not persist backup after successful write
set backupcopy=auto " Use rename-and-write-new method whenever safe
set backupdir^=~/.vim/backup//

" Tab settings
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Persistent undo
set undofile
set undodir^=~/.vim/undo//
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

" Move around windows with Ctrl and movement keys
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Speedier viewport scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

nmap <leader>hs :let @/=""<CR>
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
nnoremap <leader><leader> <c-^> " Switch between the last two files

" EasyAlign settings
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Color scheme
syntax enable
set termguicolors
color dracula

" Use ripgrep
if executable('rg')
  set grepprg=rg\ --nogroup\ --nocolor " Use rg over Grep
  let g:ackprg = 'rg --vimgrep'
endif

" Telescope
nnoremap <C-p> <cmd>Telescope find_files<CR>

" Coc settings

set encoding=utf-8
set hidden " Required for operations modifying multiple buffers like rename.
set showtabline=2 " Always show tabline
set shortmess+=c " don't give |ins-completion-menu| messages.

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent> <leader><space> :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

"nnoremap <silent> <leader><space> :call <SID>show_hover()<CR>
"function! s:show_hover()
  "if (index(['vim','help'], &filetype) >= 0)
    "execute 'h '.expand('<cword>')
  "else
    "call CocActionAsync('doHover')
  "endif
"endfunction

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Turn on spell checking for certain files
autocmd Bufread,BufNewFile *.md setlocal spell
autocmd Bufread,BufNewFile *.rst setlocal spell
autocmd FileType gitcommit setlocal spell

" Javascript settings
autocmd BufRead,BufNewFile *.es6 setfiletype javascript
let g:jsx_ext_required = 0 " JSX in js files
let g:vim_json_syntax_conceal = 0 " Disable hiding quotes for json
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.php, *.jsx"

" Haskell settings
autocmd FileType haskell setlocal tabstop=4 shiftwidth=4

" Elm settings
autocmd FileType elm setlocal tabstop=4 shiftwidth=4

" Markdown settings
let g:vim_markdown_folding_disabled = 1
autocmd FileType rst normal zR

lua << EOF
require("bufferline").setup{}
require('feline').setup()
require('nvim-tree').setup{}
require('gitsigns').setup()
require('telescope').load_extension('fzf')
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true
  }
}
EOF

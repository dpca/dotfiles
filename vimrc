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
Plug 'nvim-lua/plenary.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/vim-easy-align'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'alvan/vim-closetag'
Plug 'mbbill/undotree'
Plug 'sheerun/vim-polyglot'
Plug 'vim-scripts/matchit.zip'
Plug 'AndrewRadev/splitjoin.vim'

" Completion
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind-nvim'

" Display
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'bronson/vim-trailing-whitespace'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim'
Plug 'feline-nvim/feline.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'folke/trouble.nvim'

" Navigation
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Git
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'

" Languages
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'vim-ruby/vim-ruby'
Plug 'NoahTheDuke/vim-just'
Plug 'glench/vim-jinja2-syntax'
Plug 'simrat39/rust-tools.nvim', { 'for': 'rust' }
Plug 'ray-x/go.nvim'

" All of your Plugins must be added before the following line
call plug#end()

let mapleader = ";" " Leader

set autoread
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

" Filetype detection
filetype on
filetype plugin on
filetype indent on

" Tab settings
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Persistent undo
set undofile
set undodir^=~/.vim/undo//

" Search settings
set incsearch
set hlsearch
set ignorecase
set infercase
set smartcase

" This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

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

" Trouble
nnoremap <leader>x <cmd>TroubleToggle<cr>

" Telescope
nnoremap <C-p> :lua require('telescope.builtin').find_files({layout_strategy='vertical',find_command={'rg', '--files', '--hidden'}})<cr>

set encoding=utf-8
set hidden " Required for operations modifying multiple buffers like rename.
set showtabline=2 " Always show tabline
set shortmess+=c " don't give |ins-completion-menu| messages.

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

" Helm settings
autocmd BufRead,BufNewFile */templates/*.yml set ft=helm

" Terraform settings
autocmd BufWritePre *.tfvars lua vim.lsp.buf.format()
autocmd BufWritePre *.tf lua vim.lsp.buf.format()

" Make settings
autocmd FileType make setlocal noexpandtab tabstop=8

"highlight ExtraWhitespace ctermbg=red guibg=red
"match ExtraWhitespace /\s\+$/

augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup END

lua << EOF
require("bufferline").setup{}
require('feline').setup()
require('nvim-tree').setup{}
require('gitsigns').setup()
require('telescope').load_extension('fzf')
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "bash",
    "dockerfile",
    "go",
    "haskell",
    "helm",
    "javascript",
    "json",
    "jsonnet",
    "lua",
    "python",
    "ruby",
    "rust",
    "terraform",
    "toml",
    "typescript",
    "vim",
    "yaml",
  },
  sync_install = false,
  highlight = {
    enable = true
  }
}
require("trouble").setup{}
local rt = require("rust-tools");

-- Setup nvim-cmp.
local cmp = require'cmp'
local lspkind = require('lspkind')

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

cmp.setup({
  formatting = {
    format = lspkind.cmp_format({with_text = false, maxwidth = 50})
  },
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(':', {
--  sources = cmp.config.sources({
--    { name = 'path' }
--  }, {
--    { name = 'cmdline' }
--  })
--})

-- Setup lspconfig.
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)

local on_attach = function(client, bufnr)
  -- Enable completion
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Key mappings
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader><space>', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>j', '<cmd>lua vim.diagnostic.open_float(nil, {focus=false})<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
end

vim.o.updatetime = 250
-- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  float = { border = "single" },
})

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local lsp_servers = {
  { "ansiblels" },
  { "bashls" },
  { "cssls" },
  { "eslint" },
  { "flow" },
  { "gopls" },
  { "hls" },
  { "html" },
  { "jsonls" },
  { "solargraph" },
  { "terraformls" },
  { "ty" },
  {
    "ts_ls",
    {
      filetypes = { "typescript", "typescriptreact", "typescript.tsx" }
    }
  },
  {
    "jsonnet_ls",
    {
      settings = {
        ext_vars = {},
        formatting = {
          -- default values
          Indent              = 2,
          MaxBlankLines       = 2,
          StringStyle         = 'single',
          CommentStyle        = 'slash',
          PrettyFieldNames    = true,
          PadArrays           = false,
          PadObjects          = true,
          SortImports         = true,
          UseImplicitPlus     = true,
          StripEverything     = false,
          StripComments       = false,
          StripAllButComments = false,
        },
      },
    }
  },
}

for _, lsp in ipairs(lsp_servers) do
  config = {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    }
  }

  local name, lspconfig = lsp[1], lsp[2]
  if lspconfig then
    for k,v in pairs(lspconfig) do
      config[k] = v
    end
  end

  vim.lsp.enable(name)
  vim.lsp.config(name, config)
end

rt.setup({
  tools = {
    inlay_hints = {
      auto = false
    },
  },
  server = {
    on_attach = on_attach,
    capabilities = capabilities},
})

vim.lsp.set_log_level("off")
EOF

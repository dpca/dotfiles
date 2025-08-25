-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    { "akinsho/bufferline.nvim", dependencies = "nvim-tree/nvim-web-devicons" },
    { "christoomey/vim-tmux-navigator" },
    { "dracula/vim", as = "dracula" },
    { "hrsh7th/nvim-cmp", dependencies = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer" } },
    { "lewis6991/gitsigns.nvim", },
    { "nvim-telescope/telescope.nvim", dependencies = { 'nvim-lua/plenary.nvim' } },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-tree/nvim-tree.lua" },
    { "nvim-treesitter/nvim-treesitter", lazy = false, build = ":TSUpdate" },
    { "tpope/vim-repeat" },
    { "tpope/vim-surround" },
  },
  install = { colorscheme = { "dracula" } },
  checker = { enabled = true },
  rocks = { enabled = false },
})

vim.g.mapleader = ';' -- Leader key

-- General settings
vim.o.autoread = true -- Re-read files when changed on disk
vim.o.backspace = 'indent,eol,start' -- Make backspace behave like in other programs
vim.o.colorcolumn = '80' -- Show column at 80
vim.o.diffopt = 'vertical' -- Always use vertical diffs
vim.o.encoding = 'utf-8'
vim.o.expandtab = true
vim.o.hidden = true
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.laststatus = 2
vim.o.list = true
vim.o.listchars = 'tab:»·,trail:·,nbsp:·' -- Trailing whitespace
vim.o.number = true
vim.o.ruler = true
vim.o.shortmess = 'atI'
vim.o.showcmd = true
vim.o.showtabline = 2
vim.o.signcolumn = 'yes'
vim.o.smartcase = true
vim.o.splitbelow = true -- Preview window on bottom
vim.o.shiftwidth = 2
vim.o.shiftround = true
vim.o.tabstop = 2
vim.o.termguicolors = true
vim.o.updatetime = 250

-- Backup and undo settings
vim.o.swapfile = true
vim.o.writebackup = true -- Protect against crash during write
vim.o.backup = false -- Do not persist backup after successful write
vim.o.backupcopy = 'auto' -- Use rename-and-write-new method whenever safe
vim.o.undofile = true

vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

-- Filetype detection
vim.cmd('filetype on')
vim.cmd('filetype plugin on')
vim.cmd('filetype indent on')

-- Use ripgrep when available
if vim.fn.executable('rg') == 1 then
  vim.o.grepprg = 'rg --nogroup --nocolor'
  vim.g.ackprg = 'rg --vimgrep'
end

-- Clear search highlight
vim.keymap.set('n', '<CR>', ':noh<CR><CR>', { silent = true, noremap = true })

-- Split navigation
vim.keymap.set('n', '<C-j>', '<C-W>j', { noremap = true })
vim.keymap.set('n', '<C-k>', '<C-W>k', { noremap = true })
vim.keymap.set('n', '<C-h>', '<C-W>h', { noremap = true })
vim.keymap.set('n', '<C-l>', '<C-W>l', { noremap = true })

-- Faster viewport scrolling
vim.keymap.set('n', '<C-e>', '3<C-e>', { noremap = true })
vim.keymap.set('n', '<C-y>', '3<C-y>', { noremap = true })

-- Switch between last 2 files
vim.keymap.set('n', '<leader><leader>', '<c-^>', { desc = "Switch to last buffer" })

-- Highlight yanked text
local highlight_yank_group = vim.api.nvim_create_augroup('highlight_yank', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  group = highlight_yank_group,
  pattern = '*',
  callback = function()
    vim.hl.on_yank({ higroup = "IncSearch", timeout = 700 })
  end,
})

-- Spell checking for certain file types
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = "*.md", command = "setlocal spell" })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = "*.rst", command = "setlocal spell" })
vim.api.nvim_create_autocmd({ "FileType" }, { pattern = "gitcommit", command = "setlocal spell" })

-- Language specific settings
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = "*.es6", command = "setfiletype javascript" })
vim.api.nvim_create_autocmd({ "FileType" }, { pattern = "haskell", command = "setlocal tabstop=4 shiftwidth=4" })
vim.api.nvim_create_autocmd({ "FileType" }, { pattern = "elm", command = "setlocal tabstop=4 shiftwidth=4" })
vim.api.nvim_create_autocmd({ "FileType" }, { pattern = "rst", command = "normal zR" })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = "*/templates/*.yml", command = "set ft=helm" })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = "*/templates/*.tpl", command = "set ft=helm" })
vim.api.nvim_create_autocmd({ "FileType" }, { pattern = "make", command = "setlocal noexpandtab tabstop=8" })

-- LSP general setup
local lspconfig = {}

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { noremap = true, silent = true })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { noremap = true, silent = true })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { noremap = true, silent = true })

lspconfig.on_attach = function(_, bufnr)
  local function opts(desc)
    return { noremap = true, silent = true, buffer = bufnr, desc = "LSP " .. desc }
  end

  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts "Go to declaration")
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts "Go to definition")
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts "Go to implementation")
  vim.keymap.set("n", "<leader><space>", vim.lsp.buf.hover, opts "Hover")
end

lspconfig.capabilities = vim.lsp.protocol.make_client_capabilities()

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    lspconfig.on_attach(_, args.buf)
  end,
})

-- LSP configs
vim.lsp.config("*", { capabilities = lspconfig.capabilities, root_markers = { ".git" } })

local lsp_servers = {
  { "bashls", { cmd = { 'bash-language-server', 'start' }, filetypes = { "bash", "sh" } } },
  { "gopls", { cmd = { 'gopls' }, filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' } } },
  { "helm_ls", { cmd = { 'helm_ls', 'serve' }, filetypes = { 'helm', 'yaml.helm-values' } } },
  { "jsonls", { cmd = { 'vscode-json-language-server', '--stdio' }, filetypes = { 'json', 'jsonc' } } },
  { "jsonnet_ls", { cmd = { 'jsonnet-language-server' }, filetypes = { 'jsonnet', 'libsonnet' } } },
  { "ruff", { cmd = { "ruff", "server" }, filetypes = { "python" } } },
  { "terraformls", { cmd = { 'terraform-ls', 'serve' }, filetypes = { 'terraform', 'terraform-vars' } } },
  { "ty", { cmd = { "ty", "server" }, filetypes = { "python" } } },
}

for _, lsp in ipairs(lsp_servers) do
  local name, lspconfig = lsp[1], lsp[2]
  vim.lsp.config(name, lspconfig)
  vim.lsp.enable(name)
end

-- Plugin config
vim.cmd("color dracula")

require("bufferline").setup{}
require('gitsigns').setup{}
require('nvim-tree').setup{}
require('telescope').load_extension 'fzf'

vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<C-p>', function()
  require('telescope.builtin').find_files { layout_strategy='vertical', find_command={'rg', '--files', '--hidden'} }
end)

require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  ensure_installed = {
    "bash",
    "dockerfile",
    "go",
    "helm",
    "javascript",
    "json",
    "jsonnet",
    "lua",
    "python",
    "rust",
    "terraform",
    "toml",
    "typescript",
    "yaml",
  },
}

local cmp = require('cmp')

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup {
  mapping = {
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      end
    end, { "i", "s" }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  })
}

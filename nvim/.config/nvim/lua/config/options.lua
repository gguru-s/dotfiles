-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.wo.number = true
vim.o.mouse = "a"
vim.o.breakindent = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.opt.signcolumn = "yes:1"
vim.opt.numberwidth = 4
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.termguicolors = true
vim.o.relativenumber = true
vim.o.completeopt = "menuone,noselect"
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.opt.conceallevel = 1
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")
vim.opt.swapfile = false
vim.opt.autochdir = false -- Don't auto change directories when openining files
vim.opt.autoread = true -- Auto reload files changed outside vim
vim.opt.autowrite = false -- Don't auto save

vim.o.cursorline = true

-- Folding settings
vim.opt.foldmethod = "expr" -- Use expression for folding
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- Use treesitter for folding
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.o.foldcolumn = "0"
vim.opt.foldnestmax = 4
vim.o.foldenable = false
--
-- vim.o.foldmethod = "indent"
-- vim.o.foldenable = false
-- vim.o.foldlevelstart = 99

-- Minimal number of screen lines to keep above and below the cursor.
-- vim.o.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

-- Displays netrw in tree style
-- vim.cmd("let g:netrw_liststyle = 3")

vim.opt.splitright = true --split vertical window to right
vim.opt.splitbelow = true --split horizontal window to bottom%

-- vim.o.winborder = "single"
vim.opt.fillchars = { eob = " " }

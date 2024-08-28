-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.wo.number = true
vim.o.mouse = "a"
vim.o.breakindent = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.wo.signcolumn = "yes"
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.termguicolors = true
vim.o.relativenumber = true
vim.o.completeopt = "menuone,noselect"
vim.o.tabstop = 8
vim.o.shiftwidth = 8
vim.o.softtabstop = 8
vim.o.foldmethod = "indent"
vim.o.foldenable = false
vim.opt.conceallevel = 1
-- Displays netrw in tree style
-- vim.cmd("let g:netrw_liststyle = 3")

vim.opt.splitright = true --split vertical window to right
vim.opt.splitbelow = true --split horizontal window to bottom%

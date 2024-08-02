-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- VIM specific keymaps
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- vim.keymap.set("n", "bb", ":ls<CR>:b<Space>")
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

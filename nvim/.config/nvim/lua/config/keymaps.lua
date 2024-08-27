-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- VIM specific keymaps
-- Clears search highlight
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
-- keymap for copy to system clipboard in both normal and visual mode
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>p", '"+')
vim.keymap.set("v", "<leader>p", '"+')

vim.keymap.set("n", "<leader>bd", "<cmd>bd<CR>", { desc = "Close current buffer" })

vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
vim.keymap.set("n", "<leader>sq", "<C-w>q", { desc = "Quit current window" })
vim.keymap.set("n", "<leader>so", "<C-w>o", { desc = "Close all other windows" })
vim.keymap.set("n", "<leader>sw", "<C-w>w", { desc = "Switch windows" })
vim.keymap.set("n", "<leader>sH", "<C-w><S-h>", { desc = "Move window to bottom" })
vim.keymap.set("n", "<leader>sL", "<C-w><S-l>", { desc = "Move window to right" })

-- using vim maximizer which saves the previous size of the window and restores
-- vim.keymap.set("n", "<leader>sf", "<C-w>_<C-w>|", { desc = "Make current window fullscreen" })


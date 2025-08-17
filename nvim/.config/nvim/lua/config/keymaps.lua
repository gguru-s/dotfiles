-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- VIM specific keymaps
-- Clears search highlight
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- keymap for copy to system clipboard in both normal and visual mode
vim.keymap.set("n", "<leader>y", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>p", '"+p', { desc = "Paste from system clipboard" })
vim.keymap.set("v", "<leader>p", '"+p')
vim.keymap.set("n", "<leader>P", ":pu +<CR>", { desc = "Paste from system clipboard on next line" })
vim.keymap.set("v", "<leader>P", ":pu +<CR>", { desc = "Paste from system clipboard on next line" })

-- Delete without yanking
vim.keymap.set({ "n", "v" }, "<leader>dd", '"_d', { desc = "Delete line without yanking" })
vim.keymap.set({ "n", "v" }, "<leader>xx", '"_x', { desc = "Delete character without yanking" })

vim.keymap.set("n", "<leader>bd", "<cmd>bd<CR>", { desc = "Close current buffer" })
vim.keymap.set({ "n", "v" }, "<leader>bb", "<C-^><cr>", { desc = "Go to last opened file" })

vim.keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>wh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>we", "<C-w>=", { desc = "Make [S]plits [E]qual size" })
vim.keymap.set("n", "<leader>wq", "<C-w>q", { desc = "Quit current window" })
vim.keymap.set("n", "<leader>wo", "<C-w>o", { desc = "Close all other windows" })
vim.keymap.set("n", "<leader>ww", "<C-w>w", { desc = "Switch windows" })
vim.keymap.set("n", "<leader>sH", "<C-w><S-h>", { desc = "Move window to bottom" })
vim.keymap.set("n", "<leader>sL", "<C-w><S-l>", { desc = "Move window to right" })

-- Window resize
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- using vim maximizer which saves the previous size of the window and restores
-- vim.keymap.set("n", "<leader>sf", "<C-w>_<C-w>|", { desc = "Make current window fullscreen" })

vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
vim.keymap.set("n", "<leader>tq", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- Move lines up/down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Better indenting in visual mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Quick file navigation
-- vim.keymap.set("n", "<leader>ee", ":Explore<CR>", { desc = "Open file explorer" })
-- vim.keymap.set("n", "<leader>fl", ":find ", { desc = "Find file" })

-- vim.api.nvim_set_hl(0, "CursorLine", { bg = "#282828" })
-- vim.api.nvim_set_hl(0, "CursorLine", { bg = "#32302f" })
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#2a2a2a" })

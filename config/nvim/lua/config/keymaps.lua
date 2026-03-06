-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Window navigation with <leader>w + arrow keys (replaces <leader>wh/j/k/l)
vim.keymap.set("n", "<leader>w<Left>", "<C-w>h", { desc = "Go to Left Window" })
vim.keymap.set("n", "<leader>w<Down>", "<C-w>j", { desc = "Go to Lower Window" })
vim.keymap.set("n", "<leader>w<Up>", "<C-w>k", { desc = "Go to Upper Window" })
vim.keymap.set("n", "<leader>w<Right>", "<C-w>l", { desc = "Go to Right Window" })

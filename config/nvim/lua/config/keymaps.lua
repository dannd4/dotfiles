-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local map = vim.keymap.set

map("n", "<S-u>", "<C-r>", { desc = "Redo" })
map("n", "<leader>q", "<cmd>:bd<cr>", { desc = "Quit Window" })

map({ "i", "s" }, "<C-h>", "<Left>", { desc = "Move cursor left" })
map({ "i", "s" }, "<C-j>", "<Down>", { desc = "Move cursor down" })
map({ "i", "s" }, "<C-k>", "<Up>", { desc = "Move cursor up" })
map({ "i", "s" }, "<C-l>", "<Right>", { desc = "Move cursor right" })

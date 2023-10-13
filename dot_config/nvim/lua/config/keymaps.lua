-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("i", "<C-d>", "<right><C-h>", { desc = "", remap = true })
map("i", "<M-f>", "<C-Right>", { desc = "", remap = true })
map("n", "<M-f>", "w", { desc = "", remap = true })
map("i", "<M-b>", "<C-Left>", { desc = "", remap = true })
map("n", "<M-b>", "b", { desc = "", remap = true })
map({ "n", "t" }, "<C-z>", "<C-/>", { desc = "", remap = true })

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("i", "<C-d>", "<right><C-h>", { desc = "", remap = true })
map("i", "<M-f>", "<C-Right>", { desc = "", remap = true })
map("i", "<M-b>", "<C-Left>", { desc = "", remap = true })
map("n", "<M-f>", "w", { desc = "", remap = true })
map("n", "<M-b>", "b", { desc = "", remap = true })

map("i", "<M-Right>", "<C-Right>", { desc = "", remap = true })
map("i", "<M-Left>", "<C-Left>", { desc = "", remap = true })
map("n", "<M-b>", "b", { desc = "", remap = true })
map("n", "<M-Right>", "w", { desc = "", remap = true })
map("n", "<M-Left>", "b", { desc = "", remap = true })
map("i", "<D-Left>", "<C-A>", { desc = "", remap = true })
map("i", "<D-Right>", "<C-E>", { desc = "", remap = true })

map("n", "<D-a>", function()
  vim.cmd("normal! ggVG")
end, { desc = "Select All", remap = true })
map("n", "<D-s>", function()
  vim.api.nvim_command("write")
end, { desc = "Save fil ", remap = true })

-- map({ "n", "t" }, "<C-z>", "<C-/>", { desc = "", remap = true })
map({ "n", "t" }, "<C-z>", function()
  Snacks.terminal()
end, { desc = "Terminal (cwd)" })

map("i", "<Esc>[1;3D", "<C-Right>", { desc = "", remap = true })
map("i", "<Esc>[1;3C", "<C-Left>", { desc = "", remap = true })

--
map("i", "<C-F>", "<Right>", { desc = "", remap = true })
map("i", "<C-B>", "<Left>", { desc = "", remap = true })

-- to beginning/end of line
map("i", "<C-e>", "<End>", { desc = "", remap = true })
map("i", "<C-a>", "<Home>", { desc = "", remap = true })

-- typo
vim.cmd([[
command -complete=file -bang -nargs=? W  :w<bang> <args>
command -complete=file -bang -nargs=? Wq :wq<bang> <args>
command -complete=file -bang -nargs=? Q :q<bang> <args>
command -complete=file -bang -nargs=? WQ :wq<bang> <args>
]])

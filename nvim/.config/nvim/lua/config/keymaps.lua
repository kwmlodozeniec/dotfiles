-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Command mode with Ctrl+p
vim.keymap.set("n", "-", ":Oil<CR>", { desc = "Open parent director in Oil" })

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>hc", function()
  vim.cmd("edit " .. vim.fn.stdpath("config") .. "/cheatsheet.md")
end, { desc = "Cheatsheet" })

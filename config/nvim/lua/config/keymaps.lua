-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Use semicolon for command mode
map("n", ";", ":", { desc = "CMD enter command mode" })

-- Quick escape from insert mode
map("i", "jk", "<ESC>")
map("i", "jj", "<ESC>")

-- Alternative command mode with leader
map("n", "<leader><leader>", ":", { desc = "Command mode" })

-- Keep cursor centered when scrolling
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Quick edit keymaps file
map("n", "<leader>ck", function()
  vim.cmd("edit " .. vim.fn.stdpath("config") .. "/lua/config/keymaps.lua")
end, { desc = "Edit keymaps.lua" })

-- Telescope live grep
map("n", "<leader>fg", function()
  require("telescope.builtin").live_grep()
end, { desc = "Find text (grep)" })

-- Paste with new line above/below
map("n", "<leader>p", "O<Esc>p", { desc = "Paste above with new line" })
map("n", "<leader>P", "o<Esc>p", { desc = "Paste below with new line" })

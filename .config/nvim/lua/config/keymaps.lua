vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local map = vim.keymap.set

-- Lazy
map("n", "<leader>l", ":Lazy<cr>", { desc = "lazy.nvim", silent = true })

-- Save
map({ "n", "i" }, "<c-s>", "<esc>:w<cr>", { desc = "Save", silent = true })

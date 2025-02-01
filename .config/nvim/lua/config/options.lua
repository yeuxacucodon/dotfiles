vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

local opt = vim.opt

-- UI
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.termguicolors = true
opt.numberwidth = 4
opt.signcolumn = "yes"
vim.opt.fillchars:append('eob: ') -- Hide end of buffer char

-- Editing
opt.tabstop = 2
opt.expandtab = true
opt.shiftwidth = 2

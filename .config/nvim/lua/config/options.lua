-- Disable default providers
vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

local opt = vim.opt

-- Options
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.termguicolors = true
opt.numberwidth = 4
opt.signcolumn = "yes"
vim.opt.fillchars:append("eob: ") -- Hide end of buffer char
opt.wildmode = "longest:full,full"
opt.tabstop = 2
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.virtualedit = "block"
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200
opt.shiftround = true
opt.scrolloff = 4
opt.ignorecase = true
opt.smartcase = true
opt.splitbelow = true
opt.splitright = true
opt.splitkeep = "screen"

-- LSP
vim.diagnostic.config({
  underline = true,
  update_in_insert = false,
  virtual_text = {
    spacing = 4,
    source = "if_many",
    prefix = " ",
  },
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.HINT] = "󰌵",
      [vim.diagnostic.severity.INFO] = "",
    },
  },
})

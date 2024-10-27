return {
  {
    "2giosangmitom/nightfall.nvim",
    dir = "~/Workspace/nightfall.nvim/",
    init = function()
      vim.g.nightfall_debug = true
    end,
    opts = {
      transparent = false,
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nightfall",
    },
  },
}

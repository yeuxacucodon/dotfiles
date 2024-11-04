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
      colorscheme = "deepernight",
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        denols = {
          mason = false,
        },
      },
    },
  },

  {
    "vyfor/cord.nvim",
    build = "./build ",
    event = "VeryLazy",
    opts = {},
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_pending = " ",
          package_installed = " ",
          package_uninstalled = " ",
        },
      },
    },
  },
}

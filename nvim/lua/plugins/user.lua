return {
  -- {
  --   "2giosangmitom/nightfall.nvim",
  --   dir = "~/Workspace/nightfall.nvim/",
  --   init = function()
  --     vim.g.nightfall_debug = true
  --   end,
  --   opts = {
  --     transparent = true,
  --   },
  -- },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        denols = {
          mason = false,
        },
        html = {},
        cssls = {},
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

  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "nix" } },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        nix = { "nixfmt" },
      },
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options.component_separators = { left = "", right = "" }
      opts.options.section_separators = { left = "", right = "" }
      opts.sections.lualine_z = { "location" }
      opts.sections.lualine_y = { "progress" }
    end,
  },

  {
    "folke/which-key.nvim",
    opts = {
      preset = "helix",
    },
  },
}

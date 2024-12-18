return {
  {
    "2giosangmitom/nightfall.nvim",
    dir = "~/Workspace/nightfall.nvim",
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
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options.component_separators = { left = "", right = "" }
      opts.options.section_separators = { left = "", right = "" }
    end,
  },

  {
    "stevearc/overseer.nvim",
    opts = {
      templates = { "builtin", "build_cpp", "build_c", "run_bin" },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = {
        "nix",
        "just",
      }
    end,
  },

  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      opts.keymap = { preset = "super-tab" }
    end,
  },

  {
    "catppuccin",
    enabled = false,
  },

  {
    "stevearc/oil.nvim",
    cmd = "Oil",
    keys = {
      { "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
    },
    opts = {},
    dependencies = { "echasnovski/mini.icons" },
  },

  {
    "persistence.nvim",
    enabled = false,
  },

  {
    "snacks.nvim",
    opts = {
      scroll = {
        enabled = false,
      },
    },
  },
}

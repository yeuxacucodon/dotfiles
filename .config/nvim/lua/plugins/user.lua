return {
  {
    "2giosangmitom/nightfall.nvim",
    dir = "~/Workspace/nightfall.nvim/",
    opts = {},
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      popup_border_style = "rounded",
    },
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
    "Saghen/blink.cmp",
    opts = {
      completion = {
        menu = { border = "rounded" },
        documentation = { window = { border = "rounded" } },
      },
      signature = { window = { border = "rounded" } },
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
      templates = { "builtin", "build_cpp", "run_bin" },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = {
        "nix",
        "just",
        "fish",
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
    "stevearc/oil.nvim",
    cmd = "Oil",
    keys = {
      { "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
    },
    opts = {},
    dependencies = { "echasnovski/mini.icons" },
  },

  {
    "markdown-preview.nvim",
    enabled = false,
  },

  {
    "nvzone/showkeys",
    cmd = "ShowkeysToggle",
    opts = {},
  },

  {
    "folke/snacks.nvim",
    opts = {
      scroll = { enabled = false },
    },
  },
}

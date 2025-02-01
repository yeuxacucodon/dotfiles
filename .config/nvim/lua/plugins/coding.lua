return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      servers = {
        lua_ls = {},
        clangd = {},
      },
    },
    config = function(_, opts)
      local lspconfig = require("lspconfig")

      for server, server_opts in pairs(opts.servers) do
        lspconfig[server].setup(server_opts)
      end
    end,
  },

  {
    "stevearc/conform.nvim",
    cmd = "ConformInfo",
    keys = {
      { "<leader>cf", function() require("conform").format({ lsp_format = "fallback" }) end, desc = "Format" },
    },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
      },
    },
  },

  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        { path = "snacks.nvim", words = { "Snacks" } },
      },
    },
  },
}

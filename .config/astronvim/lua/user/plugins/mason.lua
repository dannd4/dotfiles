local utils = require "user.utils"

return {
  { "williamboman/mason.nvim", opts = { PATH = "append" } },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "bashls",
        "cssls",
        "docker_compose_language_service",
        "dockerls",
        "emmet_ls",
        "gopls",
        "graphql",
        "html",
        "jsonls",
        "lua_ls",
        "marksman",
        "pyright",
        "ruff_lsp",
        "sqlls",
        -- "tailwindcss", -- Disabled due to high node CPU usage
        "taplo",
        "tsserver",
        "yamlls",
      },
    },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts)
      opts.ensure_installed = {
        "shellcheck",
        "stylua",
        "black",
        "isort",
        "prettierd",
        "shfmt",
        "hadolint",
      }

      opts.handlers = {
        taplo = function() end, -- disable taplo in null-ls, it's taken care of by lspconfig
      }

      return opts
    end,
  },
}

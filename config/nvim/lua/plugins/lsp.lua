return {
  {
    "mason-org/mason.nvim",
    opts = {
      npm = {
        install_args = { "--min-release-age", 0 },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        ["*"] = {
          keys = {
            { "<C-k>", false, mode = "i" },
          },
        },
      },
    },
  },
  {
    "dmmulroy/ts-error-translator.nvim",
    event = "LspAttach",
    opts = {},
  },
}

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ["*"] = {
          keys = {
            { "<C-k>", false, mode = "i" },
          },
        },
      },
    },
  },
}

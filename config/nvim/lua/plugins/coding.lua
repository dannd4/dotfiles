return {
  {
    "max397574/better-escape.nvim",
    event = "VeryLazy",
    opts = {
      timeout = 300,
      default_mappings = false,
      mappings = {
        i = { j = { k = "<Esc>", j = "<Esc>" } },
      },
    },
  },
  {
    "nvim-mini/mini.splitjoin",
    version = false,
    event = "VeryLazy",
    opts = {},
  },
  {
    "folke/sidekick.nvim",
    opts = {
      cli = {
        mux = {
          backend = "tmux",
          enabled = true,
        },
      },
    },
    keys = {
      {
        "<leader>aa",
        function()
          require("sidekick.cli").toggle()
        end,
        desc = "Sidekick Toggle CLI",
      },
    },
  },
  {
    "nvim-neotest/neotest",
    dependencies = { { "nvim-neotest/neotest-jest" } },
    opts = { adapters = { "neotest-jest" } },
  },
}

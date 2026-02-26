return {
  {
    "nvim-mini/mini.splitjoin",
    version = false,
    event = "VeryLazy",
    opts = {},
  },
  {
    "folke/sidekick.nvim",
    opts = {
      nes = { enabled = false },
      cli = {
        mux = {
          backend = "tmux",
          enabled = true,
          create = "split",
          split = {
            vertical = true, -- vertical or horizontal split
            size = 0.4, -- size of the split (0-1 for percentage)
          },
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
      {
        "<leader>ac",
        function()
          require("sidekick.cli").toggle({ name = "claude", focus = true })
        end,
        desc = "Sidekick Toggle Claude",
      },
      {
        "<leader>ao",
        function()
          require("sidekick.cli").toggle({ name = "opencode", focus = true })
        end,
        desc = "Sidekick Toggle OpenCode",
      },
    },
  },
  {
    "nvim-neotest/neotest",
    dependencies = { { "nvim-neotest/neotest-jest" } },
    opts = { adapters = { "neotest-jest" } },
  },
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters = opts.formatters or {}
      opts.formatters.prettier = {
        prepend_args = {
          "--no-semi",
          "--single-quote",
          "--print-width",
          "100",
          "--config-precedence",
          "prefer-file",
        },
      }
    end,
  },
}

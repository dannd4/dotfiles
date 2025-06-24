---@type LazySpec
return {
  {
    "yetone/avante.nvim",
    ---@class avante.CoreConfig: avante.Config
    opts = {
      provider = "claude",
    },
  },

  {
    "Saghen/blink.cmp",
    version = "^1",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      completion = {
        accept = {
          auto_brackets = {
            blocked_filetypes = { "javascriptreact", "typescriptreact" },
          },
        },
      },
    },
  },

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "User AstroFile",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true, -- Suggest as we start typing
        keymap = {
          accept = false,
        },
      },
      copilot_model = "gpt-4o-copilot-2025-04-03",
      copilot_node_command = vim.fn.expand "$HOME" .. "/.volta/tools/image/node/22.16.0/bin/node",
    },
    specs = {
      {
        "AstroNvim/astrocore",
        opts = {
          options = {
            g = {
              -- set the ai_accept function
              ai_accept = function()
                if require("copilot.suggestion").is_visible() then
                  require("copilot.suggestion").accept()
                  return true
                end
              end,
            },
          },
        },
      },
    },
  },
}

---@type LazySpec
return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "User AstroFile",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true, -- Suggest as we start typing
        debounce = 150,
        keymap = {
          accept = "<Tab>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-c>",
        },
      },
    },
  },

  {
    "yetone/avante.nvim",
    build = "make",
    event = "VeryLazy",
    lazy = false,
    version = false,
    cmd = {
      "AvanteAsk",
      "AvanteBuild",
      "AvanteEdit",
      "AvanteRefresh",
      "AvanteSwitchProvider",
      "AvanteChat",
      "AvanteToggle",
      "AvanteClear",
    },
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    },
    ---@class avante.CoreConfig: avante.Config
    opts = {
      provider = "claude",
    },
    specs = { -- configure optional plugins
      {
        -- make sure `Avante` is added as a filetype
        "MeanderingProgrammer/render-markdown.nvim",
        optional = true,
        opts = function(_, opts)
          if not opts.file_types then opts.file_types = { "markdown" } end
          opts.file_types = require("astrocore").list_insert_unique(opts.file_types, { "Avante" })
        end,
      },
      {
        -- make sure `Avante` is added as a filetype
        "OXY2DEV/markview.nvim",
        optional = true,
        opts = function(_, opts)
          if not opts.file_types then opts.file_types = { "markdown", "quarto", "rmd" } end
          opts.file_types = require("astrocore").list_insert_unique(opts.file_types, { "Avante" })
        end,
      },
    },
  },

  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts)
      require("luasnip.loaders.from_vscode").lazy_load {
        paths = { "~/.config/nvim/lua/snippets" },
      }

      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require "cmp"

      return require("astrocore").extend_tbl(opts, {
        enabled = function()
          local context = require "cmp.config.context"
          local disabled = false
          disabled = disabled or (vim.api.nvim_get_option_value("buftype", { buf = 0 }) == "prompt")
          disabled = disabled or (vim.fn.reg_recording() ~= "")
          disabled = disabled or (vim.fn.reg_executing() ~= "")
          disabled = disabled or context.in_treesitter_capture "comment"
          return not disabled
        end,

        sources = cmp.config.sources {
          { name = "nvim_lsp", priority = 1000 },
          { name = "luasnip", priority = 750 },
          { name = "path", priority = 500 },
          { name = "buffer", priority = 250 },
        },

        mapping = {
          ["<CR>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
          },

          ["<Tab>"] = vim.NIL,
          ["<S-Tab>"] = vim.NIL,
        },
      })
    end,
  },
}

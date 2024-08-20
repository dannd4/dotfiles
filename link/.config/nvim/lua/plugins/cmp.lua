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
      local copilot = require "copilot.suggestion"
      local luasnip = require "luasnip"

      cmp.event:on("menu_opened", function() vim.b.copilot_suggestion_hidden = true end)
      cmp.event:on("menu_closed", function() vim.b.copilot_suggestion_hidden = false end)

      local function has_words_before()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
      end

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
          ["<Tab>"] = cmp.mapping(function(fallback)
            if copilot.is_visible() then
              copilot.accept()
            elseif cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<C-c>"] = cmp.mapping(function(fallback)
            if copilot.is_visible() then
              copilot.dismiss()
            else
              fallback()
            end
          end),
          ["<ESC>"] = cmp.mapping(function(fallback)
            if copilot.is_visible() then
              copilot.dismiss()
            else
              fallback()
            end
          end),
        },
      })
    end,
  },
}

return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp, copilot = require "cmp", require "copilot.suggestion"
      local snip_status_ok, luasnip = pcall(require, "luasnip")

      if not snip_status_ok then return end

      local function has_words_before()
        local line, col = table.unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
      end

      return require("astronvim.utils").extend_tbl(opts, {
        window = {
          completion = {
            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:Visual,Search:None",
            border = "none",
            col_offset = -1,
            side_padding = 0,
          },
        },
        performance = {
          debounce = 300,
          throttle = 120,
          fetching_timeout = 100
        },
        sources = cmp.config.sources {
          { name = "nvim_lsp", priority = 1000 },
          { name = "luasnip",  priority = 750 },
          { name = "path",     priority = 500 },
          { name = "buffer",   priority = 250 },
        },
        mapping = {
          ["<CR>"] = cmp.mapping.confirm({
            -- this is the important line
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
          }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if copilot.is_visible() then
              copilot.accept()
            elseif luasnip.jumpable(1) then
              luasnip.jump(1)
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<C-e>"] = cmp.mapping {
            i = function(fallback)
              if copilot.is_visible() then
                copilot.dismiss()
              elseif not cmp.abort() then
                fallback()
              end
            end,
            c = function(fallback)
              if copilot.is_visible() then
                copilot.dismiss()
              elseif not cmp.close() then
                fallback()
              end
            end,
          }
        },
      })
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "plugins.configs.luasnip" (plugin, opts)                                                    -- include the default astronvim config that calls the setup call
      require("luasnip.loaders.from_vscode").lazy_load { paths = { "~/.config/nvim/lua/user/snippets" } } -- load snippets paths

      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },
}

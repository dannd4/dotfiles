return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "frappe",
      background = { light = "latte", dark = "frappe" },
      styles = {
        comments = { "italic" },
        properties = { "italic" },
        functions = { "bold" },
        keywords = { "italic" },
        operators = { "bold" },
        conditionals = { "bold" },
        loops = { "bold" },
        booleans = { "bold", "italic" },
        numbers = {},
        types = {},
        strings = {},
        variables = {},
      },
      highlight_overrides = {
        frappe = function(c)
          return {
            DiagnosticUnderlineError = { style = { "undercurl" } },
            DiagnosticUnderlineWarn = { style = { "undercurl" } },
            DiagnosticUnderlineInfo = { style = { "undercurl" } },
            DiagnosticUnderlineHint = { style = { "undercurl" } },

            -- For treesitter.
            ["@field"] = { fg = c.rosewater },
            ["@property"] = { fg = c.yellow },
            ["@include"] = { fg = c.teal },
            ["@namespace"] = { fg = c.rosewater, style = {} },
            ["@constructor"] = { fg = c.lavender },
            ["@exception"] = { fg = c.teal },

            ["@keyword"] = { fg = c.red, style = { "italic" } },
            ["@keyword.operator"] = { fg = c.sky },
            ["@keyword.return"] = { fg = c.sky, style = {} },
            ["@keyword.function"] = { fg = c.red },

            ["@function.macro"] = { fg = c.red, style = {} },
            ["@parameter"] = { fg = c.rosewater },

            ["@variable"] = { fg = c.text },
            ["@method"] = { fg = c.blue, style = { "italic" } },

            ["@type"] = { fg = c.peach },
            ["@type.builtin"] = { link = "@type" },

            ["@property.typescript"] = { fg = c.lavender, style = { "italic" } },

            ["@constructor.tsx"] = { fg = c.peach },
            ["@tag.attribute.tsx"] = { fg = c.blue, style = { "italic" } },
          }
        end,
      },
    },
  },
  -- {
  --   "olimorris/onedarkpro.nvim",
  --   priority = 1000,
  --   config = function()
  --     require("onedarkpro").setup {
  --       styles = {
  --         methods = "bold",
  --         functions = "bold",
  --         keywords = "italic",
  --         comments = "italic",
  --         parameters = "italic",
  --         conditionals = "italic",
  --         virtual_text = "italic",
  --       },
  --       options = {
  --         cursorline = true,
  --       },
  --       highlights = {
  --         -- Syntax
  --         Constant = { fg = "${yellow}" },
  --         -- Dashboard
  --         dashboardHeader = { fg = "${cyan}" },
  --         dashboardCenter = { fg = "${green}", style = "bold" },
  --         -- Neo-tree
  --         NeoTreeDirectoryIcon = { fg = "${gray}" },
  --         -- Treesitter
  --         ["@tag.attribute"] = { fg = "${orange}" },
  --         -- Typescript
  --         ["@variable.tsx"] = { fg = "${yellow}" },
  --         -- Git
  --         DiffDelete = { bg = "#3F2D3D" },
  --         DiffviewDiffAddAsDelete = { bg = "#3F2D3D" },
  --         DiffAddAsDelete = { bg = "#3F2D3D" },
  --         DiffDeleteText = { bg = "#4B1818" },
  --         DiffAddText = { bg = "#005869" },
  --       },
  --     }
  --   end,
  -- },
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = function()
  --     return {
  --       style = "storm",
  --       sidebars = {
  --         "qf",
  --         "vista_kind",
  --         "terminal",
  --         "startuptime",
  --         "Outline",
  --       },
  --       on_highlights = function(hl, c)
  --         local util = require "tokyonight.util"
  --         hl.DiffviewDiffAddAsDelete = { bg = util.darken(c.red1, 0.15) }
  --         hl.DiffAddAsDelete = { bg = util.darken(c.red1, 0.15) }
  --         hl.DiffDeleteText = { bg = util.darken(c.red1, 0.3) }
  --         hl.DiffAddText = { bg = util.darken(c.green2, 0.3) }
  --       end,
  --     }
  --   end,
  -- },
}

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "frappe",
      dim_inactive = { enabled = true, percentage = 0.25 },
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
}

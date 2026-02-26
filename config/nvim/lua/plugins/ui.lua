---@diagnostic disable: undefined-field
return {
  {
    "catppuccin/nvim",
    opts = {
      flavour = "frappe", -- latte, frappe, macchiato, mocha
      transparent_background = true,
      integration_default = false,
      auto_integrations = true,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-frappe",
      icons = {
        kinds = {
          Diagnostic = "󰒡",
          Git = "󰊢",
          DefaultFile = "󰈙",
          FileNew = "",
          FileModified = "",
          FileReadOnly = "",
          FoldClosed = "",
          FoldOpened = "",
          FoldSeparator = " ",
          FolderClosed = "",
          FolderEmpty = "",
          FolderOpen = "",
        },
        git = {
          GitAdd = "",
          GitBranch = "",
          GitChange = "",
          GitConflict = "",
          GitDelete = "",
          GitIgnored = "◌",
          GitRenamed = "➜",
          GitSign = "▎",
          GitStaged = "✓",
          GitUnstaged = "✗",
          GitUntracked = "★",
        },
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local colors = require("catppuccin.palettes").get_palette("frappe")
      local icons = LazyVim.config.icons

      local function separator()
        return {
          function()
            return "│"
          end,
          color = { fg = colors.surface0, bg = "none", gui = "bold" },
          padding = { left = 1, right = 1 },
        }
      end

      opts = vim.tbl_deep_extend("force", opts or {}, {
        options = {
          component_separators = "",
          section_separators = "",
        },
        sections = {
          lualine_a = {
            {
              "mode",
              fmt = function(str)
                return str:sub(1, 1)
              end,
              padding = { left = 1, right = 1 },
            },
          },
          lualine_b = {
            {
              "branch",
              color = { fg = colors.green, bg = "none" },
              padding = { left = 1, right = 0 },
            },
            {
              "diff",
              colored = true,
              diff_color = {
                added = { fg = colors.teal, bg = "none", gui = "bold" },
                modified = { fg = colors.yellow, bg = "none", gui = "bold" },
                removed = { fg = colors.red, bg = "none", gui = "bold" },
              },
              source = function()
                local gitsigns = vim.b.gitsigns_status_dict
                if gitsigns then
                  return {
                    added = gitsigns.added,
                    modified = gitsigns.changed,
                    removed = gitsigns.removed,
                  }
                end
              end,
              padding = { left = 1, right = 0 },
            },
          },
          lualine_c = {
            separator(),
            {
              "filetype",
              icon_only = true,
              colored = false,
              color = { fg = colors.blue, bg = "none" },
              padding = { left = 0, right = 0 },
            },
            {
              "filename",
              file_status = true,
              path = 1,
              shorting_target = 20,
              symbols = {
                modified = "[+]",
                readonly = "[-]",
                unnamed = "[?]",
                newfile = "[!]",
              },
              color = { fg = colors.blue, bg = "none" },
              padding = { left = 0, right = 1 },
            },
            {
              "diagnostics",
              symbols = {
                error = icons.diagnostics.Error,
                warn = icons.diagnostics.Warn,
                info = icons.diagnostics.Info,
                hint = icons.diagnostics.Hint,
              },
              padding = { left = 0, right = 1 },
              color = { bg = "none" },
            },
          },
          lualine_y = {},
          lualine_z = {},
        },
      })

      for _, component in ipairs(opts.sections.lualine_x) do
        if component[1] == "diff" then
          component[1] = ""
        end
      end

      return opts
    end,
  },
}

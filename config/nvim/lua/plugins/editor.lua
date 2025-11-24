return {
  {
    "rebelot/heirline.nvim",
    opts = function(_, opts) opts.winbar = nil end,
  },

  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      dashboard = vim.NIL,
    },
  },

  {
    "folke/flash.nvim",
    opts = {
      modes = {
        char = {
          jump_labels = true,
          multi_line = false,
        },
      },
    },
  },

  {
    "gbprod/cutlass.nvim",
    opts = {
      cut_key = "D",
    },
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        width = 40,
      },
      filesystem = {
        filtered_items = {
          visible = true,
          hide_by_name = {
            ".git",
          },
        },
      },
    },
  },

  {
    "mg979/vim-visual-multi",
    event = { "User AstroFile", "InsertEnter" },
    dependencies = {
      "AstroNvim/astrocore",
      ---@param opts AstroCoreOpts
      opts = function(_, opts)
        if not opts.options then opts.options = {} end
        if not opts.options.g then opts.options.g = {} end
        opts.options.g.VM_silent_exit = 1
        opts.options.g.VM_show_warnings = 0

        if not opts.autocmds then opts.autocmds = {} end
        opts.autocmds.visual_multi_exit = {
          {
            event = "User",
            pattern = "visual_multi_exit",
            desc = "Avoid spurious 'hit-enter-prompt' when exiting vim-visual-multi",
            callback = function()
              vim.o.cmdheight = 1
              vim.schedule(function() vim.o.cmdheight = opts.options.opt.cmdheight end)
            end,
          },
        }

        if not opts.mappings then opts.mappings = require("astrocore").empty_map_table() end
        local maps = assert(opts.mappings)
        maps.n["<A-K>"] = { "<Plug>(VM-Add-Cursor-Up)", desc = "Add cursor above" }
        maps.n["<A-J>"] = { "<Plug>(VM-Add-Cursor-Down)", desc = "Add cursor below" }
      end,
    },
  },

  {
    "folke/noice.nvim",
    opts = {
      lsp = {
        hover = {
          silent = true,
        },
      },
      routes = {
        {
          filter = {
            event = { "msg_show", "notify" },
            any = {
              { find = "%d+ less lines" },
              { find = "%d+ fewer lines" },
              { find = "%d+ more lines" },
              { find = "%d+ change;" },
              { find = "%d+ line less;" },
              { find = "%d+ more lines?;" },
              { find = "%d+ fewer lines;?" },
              { find = '".+" %d+L, %d+B' },
              { find = "%d+ lines yanked" },
              { find = "^Hunk %d+ of %d+$" },
              { find = "%d+L, %d+B$" },
              { find = "^[/?].*" }, -- Searching up/down
              { find = "E486: Pattern not found:" }, -- Searcingh not found
              { find = "%d+ changes?;" }, -- Undoing/redoing
              { find = "%d+ fewer lines" }, -- Deleting multiple lines
              { find = "%d+ more lines" }, -- Undoing deletion of multiple lines
              { find = "%d+ lines " }, -- Performing some other verb on multiple lines
              { find = "Already at newest change" }, -- Redoing
              { find = '"[^"]+" %d+L, %d+B' }, -- Saving
              { find = " lines yanked" }, -- Yank
            },
          },
          opts = { skip = true },
        },
      },
    },
  },
}

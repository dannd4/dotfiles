return {
  "tpope/vim-sleuth",

  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        width = 40,
      },
    },
  },

  {
    "mrjones2014/smart-splits.nvim",
    dependencies = {
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            n = {
              ["<A-Up>"] = { function() require("smart-splits").resize_up() end, desc = "Resize split up" },
              ["<A-Down>"] = { function() require("smart-splits").resize_down() end, desc = "Resize split down" },
              ["<A-Left>"] = { function() require("smart-splits").resize_left() end, desc = "Resize split left" },
              ["<A-Right>"] = { function() require("smart-splits").resize_right() end, desc = "Resize split right" },
            },
          },
        },
      },
    },
  },

  {
    "smoka7/hop.nvim",
    opts = {},
    dependencies = {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["f"] = {
              function()
                require("hop").hint_char1 {
                  direction = require("hop.hint").HintDirection.AFTER_CURSOR,
                  current_line_only = true,
                }
              end,
            },
            ["F"] = {
              function()
                require("hop").hint_char1 {
                  direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
                  current_line_only = true,
                }
              end,
            },
            ["s"] = { function() require("hop").hint_words {} end, desc = "Hop hint words" },
            ["<S-s>"] = { function() require("hop").hint_lines {} end, desc = "Hop hint lines" },
          },
          v = {
            ["f"] = {
              function()
                require("hop").hint_char1 {
                  direction = require("hop.hint").HintDirection.AFTER_CURSOR,
                  current_line_only = true,
                }
              end,
            },
            ["F"] = {
              function()
                require("hop").hint_char1 {
                  direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
                  current_line_only = true,
                }
              end,
            },
            ["s"] = { function() require("hop").hint_words { extend_visual = true } end, desc = "Hop hint words" },
            ["<S-s>"] = { function() require("hop").hint_lines { extend_visual = true } end, desc = "Hop hint lines" },
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
}

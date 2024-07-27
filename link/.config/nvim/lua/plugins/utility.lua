---@type LazySpec
return {
  {
    "rebelot/heirline.nvim",
    opts = function(_, opts) opts.winbar = nil end,
  },

  {
    "folke/noice.nvim",
    opts = {
      routes = {
        {
          filter = {
            event = "msg_show",
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

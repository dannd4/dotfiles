-- Filetypes where certain elements of the statusline will not be shown
local filetypes = {
  "^git.*",
  "fugitive",
  "alpha",
  "^neo--tree$",
  "^neotest--summary$",
  "^neo--tree--popup$",
  "^NvimTree$",
  "^toggleterm$",
}

-- Buftypes which should cause elements to be hidden
local buftypes = {
  "nofile",
  "prompt",
  "help",
  "quickfix",
}

-- Filetypes which force the statusline to be inactive
local force_inactive_filetypes = {
  "^aerial$",
  "^alpha$",
  "^chatgpt$",
  "^DressingInput$",
  "^frecency$",
  "^lazy$",
  "^netrw$",
  "^TelescopePrompt$",
  "^undotree$",
}

return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    local status = require "astronvim.utils.status"

    opts.statusline[12] = nil

    opts.tabline[2] = status.heirline.make_buflist(status.component.tabline_file_info { close_button = false })

    opts.winbar[1][1] = status.component.separated_path { path_func = status.provider.filename { modify = ":.:h" } }
    opts.winbar[2] = {
      status.component.separated_path { path_func = status.provider.filename { modify = ":.:h" } },
      status.component.file_info { -- add file_info to breadcrumbs
        file_icon = { hl = status.hl.filetype_color, padding = { left = 0 } },
        file_modified = false,
        file_read_only = false,
        hl = status.hl.get_attributes("winbar", true),
        surround = false,
        update = "BufEnter",
      },
      -- status.component.breadcrumbs {
      --   icon = { hl = true },
      --   hl = status.hl.get_attributes("winbar", true),
      --   prefix = true,
      --   padding = { left = 0 },
      -- },
    }

    return opts
  end,
}

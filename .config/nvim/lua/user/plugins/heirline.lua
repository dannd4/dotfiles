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

    opts.winbar = nil

    return opts
  end,
}

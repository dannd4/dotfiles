-- load all plugins
require "pluginList"
require "misc-utils"

require "top-bufferline"
require "statusline"

require("colorizer").setup()
require("neoscroll").setup() -- smooth scroll

-- lsp stuff
require "nvim-lspconfig"
require "compe-completion"

local cmd = vim.cmd
local g = vim.g

g.mapleader = " "
g.auto_save = 0

-- colorscheme related stuff
cmd "syntax on"

-- local base16 = require "base16"
-- base16(base16.themes["gruvbox-dark-pale"], true)

require "colors"

-- blankline

g.indentLine_enabled = 1
g.indent_blankline_char = "▏"

g.indent_blankline_filetype_exclude = {"help", "terminal"}
g.indent_blankline_buftype_exclude = {"terminal"}

g.indent_blankline_show_trailing_blankline_indent = false
g.indent_blankline_show_first_indent_level = false

-- theme
vim.api.nvim_exec([[
   set background=dark
   colo bright-quantum
]], false)

-- easymotion
g.EasyMotion_smartcase = 1
g.EasyMotion_do_mapping = 0
vim.api.nvim_exec([[
   map  / <Plug>(easymotion-sn)
   omap / <Plug>(easymotion-tn)
   map  n <Plug>(easymotion-next)
   map  p <Plug>(easymotion-prev)
]], false)

require "treesitter-nvim"
require "mappings"

require "telescope-nvim"
require "nvimTree" -- file tree stuff
require "file-icons"

-- git signs , lsp symbols etc
require "gitsigns-nvim"
require("nvim-autopairs").setup()
require("lspkind").init()

-- hide line numbers in terminal windows
vim.api.nvim_exec([[
   au BufEnter term://* setlocal nonumber
]], false)

-- setup for TrueZen.nvim
require "zenmode"
require "whichkey"

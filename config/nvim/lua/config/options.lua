-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.swapfile = false
opt.listchars = {
  tab = "│→",
  extends = "⟩",
  precedes = "⟨",
  trail = "·",
  nbsp = "␣",
  leadmultispace = "│ ",
}

vim.o.autoread = true

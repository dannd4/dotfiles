if not vim.g.vscode then return {} end -- don't do anything in non-vscode instances

-- Set `vim.notify` to VS Code notifications
vim.notify = require("vscode").notify

local plugins = {
  -- core plugins
  "lazy.nvim",
  "AstroNvim",
  "astrocore",
  "astroui",
  "Comment.nvim",
  "nvim-autopairs",
  "nvim-treesitter",
  "nvim-treesitter-textobjects",
  "nvim-ts-context-commentstring",
  -- more known working
  "flash.nvim",
  "mini.ai",
  "mini.move",
  "mini.surround",
  "mini.splitjoin",
  "linrongbin16/gitlinker.nvim",
}

local Config = require "lazy.core.config"
-- disable plugin update checking
Config.options.checker.enabled = false
Config.options.change_detection.enabled = false
-- replace the default `cond`
Config.options.defaults.cond = function(plugin) return vim.tbl_contains(plugins, plugin.name) end

local vscode = require "vscode"

---@type LazySpec
return {
  -- add a few keybindings
  {
    "AstroNvim/astrocore",
    ---@param opts AstroCoreOpts
    opts = function(_, opts)
      local opt = assert(opts.options.opt)
      opt.cmdheight = nil
      opt.statusline = ""
      opt.laststatus = 0
      opt.ruler = false
      opt.colorcolumn = nil

      local maps = assert(opts.mappings)
      -- basic actions
      maps.n["<Leader>q"] = function() vscode.action "workbench.action.closeActiveEditor" end
      maps.n["u"] = "<Cmd>call VSCodeNotify('undo')<CR>"
      maps.n["U"] = "<Cmd>call VSCodeNotify('redo')<CR>"

      -- splits navigation
      maps.n["|"] = function() vscode.action "workbench.action.splitEditor" end
      maps.n["\\"] = function() vscode.action "workbench.action.splitEditorDown" end
      maps.n["<C-H>"] = function() vscode.action "workbench.action.navigateLeft" end
      maps.n["<C-J>"] = function() vscode.action "workbench.action.navigateDown" end
      maps.n["<C-K>"] = function() vscode.action "workbench.action.navigateUp" end
      maps.n["<C-L>"] = function() vscode.action "workbench.action.navigateRight" end

      -- buffer management
      maps.n["<Tab><Tab>"] = function() vscode.action "workbench.action.quickOpenLeastRecentlyUsedEditor" end
      maps.n["<Leader>c"] = "<Cmd>Tabclose<CR>"
      maps.n["<Leader>C"] = "<Cmd>Tabclose!<CR>"
      maps.n["<Leader>bc"] = function() vscode.action "workbench.action.closeOtherEditors" end
      maps.n["<Leader>bC"] = function() vscode.action "workbench.action.closeAllEditors" end

      -- file explorer
      maps.n["<Leader>e"] = function() vscode.action "workbench.files.action.focusFilesExplorer" end

      -- indentation
      maps.v["<Tab>"] = function() vscode.action "editor.action.indentLines" end
      maps.v["<S-Tab>"] = function() vscode.action "editor.action.outdentLines" end

      -- diagnostics
      maps.n["]d"] = function() vscode.action "editor.action.marker.nextInFiles" end
      maps.n["[d"] = function() vscode.action "editor.action.marker.prevInFiles" end

      -- pickers
      maps.n["<Leader>ff"] = function() vscode.action "workbench.action.quickOpen" end
      maps.n["<Leader>fw"] = function() vscode.action "workbench.action.findInFiles" end
      maps.n["<Leader>fc"] = function()
        vscode.action("workbench.action.findInFiles", { args = { query = vim.fn.expand "<cword>" } })
      end
      maps.n["<Leader>fC"] = function() vscode.action "workbench.action.showCommands" end
      maps.n["<Leader>fn"] = function() vscode.action "notifications.showList" end
      maps.n["<Leader>fr"] = function() vscode.action "workbench.action.openRecent" end
      maps.n["<Leader>fp"] = function() vscode.action "projectManager.listProjects" end

      -- git client
      maps.n["<Leader>gg"] = function() vscode.action "lazygit-vscode.toggle" end
      maps.n["<Leader>gz"] = function() vscode.action "gitlens.openFileOnRemote" end
      maps.n["<Leader>gZ"] = function() vscode.action "gitlens.openFileOnRemoteFrom" end

      -- LSP Mappings
      maps.n["K"] = function() vscode.action "editor.action.showHover" end
      maps.n["gI"] = function() vscode.action "editor.action.goToImplementation" end
      maps.n["gd"] = function() vscode.action "editor.action.revealDefinition" end
      maps.n["gD"] = function() vscode.action "editor.action.revealDeclaration" end
      maps.n["gr"] = function() vscode.action "editor.action.goToReferences" end
      maps.n["gy"] = function() vscode.action "editor.action.goToTypeDefinition" end
      maps.n["<Leader>la"] = function() vscode.action "editor.action.quickFix" end
      maps.n["<Leader>lG"] = function() vscode.action "workbench.action.showAllSymbols" end
      maps.n["<Leader>lR"] = function() vscode.action "editor.action.goToReferences" end
      maps.n["<Leader>lr"] = function() vscode.action "editor.action.rename" end
      maps.n["<Leader>ls"] = function() vscode.action "workbench.action.gotoSymbol" end
      maps.n["<Leader>lf"] = function() vscode.action "editor.action.formatDocument" end
    end,
  },
  -- disable colorscheme setting
  { "AstroNvim/astroui", opts = { colorscheme = false } },
  -- disable treesitter highlighting
  { "nvim-treesitter/nvim-treesitter", opts = { highlight = { enable = false } } },
}

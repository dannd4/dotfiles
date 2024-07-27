---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.python-ruff" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.vue" },

  -- { import = "astrocommunity.lsp.inc-rename-nvim" },
  { import = "astrocommunity.lsp.ts-error-translator-nvim" },

  { import = "astrocommunity.completion.cmp-cmdline" },

  { import = "astrocommunity.editing-support.yanky-nvim" },
  { import = "astrocommunity.editing-support.mini-splitjoin" },
  { import = "astrocommunity.editing-support.cutlass-nvim" },
  { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
  { import = "astrocommunity.editing-support.refactoring-nvim" },

  { import = "astrocommunity.motion.mini-move" },
  { import = "astrocommunity.motion.mini-surround" },
  { import = "astrocommunity.motion.vim-matchup" },
  { import = "astrocommunity.motion.tabout-nvim" },

  { import = "astrocommunity.git.neogit" },
  { import = "astrocommunity.git.gitlinker-nvim" },
  { import = "astrocommunity.git.diffview-nvim" },
  { import = "astrocommunity.git.blame-nvim" },

  { import = "astrocommunity.icon.mini-icons" },
  { import = "astrocommunity.indent.mini-indentscope" },
  { import = "astrocommunity.search.nvim-spectre" },
  { import = "astrocommunity.utility.noice-nvim" },

  { import = "astrocommunity.recipes.vscode-icons" },
  { import = "astrocommunity.recipes.telescope-lsp-mappings" },
  { import = "astrocommunity.recipes.astrolsp-no-insert-inlay-hints" },
}

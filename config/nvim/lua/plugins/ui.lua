return {
  {
    "catppuccin/nvim",
    opts = {
      flavour = "frappe", -- latte, frappe, macchiato, mocha
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
}

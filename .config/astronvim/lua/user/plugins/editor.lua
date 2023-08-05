return {
  { "folke/todo-comments.nvim", opts = {}, event = "User AstroFile" },
  {
    "nvim-pack/nvim-spectre", -- search and replace
    cmd = "Spectre",
    opts = function()
      return {
        mapping = {
          ["toggle_word_regexp"] = {
            map = "tw",
            cmd = "<cmd>lua require('spectre').change_options('word_regexp')<CR>",
            desc = "toggle word regexp",
          },
          ["Quit"] = {
            map = "<esc><esc>",
            cmd = "<cmd>q<cr>",
            desc = "Quit",
          },
        },
        find_engine = {
          -- rg is map with finder_cmd
          ["rg"] = {
            cmd = "rg",
            -- default args
            args = {
              "--color=never",
              "--no-heading",
              "--with-filename",
              "--line-number",
              "--column",
            },
            options = {
              ["word_regexp"] = {
                value = "--word-regexp",
                icon = "[W]",
                desc = "word regexp",
              },
            },
          },
        },
        default = { find = { cmd = "rg", options = { "word_regexp" } } },
        is_insert_mode = true, -- start open panel on is_insert_mode
      }
    end,
  },
  {
    "danymat/neogen",
    cmd = "Neogen",
    opts = {
      snippet_engine = "luasnip",
      languages = {
        typescript = { template = { annotation_convention = "tsdoc" } },
        typescriptreact = { template = { annotation_convention = "tsdoc" } },
      },
    },
  },
  {
    "arsham/indent-tools.nvim", -- Indentation
    dependencies = { "arsham/arshlib.nvim" },
    event = "User AstroFile",
    config = function() require("indent-tools").config {} end,
  },
  {
    "phaazon/hop.nvim", -- Easy motion
    branch = "v2",
    event = "BufReadPost",
    config = true,
  },
  {
    "abecodes/tabout.nvim",
    dependencies = { "hrsh7th/nvim-cmp", "nvim-treesitter/nvim-treesitter", "zbirenbaum/copilot.lua" },
    config = true,
  },
  {
    "Wansmer/treesj",
    cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = { use_default_keymaps = false },
  },
  {
    "echasnovski/mini.move",
    keys = {
      { "<M-l>", mode = { "n", "v" } },
      { "<M-k>", mode = { "n", "v" } },
      { "<M-j>", mode = { "n", "v" } },
      { "<M-h>", mode = { "n", "v" } },
    },
    opts = {},
  },
  { "junegunn/vim-easy-align", event = "User AstroFile" },
  {
    "echasnovski/mini.surround",
    keys = {
      { "sa", desc = "Add surrounding", mode = { "n", "v" } },
      { "sd", desc = "Delete surrounding" },
      { "sf", desc = "Find right surrounding" },
      { "sF", desc = "Find left surrounding" },
      { "sh", desc = "Highlight surrounding" },
      { "sr", desc = "Replace surrounding" },
      { "sn", desc = "Update `MiniSurround.config.n_lines`" },
    },
    opts = { n_lines = 200 },
  },
}

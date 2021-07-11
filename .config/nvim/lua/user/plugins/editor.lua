return {
  { "folke/todo-comments.nvim", opts = {}, event = "User AstroFile" },
  {
    "folke/trouble.nvim", -- show diagnostics
    cmd = { "TroubleToggle", "Trouble" },
    opts = {
      use_diagnostic_signs = true,
      action_keys = {
        close = { "<esc><esc>" },
        cancel = "<c-e>",
      },
    },
  },
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
    "arsham/indent-tools.nvim", -- Indentation
    dependencies = { "arsham/arshlib.nvim" },
    event = "User AstroFile",
    config = function() require("indent-tools").config {} end,
  },
  {
    "machakann/vim-sandwich", -- Surrounding text
    event = "User AstroFile",
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
    "willothy/flatten.nvim",
    lazy = false,
    priority = 1001,
    opts = {
      callbacks = {
        pre_open = function()
          -- Close toggleterm when an external open request is received
          require("toggleterm").toggle(0)
        end,
        post_open = function(bufnr, winnr, ft)
          if ft == "gitcommit" then
            -- If the file is a git commit, create one-shot autocmd to delete it on write
            -- If you just want the toggleable terminal integration, ignore this bit and only use the
            -- code in the else block
            vim.api.nvim_create_autocmd("BufWritePost", {
              buffer = bufnr,
              once = true,
              callback = function()
                -- This is a bit of a hack, but if you run bufdelete immediately
                -- the shell can occasionally freeze
                vim.defer_fn(function() vim.api.nvim_buf_delete(bufnr, {}) end, 50)
              end,
            })
          else
            -- If it's a normal file, then reopen the terminal, then switch back to the newly opened window
            -- This gives the appearance of the window opening independently of the terminal
            require("toggleterm").toggle(0)
            vim.api.nvim_set_current_win(winnr)
          end
        end,
        block_end = function()
          -- After blocking ends (for a git commit, etc), reopen the terminal
          require("toggleterm").toggle(0)
        end,
      },
      window = {
        open = "tab",
      },
    },
  },
}

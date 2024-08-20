---@type LazySpec
return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "kkharji/sqlite.lua",
    "nvim-telescope/telescope-smart-history.nvim",
    "nvim-telescope/telescope-live-grep-args.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    "debugloop/telescope-undo.nvim",
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>fe"] = { "<Cmd>Telescope file_browser<CR>", desc = "Open File browser" },
            ["<Leader>fu"] = { "<Cmd>Telescope undo<CR>", desc = "Find undo" },
            ["<Leader>fw"] = {
              function() require("telescope").extensions.live_grep_args.live_grep_args() end,
              desc = "Find words",
            },
            ["<Leader>fW"] = {
              function()
                require("telescope").extensions.live_grep_args.live_grep_args {
                  additional_args = function(args) return vim.list_extend(args, { "--hidden", "--no-ignore" }) end,
                }
              end,
              desc = "Find words in all files",
            },
            ["<Leader>fo"] = {
              function()
                require("telescope.builtin").oldfiles {
                  prompt_title = "Recent Files",
                  cwd_only = true,
                  tiebreak = function(current_entry, existing_entry, _)
                    -- This ensures that when you are filtering, it's also sorted by last opened time.
                    -- https://github.com/nvim-telescope/telescope.nvim/issues/2539#issuecomment-1562510095
                    return current_entry.index < existing_entry.index
                  end,
                }
              end,
              desc = "Find frecency",
            },
          },
        },
      },
    },
  },
  opts = function(_, opts)
    local actions = require "telescope.actions"
    local lga_actions = require "telescope-live-grep-args.actions"

    return require("astrocore").extend_tbl(opts, {
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      defaults = {
        color_devicons = true,
        set_env = { ["COLORTERM"] = "truecolor" },
        file_ignore_patterns = {
          ".git/",
          "%.jpg",
          "%.jpeg",
          "%.png",
          "%.svg",
          "%.otf",
          "%.ttf",
          "%.lock",
          "__pycache__",
          "%.sqlite3",
          "%.ipynb",
          "vendor",
          "node_modules",
        },
        history = {
          path = "~/.local/share/nvim/databases/telescope_history.sqlite3",
          limit = 100,
        },
      },

      pickers = {
        find_files = {
          preview = false,
          hidden = true,
          find_command = function(cfg)
            local find_command = { "rg", "--files", "--color", "never" }
            if not cfg.no_ignore then vim.list_extend(find_command, { "--glob", "!**/.git/**" }) end
            return find_command
          end,
        },
        buffers = {
          preview = false,
          path_display = { "smart" },
          mappings = {
            i = { ["<c-d>"] = actions.delete_buffer },
            n = { ["d"] = actions.delete_buffer },
          },
        },
      },

      extensions = {
        live_grep_args = {
          preview = true,
          auto_quoting = true, -- enable/disable auto-quoting
          path_display = { "truncate" },
          mappings = {
            i = {
              ["<C-a>"] = lga_actions.quote_prompt(),
              ["<C-f>"] = lga_actions.quote_prompt { postfix = " --iglob " },
            },
          },
        },
        file_browser = {
          hidden = { file_browser = true, folder_browser = true },
          mappings = {},
        },
      },
    })
  end,
  config = function(plugin, opts)
    require "astronvim.plugins.configs.telescope"(plugin, opts)

    local telescope = require "telescope"
    telescope.load_extension "live_grep_args"
    telescope.load_extension "smart_history"
    telescope.load_extension "file_browser"
    telescope.load_extension "undo"
  end,
}

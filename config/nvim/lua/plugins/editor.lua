return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = vim.NIL,
      notifier = {
        level = vim.log.levels.ERROR,
      },
      ---@class snacks.picker.Config
      picker = {
        actions = {
          copy_selector = function(_, item)
            local filepath = item.file
            if not filepath then
              return
            end
            local filename = vim.fs.basename(filepath)
            local modify = vim.fn.fnamemodify

            local vals = {
              ["BASENAME"] = modify(filename, ":r"),
              ["EXTENSION"] = modify(filename, ":e"),
              ["FILENAME"] = filename,
              ["PATH (CWD)"] = modify(filepath, ":."),
              ["PATH (HOME)"] = modify(filepath, ":~"),
              ["PATH"] = filepath,
              ["URI"] = vim.uri_from_fname(filepath),
            }

            local options = vim.tbl_filter(function(val)
              return vals[val] ~= ""
            end, vim.tbl_keys(vals))
            if vim.tbl_isempty(options) then
              vim.notify("No values to copy", vim.log.levels.WARN)
              return
            end
            table.sort(options)
            vim.ui.select(options, {
              prompt = "Choose to copy to clipboard:",
              format_item = function(val)
                return ("%s: %s"):format(val, vals[val])
              end,
            }, function(choice)
              local result = vals[choice]
              if result then
                vim.notify(("Copied: `%s`"):format(result))
                vim.fn.setreg("+", result)
              end
            end)
          end,
        },
        ---@class snacks.picker.sources.Config
        sources = {
          ---@class snacks.picker.explorer.Config
          explorer = {
            hidden = true,
            include = { ".json", ".env", ".env.*" },
            win = {
              list = {
                keys = {
                  ["Y"] = "copy_selector",
                },
              },
            },
          },
          ---@class snacks.picker.grep.Config
          grep = {
            format = function(item, _)
              local ret = {}
              -- Add file icon and name/path to the list
              local file = item.file
              local icon, icon_hl = require("snacks.util").icon(file)

              ret[#ret + 1] = { icon .. " ", icon_hl }
              ret[#ret + 1] = { file, "SnacksPickerFile" }

              if item.pos then
                ret[#ret + 1] = { ":" .. item.pos[1] .. ":" .. item.pos[2], "SnacksPickerComment" }
              end

              return ret
            end,
          },
        },
        ---@class snacks.picker.icons
        icons = {
          git = {
            added = "",
            deleted = "",
            modified = "",
            staged = "✓",
            renamed = "➜",
            unmerged = "✗",
            untracked = "★",
          },
        },
      },
    },
    keys = {
      {
        "<leader>f<cr>",
        function()
          Snacks.picker.resume({
            exclude = { "explorer" },
          })
        end,
        desc = "Resume previous search",
      },
    },
  },
  {
    "2kabhishek/seeker.nvim",
    dependencies = { "folke/snacks.nvim" },
    cmd = { "Seeker" },
    opts = {}, -- Required unless you call seeker.setup() manually, add your configs here
    keys = {
      { "<leader>ff", ":Seeker files<CR>", desc = "Seek Files" },
      { "<leader>fg", ":Seeker git_files<CR>", desc = "Seek Git Files" },
      { "<leader>fw", ":Seeker grep<CR>", desc = "Seek Grep" },
      { "<leader><leader>", ":Seeker files<CR>", desc = "Seek Files" },
      { "<leader>/", ":Seeker grep<CR>", desc = "Seek Grep" },
    },
  },
  {
    "akinsho/bufferline.nvim",
    keys = {
      { "<leader>bb", "<cmd>BufferLinePick<cr>", desc = "Pick buffer" },
    },
  },
  {
    "tiagovla/scope.nvim",
    event = "VeryLazy",
    opts = {},
  },
}

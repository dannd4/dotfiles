return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = vim.NIL,
      image = {
        enabled = true,
      },
      notifier = {
        level = vim.log.levels.ERROR,
      },
      lazygit = {
        config = {
          os = {
            edit = '[ -z ""$NVIM"" ] && (nvim -- {{filename}}) || (nvim --server ""$NVIM"" --remote-send ""q"" && nvim --server ""$NVIM"" --remote {{filename}})',
          },
        },
      },
      ---@class snacks.picker.Config
      picker = {
        layouts = {
          custom = {
            layout = {
              backdrop = false,
              row = 1,
              width = 0.6,
              min_width = 80,
              height = 0.9,
              border = "none",
              box = "vertical",
              {
                box = "vertical",
                border = true,
                title = "{title} {live} {flags}",
                title_pos = "center",
                { win = "input", height = 1, border = "bottom" },
                { win = "list", border = "none" },
              },
              { win = "preview", title = "{preview}", height = 0.7, border = true },
            },
          },
        },
        layout = {
          preset = "custom",
        },
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
          ---@class snacks.picker.files.Config
          files = {
            hidden = true,
            exclude = { "node_modules", ".git" },
          },
          ---@class snacks.picker.explorer.Config
          explorer = {
            hidden = true,
            include = { ".plans", ".tasks", ".planning" },
            exclude = { ".git" },
            layout = {
              preset = "sidebar", -- Keeps the sidebar behavior for explorer
            },
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
            sort = { fields = { "idx" } },
            finder = function(opts, ctx)
              local produce = require("snacks.picker.source.grep").grep(opts, ctx)
              local last
              local function relay(cb, item)
                -- emit a header item the first time we see each file
                if item.file and item.file ~= last then
                  last = item.file
                  cb({ text = item.file, file = item.file, is_header = true })
                end
                cb(item)
              end
              return function(cb)
                if type(produce) == "function" then
                  return produce(function(item)
                    relay(cb, item)
                  end)
                end
                for _, item in ipairs(produce or {}) do
                  relay(cb, item)
                end
              end
            end,
            format = function(item, picker)
              -- header row: icon + filename + dimmed dir, via the built-in formatter
              if item.is_header then
                return Snacks.picker.format.file(item, picker)
              end

              -- match row: indented `:lnum:col   text`
              local ret = {}
              local lnum = item.pos and item.pos[1] or 0
              local col = item.pos and item.pos[2] or 0
              ret[#ret + 1] = { ("   :%d:%d"):format(lnum, col), "SnacksPickerRow" }
              ret[#ret + 1] = { "  " }

              local line = (item.line or item.text or ""):gsub("[\r\n]+$", "")
              local ok, flt = pcall(function()
                return picker:filter()
              end)
              local search = (ok and flt and flt.search) or ""
              if search ~= "" then
                local low, from = line:lower(), 1
                while true do
                  local s, e = low:find(search:lower(), from, true)
                  if not s then
                    break
                  end
                  if s > from then
                    ret[#ret + 1] = { line:sub(from, s - 1) }
                  end
                  ret[#ret + 1] = { line:sub(s, e), "SnacksPickerMatch" }
                  from = e + 1
                end
                if from <= #line then
                  ret[#ret + 1] = { line:sub(from) }
                end
              else
                ret[#ret + 1] = { line }
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
            include = { "files", "grep" },
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
      { "<leader>ff", "<cmd>Seeker files<CR>", desc = "Seek Files" },
      { "<leader><space>", "<cmd>Seeker files<CR>", desc = "Seek Files" },
      { "<leader>fg", "<cmd>Seeker git_files<CR>", desc = "Seek Git Files" },
      { "<leader>fw", "<cmd>Seeker grep<CR>", desc = "Seek Grep" },
      { "<leader>/", "<cmd>Seeker grep<CR>", desc = "Seek Grep" },
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      code = {
        sign = false,
        width = "block",
        right_pad = 1,
      },
      heading = {
        sign = false,
        icons = {},
      },
      checkbox = {
        enabled = false,
      },
    },
    ft = { "markdown", "norg", "rmd", "org" },
    config = function(_, opts)
      require("render-markdown").setup(opts)
      Snacks.toggle({
        name = "Render Markdown",
        get = require("render-markdown").get,
        set = require("render-markdown").set,
      }):map("<leader>um")
    end,
  },
  {
    "nanozuki/tabby.nvim",
    config = function()
      local function tab_label(tab)
        local custom = require("tabby.feature.tab_name").get_raw(tab.id)
        if custom ~= "" then
          return custom
        end

        for _, win in ipairs(vim.api.nvim_tabpage_list_wins(tab.id)) do
          local name = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win))
          if name:match("CodeDiff Explorer") then
            return "  " .. "Code Diff"
          end
        end

        return tab.number()
      end

      local theme = {
        fill = "Normal",
        head = "TabLine",
        current_tab = "Normal",
        tab = "TabLine",
        win = "TabLine",
        tail = "TabLine",
      }

      require("tabby").setup({
        line = function(line)
          return {
            line.tabs().foreach(function(tab)
              local hl = tab.is_current() and theme.current_tab or theme.tab
              return {
                line.sep(" ", hl, theme.fill),
                tab_label(tab),
                line.sep(" ", hl, theme.fill),
                hl = hl,
                margin = "  ",
              }
            end),
            hl = theme.fill,
          }
        end,
      })
    end,
  },
}

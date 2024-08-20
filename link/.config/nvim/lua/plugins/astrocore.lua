-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics
    diagnostics = {
      virtual_text = false,
      underline = true,
    },
    filetypes = {
      filename = {
        [".swcrc"] = "jsonc",
      },
    },
    -- Vim options
    options = {
      opt = {
        swapfile = false,
        autoread = true,
        wrap = true,
        list = true,
        fillchars = { eob = " ", diff = "╱" },
        listchars = {
          tab = "│→",
          extends = "⟩",
          precedes = "⟨",
          trail = "·",
          nbsp = "␣",
          leadmultispace = "│ ",
        },
      },
      g = {},
    },
    -- Mappings
    mappings = {
      n = {
        -- General
        ["<Esc><Esc>"] = { "<cmd>nohlsearch<cr>", desc = "Stop highlighting" },
        ["<C-r>"] = { "<cmd>checktime<cr>", desc = "refresh file" },
        ["U"] = { "<C-r>", desc = "Redo" },

        -- Movement
        ["H"] = { "^", desc = "Jump to start line" },
        ["L"] = { "$", desc = "jump to end line" },

        -- Buffer
        ["<Tab>"] = {
          function() require("astrocore.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
          desc = "Next buffer",
        },
        ["<S-Tab>"] = {
          function() require("astrocore.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
          desc = "Previous buffer",
        },
        ["<Tab><Tab>"] = {
          function()
            require("astroui.status").heirline.buffer_picker(function(bufnr) vim.api.nvim_win_set_buf(0, bufnr) end)
          end,
          desc = "Pick buffer tab",
        },

        -- Smart Splits
        ["<A-Up>"] = { function() require("smart-splits").resize_up() end, desc = "Resize split up" },
        ["<A-Down>"] = { function() require("smart-splits").resize_down() end, desc = "Resize split down" },
        ["<A-Left>"] = { function() require("smart-splits").resize_left() end, desc = "Resize split left" },
        ["<A-Right>"] = { function() require("smart-splits").resize_right() end, desc = "Resize split right" },
      },
      i = {
        ["<C-h>"] = { "<Left>" },
        ["<C-j>"] = { "<Down>" },
        ["<C-k>"] = { "<Up>" },
        ["<C-l>"] = { "<Right>" },
      },
      t = {
        ["<Esc><esc>"] = "<c-\\><c-n>:ToggleTerm<CR>",
        ["<C-q>"] = "<c-\\><c-n>:q<cr>",
      },
      v = {
        ["H"] = { "^", desc = "Jump to start line" },
        ["L"] = { "$", desc = "jump to end line" },
      },
    },
    autocmds = {
      close_with_q = {
        event = { "FileType" },
        pattern = { "help", "lspinfo", "man", "notify", "qf", "query", "checkhealth" },
        desc = "Close buffer with q in certain filetypes",
        group = "close_with_q",
        callback = function(event)
          vim.bo[event.buf].buflisted = false
          vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
        end,
      },
      autohidetabline = {
        {
          event = "User",
          pattern = "AstroBufsUpdated", -- triggered when vim.t.bufs is updated
          desc = "Hide tabline when only one buffer and one tab",
          group = "autohidetabline",
          callback = function()
            local new_showtabline = #vim.t.bufs > 1 and 2 or 1
            if new_showtabline ~= vim.opt.showtabline:get() then vim.opt.showtabline = new_showtabline end
          end,
        },
      },
      autocompletion = {
        event = { "TextChangedI", "TextChangedP" },
        pattern = "*",
        group = "autocompletion",
        callback = function()
          local line = vim.api.nvim_get_current_line()
          local cursor = vim.api.nvim_win_get_cursor(0)[2]

          local current = string.sub(line, cursor, cursor + 1)
          if current == "." or current == "," or current == " " then require("cmp").close() end

          local before_line = string.sub(line, 1, cursor + 1)
          local after_line = string.sub(line, cursor + 1, -1)
          if not string.match(before_line, "^%s+$") then
            if after_line == "" or string.match(before_line, " $") or string.match(before_line, "%.$") then
              require("cmp").complete()
            end
          end
        end,
      },
    },
  },
}

local utils = require "user.utils"

return {
  n = {
    ["<leader>h"] = false,
    -- General
    ["<Esc><Esc>"] = { ":nohlsearch<cr>", desc = "Stop highlighting" },
    ["U"] = { "<C-r>", desc = "Redo" },
    ["<C-\\>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle Term" },
    ["<C-r>"] = { "<cmd>checktime<cr>", desc = "refresh file" },
    -- Movement
    ["B"] = { "^", desc = "Jump to start line" },
    ["E"] = { "$", desc = "jump to end line" },
    -- Multi cursor
    ["cn"] = { "*``cgn", desc = "Inititiate" },
    ["cN"] = { "*``cgN", desc = "Inititiate (backwards direction)" },
    -- better search
    n = { utils.better_search "n", desc = "Next search" },
    N = { utils.better_search "N", desc = "Previous search" },
    -- Buffer
    ["<Tab>"] = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    ["<S-Tab>"] = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },
    ["<Tab><Tab>"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr) vim.api.nvim_win_set_buf(0, bufnr) end)
      end,
      desc = "Pick buffer tab",
    },
    -- Smartsplit
    ["<Up>"] = {
      function() require("smart-splits").move_cursor_up() end,
      desc = "Move to above split",
    },
    ["<Down>"] = {
      function() require("smart-splits").move_cursor_down() end,
      desc = "Move to below split",
    },
    ["<Left>"] = {
      function() require("smart-splits").move_cursor_left() end,
      desc = "Move to left split",
    },
    ["<Right>"] = {
      function() require("smart-splits").move_cursor_right() end,
      desc = "Move to right split",
    },
    ["<A-Up>"] = {
      function() require("smart-splits").resize_up() end,
      desc = "Resize split up",
    },
    ["<A-Down>"] = {
      function() require("smart-splits").resize_down() end,
      desc = "Resize split down",
    },
    ["<A-Left>"] = {
      function() require("smart-splits").resize_left(2) end,
      desc = "Resize split left",
    },
    ["<A-Right>"] = {
      function() require("smart-splits").resize_right(2) end,
      desc = "Resize split right",
    },
    -- Hop
    ["f"] = {
      "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
      desc = "Jump forward to characters",
    },
    ["F"] = {
      "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
      desc = "Jump backward to characters",
    },
    ["S"] = { "<cmd>HopPattern<cr>", desc = "Jump to Pattern" },
    -- Telescope
    ["<leader>fw"] = {
      function() require("telescope").extensions.live_grep_args.live_grep_args() end,
      desc = "Find words",
    },
    ["<leader>fW"] = {
      function()
        require("telescope").extensions.live_grep_args.live_grep_args {
          additional_args = function(args) return vim.list_extend(args, { "--hidden", "--no-ignore" }) end,
        }
      end,
      desc = "Find words in all files",
    },
    ["<leader>fr"] = {
      function() require("telescope").extensions.frecency.frecency { prompt_title = "Recent Files", workspace = "CWD" } end,
      desc = "Find frecency",
    },
    ["<leader>fM"] = {
      function() require("telescope.builtin").man_pages() end,
      desc = "Find man",
    },
    ["<leader>fm"] = {
      function() require("telescope").extensions.media_files.media_files() end,
      desc = "Find media files",
    },
    ["<leader>fT"] = { "<cmd>TodoTelescope<cr>", desc = "Find TODOs" },
    -- Spectre
    ["<leader>s"] = { name = "󰛔 Search/Replace" },
    ["<leader>ss"] = {
      function() require("spectre").open() end,
      desc = "Spectre",
    },
    ["<leader>sw"] = {
      function() require("spectre").open_visual { select_word = true } end,
      desc = "Spectre (current word)",
    },
    ["<leader>sf"] = {
      function() require("spectre").open_file_search() end,
      desc = "Spectre (current file)",
    },
    -- TreeSJ
    ["<leader>m"] = { "<cmd>TSJToggle<cr>", desc = "Toggle join/split node under cursor" },
    -- neogen
    ["<leader>a"] = { desc = "󰏫 Annotate" },
    ["<leader>a<cr>"] = { function() require("neogen").generate {} end, desc = "Current" },
    ["<leader>ac"] = { function() require("neogen").generate { type = "class" } end, desc = "Class" },
    ["<leader>af"] = { function() require("neogen").generate { type = "func" } end, desc = "Function" },
    ["<leader>at"] = { function() require("neogen").generate { type = "type" } end, desc = "Type" },
    ["<leader>aF"] = { function() require("neogen").generate { type = "file" } end, desc = "File" },
    -- neogit
    ["<leader>gG"] = { function() require("neogit").open() end, desc = "Neogit" },
  },
  t = {
    ["<esc><esc>"] = { "<c-\\><c-n>:q<cr>", desc = "Terminal quit" },
    ["<C-\\>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle Term" },
  },
  x = {
    ["il"] = { "g_o^", desc = "Inside line text object" },
    ["al"] = { "$o^", desc = "Around line text object" },
  },
  o = {
    ["il"] = { ":normal vil<cr>", desc = "Inside line text object" },
    ["al"] = { ":normal val<cr>", desc = "Around line text object" },
    ["f"] = {
      "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
      desc = "Jump forward to characters",
    },
    ["F"] = {
      "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
      desc = "Jump backward to characters",
    },
  },
  v = {
    ["p"] = { '"_dP', desc = "Paste without yank" },
    ["B"] = { "^", desc = "Jump to start line" },
    ["E"] = { "$", desc = "jump to end line" },
    -- Hop
    ["f"] = {
      "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
      desc = "Jump forward to characters",
    },
    ["F"] = {
      "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
      desc = "Jump backward to characters",
    },
  },
  i = {
    ["<C-\\>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle Term" },
  },
}

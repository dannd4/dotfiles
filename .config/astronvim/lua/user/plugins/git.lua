return {
  "NeogitOrg/neogit",
  cmd = "Neogit",
  dependencies = {
    {
      "sindrets/diffview.nvim",
      event = "User AstroGitFile",
      opts = function(_, opts)
        local actions = require "diffview.actions"
        local utils = require "astronvim.utils" --  astronvim utils

        local prefix = "<leader>D"

        utils.set_mappings {
          n = {
            [prefix] = { name = " Diff View" },
            [prefix .. "<cr>"] = { "<cmd>DiffviewOpen<cr>", desc = "Open DiffView" },
            [prefix .. "h"] = { "<cmd>DiffviewFileHistory %<cr>", desc = "Open DiffView File History" },
            [prefix .. "H"] = { "<cmd>DiffviewFileHistory<cr>", desc = "Open DiffView Branch History" },
          },
        }

        local build_keymaps = function(maps)
          local out = {}
          local i = 1
          for lhs, def in
            pairs(utils.extend_tbl(maps, {
              ["<esc><esc>"] = { "<cmd>DiffviewClose<cr>", desc = "Quit Diffview" }, -- Toggle the file panel.
              ["]D"] = { actions.select_next_entry, desc = "Next Difference" }, -- Open the diff for the next file
              ["[D"] = { actions.select_prev_entry, desc = "Previous Difference" }, -- Open the diff for the previous file
              ["[C"] = { actions.prev_conflict, desc = "Next Conflict" }, -- In the merge_tool: jump to the previous conflict
              ["]C"] = { actions.next_conflict, desc = "Previous Conflict" }, -- In the merge_tool: jump to the next conflict
              ["Cl"] = { actions.cycle_layout, desc = "Cycle Diff Layout" }, -- Cycle through available layouts.
              ["Ct"] = { actions.listing_style, desc = "Cycle Tree Style" }, -- Cycle through available layouts.
              ["<leader>e"] = { actions.toggle_files, desc = "Toggle Explorer" }, -- Toggle the file panel.
              ["<leader>o"] = { actions.focus_files, desc = "Focus Explorer" }, -- Bring focus to the file panel
            }))
          do
            local opts
            local rhs = def
            local mode = { "n" }
            if type(def) == "table" then
              if def.mode then mode = def.mode end
              rhs = def[1]
              def[1] = nil
              def.mode = nil
              opts = def
            end
            out[i] = { mode, lhs, rhs, opts }
            i = i + 1
          end
          return out
        end

        return require("astronvim.utils").extend_tbl(opts, {
          enhanced_diff_hl = true,
          view = {
            merge_tool = { layout = "diff3_mixed" },
          },
          hooks = { diff_buf_read = function(bufnr) vim.b[bufnr].view_activated = false end },
          keymaps = {
            view = build_keymaps {
              ["<leader>co"] = { actions.conflict_choose "ours", desc = "Take Ours" }, -- Choose the OURS version of a conflict
              ["<leader>ct"] = { actions.conflict_choose "theirs", desc = "Take Theirs" }, -- Choose the THEIRS version of a conflict
              ["<leader>cb"] = { actions.conflict_choose "base", desc = "Take Base" }, -- Choose the BASE version of a conflict
              ["<leader>ca"] = { actions.conflict_choose "all", desc = "Take All" }, -- Choose all the versions of a conflict
              ["<leader>c0"] = { actions.conflict_choose "none", desc = "Take None" }, -- Delete the conflict region
            },
          },
        })
      end,
    },
  },
  opts = function()
    local get_icon = require("astronvim.utils").get_icon
    local fold_signs = { get_icon "FoldClosed", get_icon "FoldOpened" }
    return {
      disable_builtin_notifications = true,
      telescope_sorter = function() return require("telescope").extensions.fzy_native.native_fzy_sorter() end,
      integrations = { telescope = true, diffview = true },
      signs = { section = fold_signs, item = fold_signs },
    }
  end,
}

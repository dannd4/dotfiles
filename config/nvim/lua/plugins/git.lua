return {
  {
    "esmuellert/codediff.nvim",
    cmd = "CodeDiff",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {},
    keys = {
      { "<leader>gx", "<cmd>CodeDiff<cr>", desc = "Code Diff" },
    },
  },
  {
    "FabijanZulj/blame.nvim",
    cmd = "BlameToggle",
    opts = {},
    keys = {
      {
        "<Leader>gb",
        "<cmd>BlameToggle<cr>",
        desc = "Toggle git blame",
      },
    },
  },
}

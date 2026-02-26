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
}

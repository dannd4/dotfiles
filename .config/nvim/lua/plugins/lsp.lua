return {
  { "williamboman/mason.nvim", opts = { PATH = "append" } },

  {
    "rmagatti/goto-preview",
    opts = {
      width = 120, -- Width of the floating window
      height = 100, -- Height of the floating window
    },
    keys = {
      {
        "gpd",
        "<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
        desc = "Preview Definition",
      },
      {
        "gpD",
        "<cmd>lua require('goto-preview').goto_preview_declaration()<CR>",
        desc = "Preview Declaration",
      },
      {
        "gpt",
        "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>",
        desc = "Preview Type Definition",
      },
      {
        "gpi",
        "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>",
        desc = "Preview Implementation",
      },
      {
        "gpr",
        "<cmd>lua require('goto-preview').goto_preview_references()<CR>",
        desc = "Preview Implementation",
      },
      {
        "gP",
        "<cmd>lua require('goto-preview').close_all_win()<CR>",
        desc = "Close All Preview Windows",
      },
      {
        "<C-v>",
        "<C-w>L",
        desc = "Open Vertical Split in the Right",
      },
    },
  },
}

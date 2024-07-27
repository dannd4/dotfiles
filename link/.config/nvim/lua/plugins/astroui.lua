-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`

---@type LazySpec
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    dependencies = {
      {
        "AstroNvim/astroui",
        ---@type AstroUIOpts
        opts = {
          colorscheme = "catppuccin",
        },
      },
    },
    ---@type CatppuccinOptions
    opts = {
      flavour = "frappe",
      integration_default = false,
      transparent_background = false,
      show_end_of_buffer = false,
      integrations = {
        aerial = true,
        cmp = true,
        dap = true,
        dap_ui = true,
        diffview = true,
        gitgutter = true,
        hop = true,
        neotree = true,
        notify = true,
        mason = true,
        which_key = true,
        symbols_outline = true,
        treesitter = true,
        treesitter_context = true,
        semantic_tokens = true,
        telescope = {
          enabled = true,
          style = "nvchad",
        },
        mini = {
          enabled = true,
        },
        native_lsp = {
          enabled = true,
          underlines = {
            information = { "undercurl" },
            warning = { "undercurl" },
            error = { "undercurl" },
            hint = { "undercurl" },
          },
        },
      },
    },
  },
}

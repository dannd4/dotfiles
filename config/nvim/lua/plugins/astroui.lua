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
        blink_cmp = true,
        dap = true,
        dap_ui = true,
        gitsigns = true,
        illuminate = true,
        mason = true,
        neotree = true,
        notify = true,
        which_key = true,
        semantic_tokens = true,
        mini = {
          enabled = true,
        },
        snacks = {
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

-- AstroLSP allows you to customize the features in AstroNvim's LSP configuration engine
-- Configuration documentation can be found with `:h astrolsp`

---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    -- Configuration table of features provided by AstroLSP
    features = {
      signature_help = true,
    },
    -- Customize lsp formatting options
    formatting = {
      format_on_save = { enabled = true },
      -- disable formatting capabilities for the listed language servers
      disabled = { "ts_ls", "vtsls", "jsonls", "lua_ls", "html", "biome" },
    },
    -- enable servers that you already have installed without mason
    servers = {},
    -- customize language server configuration options passed to `lspconfig`
    ---@diagnostic disable: missing-fields
    config = {
      biome = {
        cmd = { "npx", "biome", "lsp-proxy" },
      },
      vtsls = {
        settings = {
          vtsls = {
            experimental = {
              completion = {
                enableServerSideFuzzyMatch = true,
                entriesLimit = 50,
              },
            },
          },
        },
      },
    },
    -- customize how language servers are attached
    handlers = {
      basedpyright = false,
    },
    -- Configure buffer local auto commands to add when attaching a language server
    autocmds = {
      eslint_fix_on_save = false,

      vtsls_import_on_save = {
        cond = function(client) return client.name == "vtsls" end,
        {
          event = "BufWritePost",
          desc = "Add all missing import",
          callback = function() require("vtsls").commands.add_missing_imports() end,
        },
      },
    },
    -- mappings to be set up on attaching of a language server
    mappings = {},
    -- A custom `on_attach` function to be run after the default `on_attach` function
    -- takes two parameters `client` and `bufnr`  (`:h lspconfig-setup`)
    on_attach = function(client, bufnr)
      -- this would disable semanticTokensProvider for all clients
      -- client.server_capabilities.semanticTokensProvider = nil
    end,
  },
}

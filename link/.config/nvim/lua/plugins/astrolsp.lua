-- AstroLSP allows you to customize the features in AstroNvim's LSP configuration engine
-- Configuration documentation can be found with `:h astrolsp`

---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    -- Configuration table of features provided by AstroLSP
    features = {},
    -- Customize lsp formatting options
    formatting = {
      format_on_save = { enabled = true },
      -- disable formatting capabilities for the listed language servers
      disabled = { "tsserver", "vtsls", "jsonls", "lua_ls", "html", "biome" },
    },
    -- enable servers that you already have installed without mason
    servers = {},
    -- customize language server configuration options passed to `lspconfig`
    ---@diagnostic disable: missing-fields
    config = {},
    -- customize how language servers are attached
    handlers = {},
    -- Configure buffer local auto commands to add when attaching a language server
    autocmds = {
      eslint_fix_on_save = false,
    },
    -- mappings to be set up on attaching of a language server
    mappings = {},
    -- A custom `on_attach` function to be run after the default `on_attach` function
    -- takes two parameters `client` and `bufnr`  (`:h lspconfig-setup`)
    on_attach = function(client, bufnr)
      -- this would disable semanticTokensProvider for all clients
      -- client.server_capabilities.semanticTokensProvider = nil
      -- client.capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = false
      -- client.capabilities.workspace.didChangeWatchedFiles.relativePatternSupport = false
    end,
  },
}

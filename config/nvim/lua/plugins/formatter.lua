local function file_exists(filename)
  local file = io.open(filename, "r")
  if not file then return false end
  file:close()
  return true
end

local has_biome = function(bufnr)
  if type(bufnr) ~= "number" then bufnr = vim.api.nvim_get_current_buf() end

  local rooter = require "astrocore.rooter"

  local biomejson_rooter = rooter.resolve {
    "biome.json",
  }

  return next(biomejson_rooter(bufnr))
end

local biome_format_filetypes =
  { "javascript", "javascriptreact", "typescript", "typescriptreact", "json", "jsonc", "css" }

return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed or {}, { "biome" })
    end,
  },
  {
    "AstroNvim/astrolsp",
    opts = {
      formatting = {
        disabled = { "biome" },
      },
      config = {
        biome = {
          cmd = (function()
            if file_exists "package-lock.json" then return { "npx", "biome", "lsp-proxy" } end
            if file_exists "yarn.lock" then return { "yarn", "biome", "lsp-proxy" } end
            return nil
          end)(),
        },
      },
    },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts)
      if not opts.handlers then opts.handlers = {} end

      opts.handlers.prettierd = function(source_name, methods)
        local null_ls = require "null-ls"
        for _, method in ipairs(methods) do
          null_ls.register(null_ls.builtins[method][source_name].with {
            runtime_condition = function(params)
              if has_biome(params.bufnr) and vim.tbl_contains(biome_format_filetypes, params.filetype) then
                return false
              end

              return true
            end,
          })
        end
      end

      opts.handlers.biome = function(source_name, methods)
        local null_ls = require "null-ls"
        for _, method in ipairs(methods) do
          null_ls.register(null_ls.builtins[method][source_name].with {
            args = {
              "check",
              "--write",
              "--skip-errors",
              "--stdin-file-path",
              "$FILENAME",
            },
            runtime_condition = function(params)
              if has_biome(params.bufnr) and vim.tbl_contains(biome_format_filetypes, params.filetype) then
                return true
              end

              return false
            end,
          })
        end
      end
    end,
  },
}

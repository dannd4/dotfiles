vim.api.nvim_create_augroup("packer_conf", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  desc = "Sync packer after modifying plugins.lua",
  group = "packer_conf",
  pattern = "plugins.lua",
  command = "source <afile> | PackerSync",
})

local lsp_code_actions = vim.api.nvim_create_augroup("lsp_code_actions", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  desc = "Typescript auto import on save",
  pattern = { "*.ts", "*.tsx", "*.js", "*.jsx" },
  group = lsp_code_actions,
  callback = function() require("typescript").actions.addMissingImports() end,
})

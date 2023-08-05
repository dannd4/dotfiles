if vim.fn.executable "autocomp" == 1 then
  vim.api.nvim_create_autocmd("VimLeave", {
    desc = "Stop running auto compiler on leave",
    group = vim.api.nvim_create_augroup("quit_autocomp", { clear = true }),
    pattern = "*",
    callback = function() vim.fn.jobstart { "autocomp", vim.fn.expand "%:p", "stop" } end,
  })
end

-- text like documents enable wrap and spell
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "gitcommit", "markdown", "text", "plaintex" },
  group = vim.api.nvim_create_augroup("auto_spell", { clear = true }),
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- auto hide tabline
vim.api.nvim_create_autocmd("User", {
  pattern = "AstroBufsUpdated",
  group = vim.api.nvim_create_augroup("autohidetabline", { clear = true }),
  callback = function()
    local new_showtabline = #vim.t.bufs > 1 and 2 or 1
    if new_showtabline ~= vim.opt.showtabline:get() then vim.opt.showtabline = new_showtabline end
  end,
})

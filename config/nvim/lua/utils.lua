local M = {}

M.git_available = vim.fn.executable("git") == 1

M.is_tmux = vim.trim((vim.env.TERM_PROGRAM or ""):lower()) == "tmux"

--- Merge extended options with a default table of options
---@param default? table The default table that you want to merge into
---@param opts? table The new options that should be merged with the default table
---@return table extended The extended table
function M.extend_tbl(default, opts)
  opts = opts or {}
  return default and vim.tbl_deep_extend("force", default, opts) or opts
end

return M

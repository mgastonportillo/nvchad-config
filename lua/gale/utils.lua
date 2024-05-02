---@class UtilsObject
local M = {}

---@param mode string | table Vim mode
---@param lhs string Trigger key
---@param rhs string | function Action to perform
---@param opts? table | nil Options
--- Create a global keymap
M.glb_map = function(mode, lhs, rhs, opts)
  local final_opts = { noremap = true, silent = true }
  if opts then
    final_opts = vim.tbl_extend("force", final_opts, opts)
  end
  vim.keymap.set(mode, lhs, rhs, final_opts)
end

---@param mode string Vim mode
---@param lhs string Trigger key
---@param rhs string Action to perform
---@param opts? table<string, any> Options
--- Create a keymap local to buffer
M.buf_map = function(mode, lhs, rhs, opts)
  local final_opts = { noremap = true, silent = true }
  if opts then
    final_opts = vim.tbl_extend("force", final_opts, opts)
  end
  vim.api.nvim_buf_set_keymap(0, mode, lhs, rhs, final_opts)
end

return M

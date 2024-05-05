---@class UtilsObject
local M = {}

---@param target_cmd string Command to add an alias for
---@param alias string Alias name
--- Add an alias to any existing command
M.add_alias = function(target_cmd, alias)
  vim.cmd("ca " .. alias .. " " .. target_cmd)
end

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

---@type fun(v: any): boolean
M.is_tbl = function(v)
  if type(v) == "table" then
    return true
  else
    return false
  end
end

---@param mode string | table Can be a single mode or a table of modes
---@param trigger string | table Can be a single trigger or a table or triggers
--- Delete keymap/s globally
M.del_map = function(mode, trigger)
  local del = vim.api.nvim_del_keymap
  local is_tbl = M.is_tbl

  local get_case = function(vmode, lhs)
    if is_tbl(vmode) and is_tbl(lhs) then
      return 1
    elseif is_tbl(vmode) and not is_tbl(lhs) then
      return 2
    elseif not is_tbl(vmode) and is_tbl(lhs) then
      return 3
    elseif not is_tbl(vmode) and not is_tbl(lhs) then
      return 4
    end
  end

  local case = get_case(mode, trigger)
  switch(case, {
    [1] = function()
      ---@cast mode table
      ---@cast trigger table
      for _, mode_val in ipairs(mode) do
        for _, trigger_val in ipairs(trigger) do
          del(mode_val, trigger_val)
        end
      end
    end,
    [2] = function()
      ---@cast mode table
      ---@cast trigger string
      for _, modeval in ipairs(mode) do
        del(modeval, trigger)
      end
    end,
    [3] = function()
      ---@cast mode string
      ---@cast trigger table
      for _, triggerval in ipairs(trigger) do
        del(mode, triggerval)
      end
    end,
    [4] = function()
      ---@cast mode string
      ---@cast trigger string
      del(mode, trigger)
    end,
  })
end

return M

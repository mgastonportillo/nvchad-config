---@class Utils
local M = {}

---@param target_cmd string
---@param alias string
--- Add an alias to any existing command
M.add_alias = function(target_cmd, alias)
  vim.cmd("ca " .. alias .. " " .. target_cmd)
end

---@param mode string | table
---@param lhs string
---@param rhs string | function
---@param opts? table | nil
--- Create a global keymap
M.glb_map = function(mode, lhs, rhs, opts)
  local final_opts = { noremap = true, silent = true }
  if opts then
    final_opts = vim.tbl_extend("force", final_opts, opts)
  end
  vim.keymap.set(mode, lhs, rhs, final_opts)
end

---@param mode string
---@param lhs string
---@param rhs string
---@param opts? table<string, any>
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

---@param mode string | table
---@param trigger string | table
--- Delete keymap/s globally
M.del_map = function(mode, trigger)
  local del = vim.api.nvim_del_keymap
  local is_tbl = M.is_tbl

  local get_case = function(vmode, lhs)
    if not is_tbl(vmode) and not is_tbl(lhs) then
      return 1
    elseif not is_tbl(vmode) and is_tbl(lhs) then
      return 2
    elseif is_tbl(vmode) and not is_tbl(lhs) then
      return 3
    elseif is_tbl(vmode) and is_tbl(lhs) then
      return 4
    end
  end

  local case = get_case(mode, trigger)
  switch(case, {
    [1] = function()
      ---@cast mode string
      ---@cast trigger string
      del(mode, trigger)
    end,
    [2] = function()
      ---@cast mode string
      ---@cast trigger table
      for _, triggerval in ipairs(trigger) do
        del(mode, triggerval)
      end
    end,
    [3] = function()
      ---@cast mode table
      ---@cast trigger string
      for _, modeval in ipairs(mode) do
        del(modeval, trigger)
      end
    end,
    [4] = function()
      ---@cast mode table
      ---@cast trigger table
      for _, mode_val in ipairs(mode) do
        for _, trigger_val in ipairs(trigger) do
          del(mode_val, trigger_val)
        end
      end
    end,
  })
end

---@param padding string
M.wt_padding = function(padding)
  local file = "C:\\wt_vimpadding.ps1"
  local profile = "WSL"
  local cmd = string.format("silent !pwsh.exe -File '%s' -profile '%s' -padding '%s'", file, profile, padding)
  vim.cmd(cmd)
end

return M

---@class Utils
--- Add an alias to any existing command
---@field add_alias fun(target_cmd: string, alias: string)
--- Check if any value is a table
---@field is_tbl fun(v: any): boolean
--- Create a global keymap
---@field glb_map fun(mode: string | table, lhs: string | table, rhs: string | fun(), opts?: table | nil)
--- Create a keymap local to buffer
---@field buf_map fun(buf?: integer, mode: string, lhs: string | table, rhs: string, opts?: table)
--- Delete keymap/s globally. Does not attempt to unmap if keymap does not exist.
---@field del_map fun(mode: string | table, trigger: string | table)
--- Format a file based on its path, using conform
---@field format_file fun(file_path: string)
local M = {}

M.add_alias = function(target_cmd, alias)
  vim.cmd("ca " .. alias .. " " .. target_cmd)
end

M.is_tbl = function(v)
  if type(v) == "table" then
    return true
  else
    return false
  end
end

M.glb_map = function(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }

  if opts then
    options = vim.tbl_extend("force", options, opts)
  end

  if M.is_tbl(lhs) then
    ---@cast lhs table
    for _, trigger in ipairs(lhs) do
      vim.keymap.set(mode, trigger, rhs, options)
    end
  else
    ---@cast lhs string
    vim.keymap.set(mode, lhs, rhs, options)
  end
end

M.buf_map = function(buf, mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }

  if opts then
    options = vim.tbl_extend("force", options, opts)
  end

  if M.is_tbl(lhs) then
    ---@cast lhs table
    for _, trigger in ipairs(lhs) do
      vim.api.nvim_buf_set_keymap(buf or 0, mode, trigger, rhs, options)
    end
  else
    ---@cast lhs string
    vim.api.nvim_buf_set_keymap(buf or 0, mode, lhs, rhs, options)
  end
end

local map_exists = function(name, map_mode)
  local check = vim.fn.maparg(name, map_mode)
  if check == "" then
    return false
  elseif check == {} then
    return false
  else
    return true
  end
end

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
      if map_exists(trigger, mode) then
        del(mode, trigger)
      end
    end,
    [2] = function()
      ---@cast mode string
      ---@cast trigger table
      for _, triggerval in ipairs(trigger) do
        if map_exists(triggerval, mode) then
          del(mode, triggerval)
        end
      end
    end,
    [3] = function()
      ---@cast mode table
      ---@cast trigger string
      for _, modeval in ipairs(mode) do
        if map_exists(trigger, modeval) then
          del(modeval, trigger)
        end
      end
    end,
    [4] = function()
      ---@cast mode table
      ---@cast trigger table
      for _, modeval in ipairs(mode) do
        for _, triggerval in ipairs(trigger) do
          if map_exists(triggerval, modeval) then
            del(modeval, triggerval)
          end
        end
      end
    end,
  })
end

local is_inspect_tree_open = function()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local buf_name = vim.api.nvim_get_option_value("filetype", { buf = buf })
    if buf_name and buf_name == "query" then
      return true, win
    end
  end
  return false, nil
end

--- Toggle treesitter inspection tree
M.toggle_inspect_tree = function()
  local open, win = is_inspect_tree_open()
  if open then
    ---@cast win integer
    local bufnr = vim.api.nvim_win_get_buf(win)
    vim.api.nvim_buf_delete(bufnr, { force = true })
  else
    vim.cmd "InspectTree"
  end
end

--- Navigate to plugin repo if valid string name under cursor
M.go_to_github_link = function()
  local ts = vim.treesitter
  local node = ts.get_node()

  if not node then
    return
  end

  local string = ts.get_node_text(node, 0)

  local is_github_string = function(str)
    local _, count = str:gsub("/", "")
    return count == 1
  end

  if string then
    local is_valid_string = is_github_string(string)

    if is_valid_string then
      local gh_link = string.format("https://github.com/%s.git", string)
      vim.ui.open(gh_link)
    else
      vim.notify.dismiss() ---@diagnostic disable-line
      vim.notify(" Not a valid GitHub string", vim.log.levels.ERROR, { icon = "" })
      return
    end
  else
    vim.notify.dismiss() ---@diagnostic disable-line
    vim.notify(" Not a string", vim.log.levels.ERROR, { icon = "" })
    return
  end
end

M.format_file = function(file_path)
  local bufnr = vim.fn.bufadd(file_path)
  vim.fn.bufload(bufnr)

  require("conform").format {
    lsp_fallback = true,
    bufnr = bufnr,
  }

  if vim.api.nvim_get_option_value("modified", { buf = bufnr }) then
    vim.api.nvim_buf_call(bufnr, function()
      vim.cmd "w"
    end)
  end

  vim.api.nvim_buf_delete(bufnr, { force = true })
end

return M

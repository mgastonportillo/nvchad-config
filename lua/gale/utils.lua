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

---@param mode string | table
---@param trigger string | table
--- Delete keymap/s globally. Does not attempt to unmap if keymap does not exist.
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

--- Custom lsp on attach
M.on_attach = function(client, bufnr)
  local on_attach = require("nvchad.configs.lspconfig").on_attach
  on_attach(client, bufnr)

  local border = "rounded"
  -- vim.lsp.buf.hover()
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })
  -- vim.lsp.buf.signature_help()
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border })

  if client.server_capabilities.inlayHintProvider then
    vim.lsp.inlay_hint.enable()
  end
end

--- Check if the TS inspect window is open
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

--- Function to toggle the Treesitter inspection window
M.toggle_inspect_tree = function()
  local open, win = is_inspect_tree_open()
  if open then
    ---@cast win integer
    vim.api.nvim_win_close(win, true)
  else
    vim.cmd "InspectTree"
  end
end

return M

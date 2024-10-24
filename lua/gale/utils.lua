---@class Utils
--- Add an alias to any existing command
---@field add_alias fun(target_cmd: string, alias: string)
--- Check if any value is a table
---@field is_tbl fun(v: any): boolean
--- Create a global keymap
---@field glb_map fun(mode: string | table, lhs: string | table, rhs: string | fun(), opts?: table | nil)
--- Create a keymap local to buffer
---@field buf_map fun(buf?: integer, mode: string | table, lhs: string | table, rhs: string | fun(), opts?: table)
--- Delete keymap/s globally. Does not attempt to unmap if keymap does not exist.
---@field del_map fun(mode: string | table, trigger: string | table)
--- Format a file based on its path, using conform
---@field format_file fun(file_path: string)
--- Helper function to match valid "words" in a line
---@field word_iterator fun(line: string): function
--- Helper function to count valid "words" in a line
---@field count_with_exclude fun(line: string, opts?: table): integer
--- Return count of valid "words" in a line as a string
---@field count_words_in_line fun(): string
--- Return count of valid "words" in a buffer as a string
---@field count_words_in_buffer fun(): string
--- Debounce a function by timeout
---@field debounce fun(func: function, timeout: integer): function
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

M.buf_map = function(bufnr, mode, lhs, rhs, opts)
  opts = opts or {}
  opts.buffer = bufnr and bufnr or 0
  M.glb_map(mode, lhs, rhs, opts)
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

--- Listener for code actions capabilities
M.code_action_listener = function()
  local buffer = vim.api.nvim_get_current_buf()
  local clients = vim.lsp.get_clients { bufnr = buffer }

  if clients == nil or #clients == 0 then
    return
  end

  local has_code_action_support = vim.tbl_filter(function(client)
    return client.server_capabilities.codeActionProvider
  end, clients)[1] ~= nil

  if has_code_action_support then
    local context = { diagnostics = vim.lsp.diagnostic.get_line_diagnostics(buffer) }
    local params = vim.lsp.util.make_range_params()
    params.context = context

    vim.lsp.buf_request(buffer, "textDocument/codeAction", params, function(_, result, _, _)
      vim.fn.sign_unplace("code_action_gear", { buffer = buffer })

      if result and next(result) then
        vim.fn.sign_place(
          0,
          "code_action_gear",
          "CodeActionSign",
          buffer,
          { lnum = vim.api.nvim_win_get_cursor(0)[1], priority = 100 }
        )
      end
    end)
  end
end

M.handle_copy = function()
  local mode = vim.fn.mode()
  if mode == "v" or mode == "V" or mode == "" then
    if vim.fn.line "'<" == vim.fn.line "'>" and vim.fn.col "'<" == vim.fn.col "'>" then
      vim.cmd.normal '"+yy'
    else
      vim.cmd.normal '"+y'
    end
  else
    vim.cmd.normal '"+yy'
  end
end

M.handle_paste = function()
  vim.cmd.normal '"+p'
end

M.menus = {
  main = {
    --[[ {
      name = "  Copy",
      cmd = M.handle_copy,
    },
    {
      name = "  Paste",
      cmd = M.handle_paste,
    },
    { name = "separator" }, ]]
    {
      name = "󰉁 Lsp Actions",
      hl = "Exblue",
      items = "lsp",
    },
    { name = "separator" },
    {
      name = "  Color Picker",
      hl = "Exred",
      cmd = function()
        require("minty.huefy").open()
      end,
    },
  },
}

M.word_iterator = function(line)
  -- Match sequences of alphanumeric characters, underscores, periods, or hyphens
  local pattern = "[%w_%-%.]+"
  return function()
    return string.gmatch(line, pattern)
  end
end

M.count_with_exclude = function(line, opts)
  opts = opts or {}
  local word_count = 0
  for word in M.word_iterator(line)() do
    if word ~= opts.exclude then
      word_count = word_count + 1
    end
  end
  return word_count
end

vim.g.st_words_in_line = true
M.count_words_in_line = function()
  local line = vim.api.nvim_get_current_line()
  local word_count = M.count_with_exclude(line, { exclude = ".." })
  if vim.g.st_words_in_line then
    return string.format(" %%#St_GitBranch#%d ", word_count)
  else
    return ""
  end
end

M.count_words_in_buffer = function()
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local total_word_count = 0
  for _, line in ipairs(lines) do
    total_word_count = total_word_count + M.count_with_exclude(line, { exclude = ".." })
  end
  if vim.g.st_words_in_buffer then
    return string.format(" %d ", total_word_count)
  else
    return ""
  end
end

M.clear_registers = function()
  vim.cmd "rshada!"

  for i = 0, 9 do
    vim.fn.setreg(tostring(i), "")
  end

  for char = string.byte "a", string.byte "z" do
    vim.fn.setreg(string.char(char), "")
    vim.fn.setreg(string.char(char):upper(), "")
  end

  local special_registers = { '"', "-", "_", "*", "+", "=" }
  for _, reg in ipairs(special_registers) do
    vim.fn.setreg(reg, "")
  end

  if vim.fn.bufname "#" ~= "" then
    vim.fn.setreg("#", "")
  end

  vim.cmd "let @/ = ''"

  vim.cmd "wshada!"
end

M.harpoon_menu = function()
  local harpoon = require "harpoon"
  harpoon.ui:toggle_quick_menu(harpoon:list(), {
    title = " Harpoon btw ",
    title_pos = "center",
    border = "rounded",
    ui_width_ratio = 0.40,
  })
end

M.debounce = function(func, timeout)
  local timer = vim.uv.new_timer()
  return function(...)
    timer:stop()
    local args = { ... }
    timer:start(timeout, 0, function()
      vim.schedule_wrap(func)(unpack(args))
    end)
  end
end

return M

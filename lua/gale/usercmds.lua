local create_cmd = vim.api.nvim_create_user_command
local utils = require "gale.utils"

create_cmd("WipeReg", function()
  utils.clear_registers()
  vim.notify(" Registers cleared and shada file successfully updated.", vim.log.levels.INFO)
end, { desc = "Wipe registers" })

create_cmd("ToggleWordCount", function()
  if vim.g.st_words_in_buffer then
    vim.g.st_words_in_buffer = false
    vim.g.st_words_in_line = true
  else
    vim.g.st_words_in_buffer = true
    vim.g.st_words_in_line = false
  end
end, { desc = "Toggle word count mode (line/buffer)" })

create_cmd("TabuflineToggle", function()
  if vim.g.tabufline_visible then
    vim.o.showtabline = 0
    vim.g.tabufline_visible = false
  else
    vim.o.showtabline = 2
    vim.g.tabufline_visible = true
  end
end, { desc = "Toggle Tabufline" })

create_cmd("SrcPlugins", function()
  local script = vim.fn.stdpath "config"
  vim.cmd("luafile " .. script .. "/scripts/update-lazy-imports.lua")
end, { desc = "Update plugins imports" })

create_cmd("SrcFile", function()
  if vim.bo.filetype ~= "" then
    vim.cmd "so %"
    vim.notify.dismiss() ---@diagnostic disable-line
    vim.notify(vim.fn.expand "%" .. " sourced!", vim.log.levels.INFO)
  else
    vim.notify.dismiss() ---@diagnostic disable-line
    vim.notify("No file to source", vim.log.levels.ERROR)
  end
end, { desc = "Source current file" })

create_cmd("TabbyStart", function()
  require("gale.tabby").start()
end, { desc = "Start TabbyML docker container" })

create_cmd("TabbyStop", function()
  require("gale.tabby").stop()
end, { desc = "Stop TabbyML docker container" })

create_cmd("ToggleInlayHints", function()
  ---@diagnostic disable-next-line
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toogle inlay hints in current buffer" })

create_cmd("DiagnosticsVirtualTextToggle", function()
  local current_value = vim.diagnostic.config().virtual_text
  if current_value then
    vim.diagnostic.config { virtual_text = false }
  else
    vim.diagnostic.config { virtual_text = true }
  end
end, { desc = "Toggle inline diagnostics" })

create_cmd("DiagnosticsToggle", function()
  local current_value = vim.diagnostic.is_enabled()
  if current_value then
    vim.diagnostic.enable(false)
  else
    vim.diagnostic.enable(true)
  end
end, { desc = "Toggle diagnostics" })

create_cmd("DapUIToggle", function()
  require("dapui").toggle()
end, { desc = "Open DapUI" })

create_cmd("UpdateAll", function()
  require("lazy").load { plugins = { "mason.nvim", "nvim-treesitter" } }
  vim.cmd "MasonUpdate"
  vim.cmd "TSUpdate"
  vim.cmd "Lazy sync"
end, { desc = "Batch update" })

create_cmd("FormatToggle", function(args)
  local is_global = not args.bang
  if is_global then
    vim.g.disable_autoformat = not vim.g.disable_autoformat
    if vim.g.disable_autoformat then
      vim.notify("Format on save disabled", vim.log.levels.WARN)
    else
      vim.notify("Format on save enabled", vim.log.levels.INFO)
    end
  else
    vim.b.disable_autoformat = not vim.b.disable_autoformat
    if vim.b.disable_autoformat then
      vim.notify("Format on save disabled for this buffer", vim.log.levels.WARN)
    else
      vim.notify("Format on save enabled for this buffer", vim.log.levels.INFO)
    end
  end
end, {
  desc = "Toggle format on save",
  bang = true,
})

create_cmd("FormatFile", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "Format files via conform" })

create_cmd("FormatProject", function()
  local project_dir = vim.fn.getcwd()
  local lua_files = vim.fn.systemlist("find " .. project_dir .. ' -type f -name "*.lua"')
  for _, path in ipairs(lua_files) do
    utils.format_file(path)
  end
end, { desc = "Format project via conform" })

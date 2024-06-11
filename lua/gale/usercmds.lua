local create_cmd = vim.api.nvim_create_user_command
local utils = require "gale.utils"

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

create_cmd("AutoFormatToggle", function()
  local on_save = vim.g.disable_autoformat
  if on_save == true then
    vim.g.disable_autoformat = false
    vim.notify.dismiss() ---@diagnostic disable-line
    vim.notify("Auto-format enabled", vim.log.levels.INFO)
  else
    vim.g.disable_autoformat = true
    vim.notify.dismiss() ---@diagnostic disable-line
    vim.notify("Auto-format disabled", vim.log.levels.WARN)
  end
end, { desc = "Toggle autoformat-on-save" })

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

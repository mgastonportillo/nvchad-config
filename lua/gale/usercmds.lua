local create_cmd = vim.api.nvim_create_user_command

create_cmd("DiagnosticsVirtualTextToggle", function()
  local current_value = vim.diagnostic.config().virtual_text
  if current_value then
    vim.diagnostic.config { virtual_text = false }
  else
    vim.diagnostic.config { virtual_text = true }
  end
end, { desc = "Toggle inline diagnostics" })

create_cmd("DiagnosticsToggle", function()
  local current_value = vim.diagnostic.is_disabled()
  if current_value then
    vim.diagnostic.enable()
  else
    vim.diagnostic.disable()
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

create_cmd("FormatFile", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "Format files via conform" })

create_cmd("AutoFormatToggle", function()
  local on_save = vim.g.disable_autoformat
  if on_save == true then
    vim.g.disable_autoformat = false
    vim.notify.dismiss() ---@diagnostic disable-line
    vim.notify("Auto-format enabled", vim.log.levels.INFO)
  else
    vim.g.disable_autoformat = true
    vim.notify.dismiss() ---@diagnostic disable-line
    vim.notify("Auto-format disabled", vim.log.levels.INFO)
  end
end, { desc = "Toggle autoformat-on-save" })

create_cmd("NvCloseBuffer", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "Close buffer via tabufline" })

local create_cmd = vim.api.nvim_create_user_command

-- Requires neovim nightly -- experimental
create_cmd("InlayHintsToggle", function()
  local inlay = vim.lsp.inlay_hint
  inlay.enable(0, not inlay.is_enabled())
  if inlay.is_enabled(0) then
    print "Inlay hints enabled"
  else
    print "Inlay hints disabled"
  end
end, { desc = "Toogle inlay hints in current buffer" })

create_cmd("AutoFormatToggle", function()
  local on_save = vim.g.disable_autoformat
  if on_save == true then
    vim.g.disable_autoformat = false
    print "Auto-format enabled"
  else
    vim.g.disable_autoformat = true
    print "Auto-format disabled"
  end
end, {
  desc = "Toggle autoformat-on-save",
})

create_cmd("DiagnosticsVirtualTextToggle", function()
  local current_value = vim.diagnostic.config().virtual_text
  if current_value then
    vim.diagnostic.config { virtual_text = false }
  else
    vim.diagnostic.config { virtual_text = true }
  end
end, { desc = "Toggle inline diagnostics." })

create_cmd("DiagnosticsToggle", function()
  local current_value = vim.diagnostic.is_disabled()
  if current_value then
    vim.diagnostic.enable()
  else
    vim.diagnostic.disable()
  end
end, { desc = "Toggle diagnostics." })

create_cmd("DapUIToggle", function()
  require("dapui").toggle()
end, { desc = "Open DapUI." })

create_cmd("UpdateAll", function()
  require("lazy").load { plugins = { "mason.nvim", "nvim-treesitter" } }
  vim.cmd "MasonUpdate"
  vim.cmd "TSUpdate"
  vim.cmd "Lazy sync"
end, { desc = "Batch update." })

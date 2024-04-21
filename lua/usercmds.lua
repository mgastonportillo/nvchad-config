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

create_cmd("FormatDisable", function(args)
  if args.bang then
    -- FormatDisable! will disable formatting just for this buffer
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, {
  desc = "Disable autoformat-on-save",
  bang = true,
})

create_cmd("FormatEnable", function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = "Enable autoformat-on-save",
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

create_cmd("ToggleDapUI", function()
  require("dapui").toggle()
end, { desc = "Open DapUI." })

create_cmd("UpdateAll", function()
  require("lazy").load { plugins = { "mason.nvim", "nvim-treesitter" } }
  vim.cmd "MasonUpdate"
  vim.cmd "TSUpdate"
  vim.cmd "Lazy sync"
end, { desc = "Batch update." })

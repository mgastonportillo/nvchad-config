local create_cmd = vim.api.nvim_create_user_command
local settings = require("custom.chadrc").settings

-- Command to toggle inline diagnostics
vim.api.nvim_create_user_command("DiagnosticsToggleVirtualText", function()
  local current_value = vim.diagnostic.config().virtual_text
  if current_value then
    vim.diagnostic.config { virtual_text = false }
  else
    vim.diagnostic.config { virtual_text = true }
  end
end, {})

-- Command to toggle diagnostics
vim.api.nvim_create_user_command("DiagnosticsToggle", function()
  local current_value = vim.diagnostic.is_disabled()
  if current_value then
    vim.diagnostic.enable()
  else
    vim.diagnostic.disable()
  end
end, {})

-- Toggle colorcolumn
create_cmd("TCC", function()
  vim.g.ccenable = not vim.g.ccenable

  if vim.g.ccenable then
    vim.opt.cc = settings.cc_size
  else
    vim.opt.cc = "0"
  end
end, {})

-- -- Open DapUi
-- create_cmd("TDebug", function()
--   require("dapui").toggle()
-- end, {})

-- -- Update nvim
-- create_cmd("BatchUpdate", function()
--   require("lazy").load { plugins = { "mason.nvim", "nvim-treesitter" } }
--   vim.cmd "MasonUpdate"
--   vim.cmd "TSUpdate"
--   vim.cmd "NvChadUpdate"
-- end, {})

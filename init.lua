-- Re-activate some default providers
for _, provider in ipairs { "python3_provider", "node_provider" } do
  vim.g["loaded_" .. provider] = nil
  vim.cmd("runtime " .. provider)
end

-- Set python3 executable path for faster startup
vim.g.python3_host_prog = "$HOME/.config/nvim/venv/bin/python"

-- Enable dap virtual text
vim.g.dap_virtual_text = true

-- Set path and suffixesadd options
vim.o.path = ".,src**"
vim.o.suffixesadd = ".js,.jsx"

-- Define LoadMainNodeModule function
function LoadMainNodeModule(fname)
  local nodeModules = "./node_modules/"
  local packageJsonPath = nodeModules .. fname .. "/package.json"

  if vim.fn.filereadable(packageJsonPath) == 1 then
    return nodeModules .. fname .. "/" .. vim.fn.json_decode(vim.fn.join(vim.fn.readfile(packageJsonPath))).main
  else
    return nodeModules .. fname
  end
end

-- Set includeexpr option
vim.o.includeexpr = "v:lua.LoadMainNodeModule(v:fname)"

-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

local M = {}

M.WSL_PASTE = [[
  pwsh.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))
]]

return M

local M = {}

M.WSL_PASTE = [[
  pwsh.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))
]]

M.WT_PADDING = [[]]

return M

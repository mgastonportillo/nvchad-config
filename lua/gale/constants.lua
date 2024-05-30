---@class Constants
--- :h clipboard-wsl
---@field CLIPBOARD table<string, string>
local M = {}

M.CLIPBOARD = {
  WSL_COPY = "clip.exe",
  WSL_PASTE = 'pwsh.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
}

return M

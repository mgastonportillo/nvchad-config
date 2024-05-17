local M = {}

---@class ClipboardIO
---@field WSL_COPY string
---@field WSL_PASTE string
M.CLIPBOARD = {
  WSL_COPY = "clip.exe",
  WSL_PASTE = "pwsh.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace('`r', ''))",
}

return M

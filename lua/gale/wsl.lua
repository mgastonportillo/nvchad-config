if not vim.fn.has "wsl" then
  return
end

-- set a global value to indicate that we are in WSL
vim.g.is_wsl = true

local copy = "clip.exe"
local paste = 'pwsh.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))'
vim.g.clipboard = {
  name = "wslclipboard",
  copy = { ["+"] = copy, ["*"] = copy },
  paste = { ["+"] = paste, ["*"] = paste },
  cache_enabled = 0,
}

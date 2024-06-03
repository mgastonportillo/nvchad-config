-- NOTE: WSL + WT padding recipe: "20,4,0,-4"
if vim.fn.has "wsl" then
  local copy = "clip.exe"
  local paste = 'pwsh.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))'
  vim.g.clipboard = {
    name = "wslclipboard",
    copy = { ["+"] = copy, ["*"] = copy },
    paste = { ["+"] = paste, ["*"] = paste },
    cache_enabled = 0,
  }
end

-- NOTE: WSL + WT padding recipe: "20,4,0,-4"
if vim.fn.has "wsl" then
  local clip = {
    WSL_COPY = "clip.exe",
    WSL_PASTE = 'pwsh.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
  }

  vim.g.clipboard = {
    name = "wslclipboard",
    copy = { ["+"] = clip.WSL_COPY, ["*"] = clip.WSL_COPY },
    paste = { ["+"] = clip.WSL_PASTE, ["*"] = clip.WSL_PASTE },
    cache_enabled = 0,
  }
end

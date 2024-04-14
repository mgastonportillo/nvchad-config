require "nvchad.options"

-- Re-activate providers
local providers = {
  "python3_provider",
  "node_provider",
}

-- Clipboard commands
local clipboard = {
  copy = "clip.exe",
  paste = [[
    pwsh.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))
  ]],
}

local g = {
  dap_virtual_text = true,
  bookmark_sign = "",
  skip_ts_context_commentstring_module = true,
  -- use Windows clipboard for + and * registers
  clipboard = {
    name = "wslclipboard",
    copy = {
      ["+"] = clipboard.copy,
      ["*"] = clipboard.copy,
    },
    paste = {
      ["+"] = clipboard.paste,
      ["*"] = clipboard.paste,
    },
    cache_enabled = 0,
  },
}

local opt = {
  encoding = "utf-8",
  fileencoding = "utf-8",
  -- Prevent issues with some language servers
  backup = false,
  swapfile = false,
  -- Always show minimum n lines after current line
  scrolloff = 10,
  -- Making sure backspace works as intended
  backspace = "indent,eol,start",
  -- True color support
  termguicolors = true,
  emoji = false,
  relativenumber = true,
  -- Line break/wrap behaviours
  wrap = true,
  linebreak = true,
  textwidth = 0,
  wrapmargin = 0,
  -- Indentation values
  expandtab = true,
  tabstop = 2,
  -- Use tabstop value for shiftwidth
  shiftwidth = 0,
  autoindent = true,
  cursorline = false,
  iskeyword = vim.opt.iskeyword:append { ",", "_", "@", ".", "-" },
}

-- GROUP: [[ LOOPS ]]

for _, v in ipairs(providers) do
  vim.g["loaded_" .. v] = nil
  vim.cmd("runtime " .. v)
end

for k, v in pairs(g) do
  vim.g[k] = v
end

for k, v in pairs(opt) do
  vim.opt[k] = v
end

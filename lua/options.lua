require "nvchad.options"
local const = require "gale.constants"
local wsl_paste = const.WSL_PASTE

local g = {
  dap_virtual_text = true,
  bookmark_sign = "",
  skip_ts_context_commentstring_module = true,
  -- :h clipboard-wsl
  clipboard = {
    name = "wslclipboard",
    copy = { ["+"] = "clip.exe", ["*"] = "clip.exe" },
    paste = { ["+"] = wsl_paste, ["*"] = wsl_paste },
    cache_enabled = 0,
  },
}
for k, v in pairs(g) do
  vim.g[k] = v
end

local tabSize = 2
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
  tabstop = tabSize,
  shiftwidth = tabSize,
  expandtab = true,
  autoindent = true,
  cursorline = true,
  cursorlineopt = "both",
  inccommand = "split",
  ignorecase = true,
  iskeyword = vim.opt.iskeyword:append { "_", "@", ".", "-" },
  path = ".,src**", -- TODO: find a better way to improve `gf`
}
for k, v in pairs(opt) do
  vim.opt[k] = v
end

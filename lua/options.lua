require "nvchad.options"

local g = {
  dap_virtual_text = true,
  bookmark_sign = "",
  skip_ts_context_commentstring_module = true,
}

local opt = {
  encoding = "utf-8",
  fileencoding = "utf-8",
  clipboard = "unnamedplus", -- extended via "gale.wsl"
  -- Folds
  foldmethod = "expr",
  foldexpr = "v:lua.vim.treesitter.foldexpr()",
  foldcolumn = "0",
  foldtext = "",
  foldlevel = 99,
  foldlevelstart = 1,
  foldnestmax = 1,
  -- Prevent issues with some language servers
  backup = false,
  swapfile = false,
  -- Always show minimum n lines after/before current line
  scrolloff = 10,
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
  tabstop = 2,
  shiftwidth = 0, -- 0 forces same value as tabstop
  expandtab = true,
  autoindent = true,
  cursorline = true,
  cursorlineopt = "both",
  inccommand = "split",
  ignorecase = true,
  updatetime = 100,
  lazyredraw = false,
  iskeyword = vim.opt.iskeyword:append { "_", "@", ".", "-" },
  path = vim.opt.path:append { "**", "lua", "src" },
}

for k, v in pairs(g) do
  vim.g[k] = v
end

for k, v in pairs(opt) do
  vim.opt[k] = v
end

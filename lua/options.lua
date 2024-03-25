require("nvchad.options")

local fn = vim.fn
local g = vim.g
local o = vim.o
local opt = vim.opt
local wo = vim.wo

-- Sane defaults (for me at least)
wo.statuscolumn = ""
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.backup = false --- Recommended by coc
opt.swapfile = false
opt.scrolloff = 10 -- always show minimum n lines after current line
opt.relativenumber = false -- Show relative numberline
opt.wrap = true
opt.linebreak = true
opt.textwidth = 0
opt.wrapmargin = 0
opt.iskeyword:append("-")
opt.termguicolors = true -- True color support
opt.autoindent = true --- Good auto indent
opt.backspace = "indent,eol,start" --- Making sure backspace works

-- Folds (not working)
opt.foldenable = true
opt.foldcolumn = "auto" -- show foldcolumn in nvim 0.9
opt.foldnestmax = 0
opt.foldlevel = 99
opt.foldlevelstart = 99
vim.opt.fillchars = {
	-- horiz     = '━',
	-- horizup   = '┻',
	-- horizdown = '┳',
	-- vert      = '┃',
	-- vertleft  = '┫',
	-- vertright = '┣',
	-- verthoriz = '╋',
	fold = " ",
	foldopen = "",
	foldsep = " ",
	foldclose = "",
	stl = " ",
	eob = " ",
}
-- opt.foldmethod = "syntax"
opt.foldmethod = "expr"
-- opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldexpr = ""

-- Bookmark
g.bookmark_sign = ""
-- g.bookmark_highlight = "CopilotHl"

-- Copilot
-- g.copilot_assume_mapped = true

opt.emoji = false
opt.cursorline = true

g.python3_host_prog = "$HOME/.config/nvim-venv/bin/python"
g.dap_virtual_text = true

-- Improve the way in which node_modules are handled
o.path = ".,src**"
o.suffixesadd = ".js,.jsx"
function LoadMainNodeModule(fname)
	local nodeModules = "./node_modules/"
	local packageJsonPath = nodeModules .. fname .. "/package.json"
	if fn.filereadable(packageJsonPath) == 1 then
		return nodeModules .. fname .. "/" .. fn.json_decode(fn.join(fn.readfile(packageJsonPath))).main
	else
		return nodeModules .. fname
	end
end
o.includeexpr = "v:lua.LoadMainNodeModule(v:fname)"

-- o.cursorlineopt ='both' -- to enable cursorline!

-- if g.neovide then
--   opt.guifont = "JetbrainsMono Nerd Font:h12"
--   g.neovide_refresh_rate = 120
--   g.neovide_remember_window_size = true
--   g.neovide_cursor_antialiasing = true
--   g.neovide_input_macos_alt_is_meta = true
--   g.neovide_input_use_logo = false
--   g.neovide_padding_top = 0
--   g.neovide_padding_bottom = 0
--   g.neovide_padding_right = 0
--   g.neovide_padding_left = 0
--   g.neovide_floating_blur_amount_x = 3.0
--   g.neovide_floating_blur_amount_y = 3.0
-- end

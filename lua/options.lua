require("nvchad.options")

-- TODO: I need to figure folds out

vim.wo.statuscolumn = ""

local g = {
	python3_host_prog = "$HOME/.config/nvim-venv/bin/python",
	dap_virtual_text = true,
	bookmark_sign = "",
}

for k, v in pairs(g) do
	vim.g[k] = v
end

---@diagnostic disable-next-line
function LoadMainNodeModule(fname) end

local opt = {
	encoding = "utf-8",
	fileencoding = "utf-8",
	-- Prevent issues with some language servers
	backup = false,
	swapfile = false,
	-- Always show minimum n lines after current line
	scrolloff = 10,
	relativenumber = true,
	-- True color support
	termguicolors = true,
	emoji = false,
	wrap = true,
	linebreak = true,
	textwidth = 0,
	wrapmargin = 0,
	autoindent = true,
	cursorline = true,
	-- Making sure backspace works as intended
	backspace = "indent,eol,start",
	iskeyword = vim.opt.iskeyword:append({ ",", "_", "@", ".", "-" }),
	-- Improve the way in which node_modules are handled
	path = ".,src**",
	suffixesadd = ".js,.jsx",
	includeexpr = "v:lua.LoadMainNodeModule(v:fname)",
}

for k, v in pairs(opt) do
	vim.opt[k] = v
end

--[[
      Auxiliary functions
]]

function LoadMainNodeModule(fname)
	local fn = vim.fn
	local nodeModules = "./node_modules/"
	local packageJsonPath = nodeModules .. fname .. "/package.json"

	if fn.filereadable(packageJsonPath) == 1 then
		return nodeModules .. fname .. "/" .. fn.json_decode(fn.join(fn.readfile(packageJsonPath))).main
	else
		return nodeModules .. fname
	end
end

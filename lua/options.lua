require("nvchad.options")

vim.wo.statuscolumn = ""

local g = {
	dap_virtual_text = true,
	bookmark_sign = "",
	-- This is a WSL specific setting to use the Windows clipboard for + and * registers
	clipboard = {
		name = "WslClipboard",
		copy = {
			["+"] = "clip.exe",
			["*"] = "clip.exe",
		},
		paste = {
			["+"] = 'pwsh.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
			["*"] = 'pwsh.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
		},
		cache_enabled = 0,
	},
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

-- GROUP: [[ Auxiliary functions ]]

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

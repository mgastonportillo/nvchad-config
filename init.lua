vim.g.base46_cache = vim.fn.stdpath("data") .. "/nvchad/base46/"
vim.g.mapleader = " "

-- Bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

---@diagnostic disable-next-line
if not vim.loop.fs_stat(lazypath) then
	local repo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath })
end

---@diagnostic disable-next-line
vim.opt.rtp:prepend(lazypath)

local lazy_config = require("configs.lazy")

-- Load plugins
require("lazy").setup({
	{
		"NvChad/NvChad",
		lazy = false,
		branch = "v2.5",
		import = "nvchad.plugins",
		config = function()
			require("options")
		end,
	},

	{ import = "plugins" },
}, lazy_config)

-- Load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require("nvchad.autocmds")

vim.schedule(function()
	require("mappings")
end)

-- Re-activate python and node default providers
for _, provider in ipairs({ "python3_provider", "node_provider" }) do
	vim.g["loaded_" .. provider] = nil
	vim.cmd("runtime " .. provider)
end

-- Add Qa and QA aliases for qa to workaround my dumb fingers
vim.cmd("ca Qa qa")
vim.cmd("ca QA qa")

-- Improve Astro commenting and add support for Sass
require("Comment").setup()
local ft = require("Comment.ft")
ft.set("scss", { "//%s", "/*%s*/" })
ft.set("astro", { "<!--%s-->", "<!--%s-->" })

require("utils.autocmd")
require("utils.usercmd")

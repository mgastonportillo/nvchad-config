-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
	transparency = true,
	statusline = {
		theme = "vscode_colored",
		order = {
			"mode",
			"file",
			"git",
			"%=",
			"lsp_msg",
			"%=",
			"diagnostics",
			"lsp",
			-- "cursor",
			"caps_status",
			"cwd",
		},

		modules = {
			caps_status = function()
				if vim.g.CAPSON == "True" then
					return "%#StText# Caps: ON  "
				else
					return "%#StText# Caps: OFF  "
				end
			end,
		},
	},
	theme = "bearded-arc",

	---@diagnostic disable-next-line
	theme_toggle = { "chadracula-evondev", "bearded-arc" },
	telescope = { style = "bordered" },
	hl_override = {
		Comment = { italic = true },
		["@comment"] = { italic = true },
	},

	-- hl_add = {}
	-- nvdash = {}
}

return M

local g = {
	-- tabby_keybinding_accept = "Tab", -- default "Tab"
	-- tabby_keybinding_trigger_or_dismiss = "<C-\\>",
	-- tabby_trigger_mode = "manual", -- default "auto"
}

for k, v in pairs(g) do
	vim.g[k] = v
end

return {
	"TabbyML/vim-tabby",
	lazy = false,
}

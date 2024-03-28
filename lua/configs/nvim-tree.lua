local opts = {
	git = {
		enable = true,
	},
	renderer = {
		highlight_git = true,
		icons = {
			glyphs = {
				folder = {
					default = "",
					open = "",
					empty = "",
					empty_open = "",
				},
			},
		},
	},
	-- allow statuscolumn to be applied on nvim-tree
	view = {
		signcolumn = "no",
	},
}

return opts

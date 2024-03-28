return {
	"iamcco/markdown-preview.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	ft = "markdown",
	build = function()
		vim.fn["mkdp#util#install"]()
	end,
	init = function()
		vim.g.mkdp_filetypes = { "markdown" }
		-- vim.g.mkdp_auto_close = 0
	end,
}

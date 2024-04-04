local opts = {
	formatters_by_ft = {
		-- clang should work by default
		css = { "prettier" },
		scss = { "prettier" },
		gleam = { "gleam" },
		go = { "gofmt" },
		html = { "prettier" },
		javascript = { "prettier" },
		lua = { "stylua" },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_fallback = true,
	},
}

return opts

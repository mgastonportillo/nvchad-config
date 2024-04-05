local opts = {
	ensure_installed = {
		"efm",
		-- Bash
		"bash-language-server",
		"beautysh",
		"shellcheck",
		-- C
		"clangd",
		"clang-format",
		-- Go
		"golangci-lint",
		-- Haskell
		"fourmolu",
		-- Markdown
		"marksman",
		"markdownlint",
		"mdformat",
		-- Lua
		"lua-language-server",
		"stylua",
		-- Web Dev
		"css-lsp",
		"djlint",
		"html-lsp",
		"stylelint",
		"typescript-language-server",
		"prettier",
		"tailwindcss-language-server",
		-- Python
		"debugpy",
		"mypy",
		"ruff-lsp",
		"pyright",
		"python-lsp-server",
		-- Rust
		"rust-analyzer",
		"codelldb",
		-- toml
		"dprint",
		"astro-language-server",
	},
}

return opts

local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local servers = {
	"astro",
	"bashls",
	"clangd",
	"cssls",
	"html",
	"marksman",
	"pyright",
}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		on_init = on_init,
		capabilities = capabilities,
	})
end

lspconfig.ruff_lsp.setup({
	on_attach = function(client, _)
		-- Disable hover in favour of Pyright
		client.server_capabilities.hoverProvider = false
	end,
	on_init = on_init,
	capabilities = capabilities,
})

-- GROUP: [[ SERVERS ]]

local lspconfig = require "lspconfig"
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local servers = {
  "astro",
  "bashls",
  "clangd",
  "cssls",
  "css_variables",
  "jsonls",
  "html",
  "marksman",
  -- "tailwindcss",
  "pyright",
  "taplo",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

lspconfig.ruff_lsp.setup {
  on_attach = function(client)
    -- Disable hover in favour of Pyright
    client.server_capabilities.hoverProvider = false
  end,
  on_init = on_init,
  capabilities = capabilities,
}

-- GROUP: [[ UI ]]

local border = "rounded" -- "single" | "rounded"
-- local border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }

-- :LspInfo
local win = require "lspconfig.ui.windows"
win.default_options = { border = border }

-- vim.diagnostic.open_float()
vim.diagnostic.config { virtual_text = true, float = { border = border } }

-- vim.lsp.buf.hover()
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })

-- vim.lsp.buf.signature_help()
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border })

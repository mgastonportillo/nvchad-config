-- ---@diagnostic disable: different-requires
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

-- [https://github.com/lukas-reineke/lsp-format.nvim#setup]
local lspformat = require "lsp-format"
lspformat.setup {}

local lspconfig = require "lspconfig"
local servers = {
  "bashls",
  "clangd",
  "cssls",
  "html",
  "marksman",
  "pyright",
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- -- typescript
-- lspconfig.tsserver.setup {
--   on_attach = on_attach,
--   on_init = on_init,
--   capabilities = capabilities,
-- }

-- Custom configurations of lsps
lspconfig.ruff_lsp.setup {
  on_attach = function(client, _)
    -- Disable hover in favour of Pyright
    client.server_capabilities.hoverProvider = false
  end,
  capabilities = capabilities,
}

-- Definitions of tools for efm using efmls_configs
-- [https://github.com/creativenull/efmls-configs-nvim#setup]
local shellcheck = require "efmls-configs.linters.shellcheck"
local beautysh = require "efmls-configs.formatters.beautysh"
local stylelint = require "efmls-configs.linters.stylelint"
local prettier = require "efmls-configs.formatters.prettier"
local golangci_lint = require "efmls-configs.linters.golangci_lint"
local gofmt = require "efmls-configs.formatters.gofmt"
local stylua = require "efmls-configs.formatters.stylua"
local fourmolu = require "efmls-configs.formatters.fourmolu"
local djlint = require "efmls-configs.linters.djlint"
local jq = require "efmls-configs.linters.jq"
local mdformat = require "efmls-configs.formatters.mdformat"
local black = require "efmls-configs.formatters.black"
local rustfmt = require "efmls-configs.formatters.rustfmt"
local latexindent = require "efmls-configs.formatters.latexindent"
local dprint = require "efmls-configs.formatters.dprint"

-- Table of tools per language
local langs = {
  bash = { shellcheck, beautysh },
  css = { stylelint, prettier },
  go = { golangci_lint, gofmt },
  haskell = { fourmolu },
  html = { djlint, prettier },
  javascript = { prettier },
  javascriptreact = { prettier },
  json = { jq, prettier },
  lua = { stylua },
  markdown = { mdformat },
  python = { black },
  rust = { rustfmt },
  sass = { stylelint, prettier },
  scss = { stylelint, prettier },
  tex = { latexindent },
  toml = { dprint },
  typescript = { prettier },
}

-- efmls_configs configuration table
local efmls_config = {
  filetypes = vim.tbl_keys(langs),
  settings = {
    rootMarkers = { ".git/" },
    languages = langs,
  },
  init_options = {
    documentFormatting = true,
    documentRangeFormatting = true,
  },
}

-- Implementation of efm as an lsp
lspconfig.efm.setup(vim.tbl_extend("force", efmls_config, {
  on_attach = lspformat.on_attach,
  capabilities = capabilities,
}))

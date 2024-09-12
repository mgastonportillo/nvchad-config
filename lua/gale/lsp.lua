local M = {}

M.custom_on_attach = function(client, bufnr)
  local on_attach = require("nvchad.configs.lspconfig").on_attach
  on_attach(client, bufnr)

  local border = "rounded"
  -- vim.lsp.buf.hover()
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })
  -- vim.lsp.buf.signature_help()
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border })

  local map = vim.keymap.set
  map("n", "<leader>gt", vim.lsp.buf.type_definition, { desc = "LSP Go to type definition" })
end

return M

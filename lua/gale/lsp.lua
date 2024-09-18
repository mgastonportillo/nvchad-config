local M = {}

---@param custom? function
--- Takes a custom on attach that will be called after the default on_attach,
--- allowing expanding on the default behavior
M.create_on_attach = function(custom)
  return function(client, bufnr)
    local on_attach = require("nvchad.configs.lspconfig").on_attach
    on_attach(client, bufnr)

    local border = "rounded"

    -- vim.lsp.buf.hover()
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = border,
    })
    -- vim.lsp.buf.signature_help()
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border })

    local map = vim.keymap.set
    map("n", "<leader>gt", vim.lsp.buf.type_definition, { desc = "LSP Go to type definition" })

    if custom then
      custom(client, bufnr)
    end
  end
end

return M

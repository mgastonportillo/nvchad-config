local M = {}

---@alias OnAttach fun(client: vim.lsp.Client, bufnr: integer)
---@alias OnInit fun(client: vim.lsp.Client, initialize_result: lsp.InitializeResult)

---@type OnAttach
local on_attach = function(_, bufnr)
  local map = function(mode, lhs, rhs, opts)
    local options = { buffer = bufnr }
    if opts then
      options = vim.tbl_deep_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
  end

  map("n", "gd", vim.lsp.buf.definition, { desc = "LSP go to definition" })
  map("n", "gi", vim.lsp.buf.implementation, { desc = "LSP go to implementation" })
  map("n", "<leader>gd", vim.lsp.buf.declaration, { desc = "LSP go to declaration" })
  map("n", "<leader>sh", vim.lsp.buf.signature_help, { desc = "LSP show signature help" })
  map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { desc = "LSP add workspace folder" })
  map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, { desc = "LSP remove workspace folder" })
  map("n", "<leader>gr", vim.lsp.buf.references, { desc = "LSP show references" })
  map("n", "<leader>gt", vim.lsp.buf.type_definition, { desc = "LSP go to type definition" })
  map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP code actions" })

  map("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, { desc = "LSP list workspace folders" })

  map("n", "<leader>ra", function()
    require "nvchad.lsp.renamer"()
  end, { desc = "LSP rename" })

  -- UI tweaks
  local border = "rounded"
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = border,
  }) -- vim.lsp.buf.hover()
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = border,
  }) -- vim.lsp.buf.signature_help()
end

---@param custom_on_attach? OnAttach
---@return OnAttach # A new function that combines default and custom on_attach behaviour
M.create_on_attach = function(custom_on_attach)
  return function(client, bufnr)
    on_attach(client, bufnr)

    if custom_on_attach then
      custom_on_attach(client, bufnr)
    end
  end
end

---@type OnInit
M.on_init = function(client, _)
  if client.supports_method "textDocument/semanticTokens" then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

M.capabilities = capabilities

M.inlay_hints_settings = {
  parameterNames = {
    enabled = "all",
  },
  parameterTypes = {
    enabled = true,
  },
  variableTypes = {
    enabled = true,
  },
  propertyDeclarationTypes = {
    enabled = true,
  },
  functionLikeReturnTypes = {
    enabled = true,
  },
}

return M

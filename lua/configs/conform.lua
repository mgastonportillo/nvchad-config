return {
  formatters_by_ft = {
    -- clang should work by default
    css = { "prettier" },
    scss = { "prettier" },
    gleam = { "gleam" },
    go = { "gofmt" },
    html = { "prettier" },
    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    json = { "biome" },
    markdown = { "mdformat" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    lua = { "stylua" },
    toml = { "taplo" },
  },
  format_on_save = function(bufnr)
    -- Disable with a global or buffer-local variable
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end
    return { timeout_ms = 500, lsp_fallback = true }
  end,
  -- formatters = {
  --   prettier = {
  --     args = { "--single-quote", "true", "$FILENAME" },
  --   },
  -- },
}

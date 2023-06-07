local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

require("crates").setup {
  null_ls = {
    enabled = true,
    name = "crates.nvim",
  },
}

local b = null_ls.builtins

local sources = {
  -- bash
  b.formatting.beautysh,
  -- webdev stuff
  b.formatting.deno_fmt, -- js/x, ts/x, json/c, md
  b.formatting.prettier.with { filetypes = { "html", "css" }, timeout = 10000 },
  -- Lua
  b.formatting.stylua,
  -- cpp
  b.formatting.clang_format,
  -- python
  b.formatting.black,
  b.diagnostics.ruff,
  -- rust
  b.formatting.rustfmt,
}

null_ls.setup {
  debug = true,
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds {
        group = augroup,
        buffer = bufnr,
      }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
  sources = sources,
}

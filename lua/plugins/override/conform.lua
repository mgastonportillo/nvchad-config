---@diagnostic disable: different-requires
return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  init = function()
    vim.keymap.set("n", "<leader>fm", function()
      require("conform").format { lsp_fallback = true }
    end, { desc = "Format files" })
  end,
  opts = {
    formatters_by_ft = {
      -- clang should work by default
      bash = { "shfmt" },
      css = { "prettier" },
      scss = { "prettier" },
      gleam = { "gleam" },
      go = { "gofmt" },
      html = { "prettier" },
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      json = { "biome" },
      markdown = { "deno_fmt" },
      ocaml = { "ocamlformat" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
      vue = { "prettier" },
      lua = { "stylua" },
      toml = { "taplo" },
      yaml = { "yamlfmt" },
      zig = { "zigfmt" },
    },
    format_on_save = function(bufnr)
      -- Disable with a global or buffer-local variable
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end
      return { timeout_ms = 500, lsp_fallback = true }
    end,
    formatters = {
      yamlfmt = {
        args = { "-formatter", "retain_line_breaks_single=true" },
      },
    },
  },
}

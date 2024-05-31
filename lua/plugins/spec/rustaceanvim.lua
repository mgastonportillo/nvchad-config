return {
  "mrcjkb/rustaceanvim",
  version = "^4",
  ft = { "rust" },
  config = function()
    vim.g.rustaceanvim = {
      -- Plugin configuration
      tools = {
        float_win_config = {
          border = "rounded",
        },
      },
      -- LSP configuration
      server = {
        on_attach = function()
          vim.lsp.inlay_hint.enable()
        end,
        default_settings = {
          -- rust-analyzer language server configuration
          ["rust-analyzer"] = {},
        },
      },
      -- DAP configuration
      dap = {},
    }

    local map = vim.keymap.set
    map("n", "K", "<cmd>lua vim.cmd.RustLsp({ 'hover', 'actions' })<CR>", { desc = "Rust Hover" })
    map("n", "<leader>ca", "<cmd>lua vim.cmd.RustLsp('codeAction')<CR>", { desc = "Rust Code actions" })
  end,
}

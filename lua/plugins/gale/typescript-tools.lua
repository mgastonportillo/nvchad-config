local on_attach = require("nvchad.configs.lspconfig").on_attach

return {
  "pmizio/typescript-tools.nvim",
  event = { "BufReadPre", "BufNewFile" },
  ft = { "javascript", "typescript", "typescriptreact" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "neovim/nvim-lspconfig",
  },
  opts = {
    on_attach = on_attach,
    settings = {
      tsserver_plugins = {
        "@styled/typescript-styled-plugin",
      },
    },
  },
}

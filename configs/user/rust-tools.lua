local config = require "plugins.configs.lspconfig"

local on_attach = config.on_attach
local capabilities = config.capabilities

local spec = {
  "simrat39/rust-tools.nvim",
  ft = "rust",
  dependencies = "neovim/nvim-lspconfig",
  opts = {
    server = {
      on_attach = on_attach,
      capabilities = capabilities,
    },
  },
  config = function(_, opts)
    require("rust-tools").setup(opts)
    require("core.utils").load_mappings "rust_tools"
  end,
}

return spec

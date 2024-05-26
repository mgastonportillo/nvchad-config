---@diagnostic disable: different-requires
return {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = { { "hrsh7th/cmp-cmdline" } },
  opts = {
    mapping = {
      ["<Tab>"] = vim.NIL,
      ["<S-Tab>"] = vim.NIL,
    },
  },
  config = function(_, opts)
    local cmp = require "cmp"

    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "cmdline" },
      },
    })

    cmp.setup(opts)
  end,
}

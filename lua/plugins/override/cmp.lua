---@diagnostic disable: different-requires
return {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = { { "hrsh7th/cmp-cmdline" } },
  opts = require "configs.cmp",
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

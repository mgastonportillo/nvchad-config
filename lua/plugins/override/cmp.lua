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
        {
          name = "lazydev",
          group_index = 0, -- set group index to 0 to skip loading LuaLS completions
        },
      },
    })

    cmp.setup(opts)
  end,
}

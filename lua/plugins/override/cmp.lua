---@diagnostic disable: different-requires

---@type NvPluginSpec
return {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = {
    { "hrsh7th/cmp-cmdline" },
    { "brenoprata10/nvim-highlight-colors" },
  },
  opts = function(_, opts)
    ---@type cmp.ConfigSchema
    opts = vim.tbl_deep_extend("force", opts, {
      mapping = {
        ["<Tab>"] = function(fallback)
          fallback()
        end,
        ["<S-Tab>"] = function(fallback)
          fallback()
        end,
      },
    })
    return opts
  end,
  config = function(_, opts)
    local cmp = require "cmp"

    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "cmdline" },
        { name = "path" },
        {
          name = "lazydev",
          group_index = 0, -- set group index to 0 to skip loading LuaLS completions
        },
      },
    })

    cmp.setup(opts)
  end,
}

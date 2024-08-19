---@type NvPluginSpec
---@diagnostic disable: different-requires
return {
  "saecki/crates.nvim",
  ft = { "rust", "toml" },
  dependencies = "nvim-lua/plenary.nvim",
  config = function(_, opts)
    local crates = require "crates"
    local cmp = require "cmp"

    crates.setup(opts)
    cmp.setup.buffer {
      sources = { { name = "crates" } },
    }
    crates.show()

    vim.keymap.set("n", "<leader>cu", function()
      crates.upgrade_all_crates()
    end, { desc = "Update crates" })
  end,
}

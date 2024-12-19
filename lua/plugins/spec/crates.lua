---@type NvPluginSpec
return {
  "saecki/crates.nvim",
  event = { "BufRead Cargo.toml" },
  tag = "stable",
  opts = function(_, opts)
    local crates = require "crates"

    vim.keymap.set("n", "<leader>cu", function()
      crates.upgrade_all_crates()
    end, { desc = "Update crates" })

    local options = {
      completion = {
        cmp = {
          enabled = true,
        },
      },
    }

    opts = vim.tbl_deep_extend("force", opts or {}, options)
    return opts
  end,
}

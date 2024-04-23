-- local cmp = require "cmp"
--
-- -- Add crates to sources
-- vim.api.nvim_create_autocmd("BufRead", {
--   group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
--   pattern = "Cargo.toml",
--   callback = function()
--     cmp.setup.buffer { sources = { { name = "crates" } } }
--   end,
-- })

-- {
--   "hrsh7th/nvim-cmp",
--   opts = {
--     function()
--       local M = require "plugins.configs.cmp"
--  M.completion.completeopt = "menu,menuone,noselect"
--       M.mapping["<CR>"] = cmp.mapping.confirm {
--         behavior = cmp.ConfirmBehavior.Insert,
--         select = false,
--       }
--       table.insert(M.sources, { name = "crates" })
--       return M
--     end,
--   },
-- },

return {
  "saecki/crates.nvim",
  ft = { "rust", "toml" },
  dependencies = "nvim-lua/plenary.nvim",
  config = function(_, opts)
    local crates = require "crates"
    crates.setup(opts)
    require("cmp").setup.buffer {
      sources = { { name = "crates" } },
    }
    crates.show()
  end,
}

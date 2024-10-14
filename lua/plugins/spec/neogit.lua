---@type NvPluginSpec
return {
  "NeogitOrg/neogit",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "nvim-telescope/telescope.nvim",
  },
  init = function()
    local map = vim.keymap.set
    map("n", "<leader>gg", "<cmd>Neogit<CR>", { desc = "Neogit Open" })
  end,
  opts = {
    disable_signs = true,
  },
  config = function(_, opts)
    dofile(vim.g.base46_cache .. "neogit")
    require("neogit").setup(opts)

    local augroup = vim.api.nvim_create_augroup
    local autocmd = vim.api.nvim_create_autocmd
    autocmd("BufEnter", {
      desc = "Disable statuscol in Neogit* buffers.",
      pattern = "NeogitStatus",
      group = augroup("DisableStatuscol", { clear = true }),
      callback = function()
        vim.schedule(function()
          vim.o.statuscolumn = "%!v:lua.require('statuscol').get_statuscol_string()"
        end)
      end,
    })
  end,
}

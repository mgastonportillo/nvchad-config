return {
  "folke/which-key.nvim",
  init = function()
    local map = require("gale.utils").glb_map

    map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "WhichKey show all keymaps" })

    map("n", "<leader>wk", function()
      vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
    end, { desc = "WhichKey query lookup" })
  end,
}

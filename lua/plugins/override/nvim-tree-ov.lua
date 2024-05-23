return {
  "nvim-tree/nvim-tree.lua",
  init = function()
    local map = require("gale.utils").glb_map

    map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
    -- map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "NvimTree focus" })
  end,
  config = function()
    require "configs.nvimtree"
  end,
}

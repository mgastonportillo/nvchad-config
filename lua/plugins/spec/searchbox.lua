return {
  "VonHeikemen/searchbox.nvim",
  event = "VeryLazy",
  init = function() end,
  dependencies = "MunifTanjim/nui.nvim",
  config = function()
    local map = vim.keymap.set

    map("n", "<leader>s", "<cmd>SearchBoxIncSearch<CR>", {
      desc = "Enter Searchbox",
    })
    map("n", "<leader>r", "<cmd>SearchBoxReplace<CR>", {
      desc = "Enter Replace Searchbox",
    })
  end,
}

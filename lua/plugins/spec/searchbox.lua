return {
  enabled = false,
  "VonHeikemen/searchbox.nvim",
  cmd = { "SearchBoxIncSearch", "SearchBoxReplace" },
  dependencies = "MunifTanjim/nui.nvim",
  init = function()
    local map = vim.keymap.set
    map("n", "<leader>s", "<cmd>SearchBoxIncSearch<CR>", {
      desc = "Enter Searchbox",
    })
    map("n", "<leader>r", "<cmd>SearchBoxReplace<CR>", {
      desc = "Enter Replace Searchbox",
    })
  end,
}

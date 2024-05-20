return {
  "lewis6991/gitsigns.nvim",
  dependencies = {
    -- Config for diffview.nvim
    {
      "sindrets/diffview.nvim",
      config = true,
    },
  },
  opts = {
    preview_config = {
      border = "rounded",
    },
  },
}

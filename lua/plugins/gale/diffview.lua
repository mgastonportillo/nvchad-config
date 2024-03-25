-- This will be load once gitsigns.nvim is loaded (when in a git repo)
return {
  "lewis6991/gitsigns.nvim",
  dependencies = {
    -- Config for diffview.nvim
    {
      "sindrets/diffview.nvim",
      config = true,
    },
  },
}


return {
  enabled = false,
  event = "VeryLazy",
  "ahmedkhalf/project.nvim",
  config = function()
    require("project_nvim").setup {
      require("nvim-tree").setup {
        sync_root_with_cwd = true,
        respect_buf_cwd = true,
        update_focused_file = {
          enable = true,
          update_root = true,
        },
      },
    }
  end,
}

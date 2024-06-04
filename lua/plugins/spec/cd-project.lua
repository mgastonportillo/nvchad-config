return {
  "LintaoAmons/cd-project.nvim",
  dir = "/home/gale/workspace/neovim/cd-project.nvim",
  dev = true,
  event = "VimEnter",
  opts = {
    projects_config_filepath = vim.fs.normalize(vim.fn.stdpath "data" .. "/cd-project.nvim.json"),
    projects_picker = "telescope", -- "vim-ui" | "telescope"
  },
}

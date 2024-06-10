return {
  "LintaoAmons/cd-project.nvim",
  dir = "/home/gale/workspace/neovim/cd-project.nvim",
  dev = false,
  event = "VimEnter",
  opts = {
    projects_config_filepath = vim.fs.normalize(vim.fn.stdpath "data" .. "/cd-project.nvim.json"),
    projects_picker = "telescope", -- "vim-ui" | "telescope"
    hooks = {
      {
        callback = function(dir)
          vim.notify("Switched to dir: " .. dir)
        end,
      },
      {
        callback = function(dir)
          vim.notify("Switched to dir: " .. dir)
        end,
        name = "cd hint",
        order = 1,
        pattern = "cd-project.nvim",
        trigger_point = "DISABLE",
        match_rule = function(dir)
          return true
        end,
      },
    },
  },
}

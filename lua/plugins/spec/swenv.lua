return {
  "AckslD/swenv.nvim",
  ft = "python",
  config = function()
    require("swenv").setup {
      post_set_env = function()
        vim.cmd "LspRestart"
      end,
    }
  end,
}

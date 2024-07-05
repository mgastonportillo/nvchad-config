return {
  "NvChad/base46",
  -- dir = vim.fn.expand "$HOME/workspace/neovim/base46",
  -- dev = true,
  branch = "v2.5",
  build = function()
    require("base46").load_all_highlights()
  end,
}

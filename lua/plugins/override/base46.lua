return {
    "NvChad/base46",
    dir = vim.fn.expand "$HOME/workspace/neovim/base46",
    branch = "v2.5",
    -- dev = true,
    build = function()
      require("base46").load_all_highlights()
    end,
}

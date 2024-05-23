return {
  enabled = false,
  "ray-x/go.nvim",
  event = { "CmdlineEnter" },
  ft = { "go", "gomod" },
  dependencies = { -- optional packages
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  config = function()
    require("go").setup()
  end,
}

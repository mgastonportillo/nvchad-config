---@type NvPluginSpec
return {
  "epwalsh/obsidian.nvim",
  version = "*",
  event = {
    "BufReadPre " .. vim.fn.expand "~" .. "/vault/**.md",
    "BufNewFile " .. vim.fn.expand "~" .. "/vault/**.md",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    workspaces = {
      {
        name = "learning",
        path = "~/vault/learning",
      },
      {
        name = "personal",
        path = "~/vault/personal",
      },
      {
        name = "work",
        path = "~/vault/work",
      },
    },
  },
}

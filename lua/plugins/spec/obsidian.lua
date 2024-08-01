return {
  "epwalsh/obsidian.nvim",
  version = "*",
  event = {
    "BufReadPre " .. vim.fn.expand "~" .. "/Notes/**.md",
    "BufNewFile " .. vim.fn.expand "~" .. "/Notes/**.md",
  },
  dependencies = { "nvim-lua/plenary.nvim" },
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

return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  opts = {
    cmdline = {
      enabled = false,
    },
    messages = {
      enabled = false,
    },
    popupmenu = {
      enabled = false,
    },
    notify = {
      enabled = false,
    },
    lsp = {
      hover = {
        enabled = true,
        opts = {
          border = "rounded",
        },
      },
      signature = {
        enabled = true,
        opts = {
          border = "rounded",
        },
      },
      progress = {
        enabled = false,
      },
      message = {
        enabled = false,
      },
    },
  },
}

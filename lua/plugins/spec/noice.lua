return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = { "MunifTanjim/nui.nvim" },
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
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
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

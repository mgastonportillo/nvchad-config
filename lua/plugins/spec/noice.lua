return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = { "MunifTanjim/nui.nvim" },
  ---@module "noice"
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
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
      hover = {
        enabled = true,
        ---@type NoiceViewOptions
        opts = {
          size = {
            max_width = vim.api.nvim_win_get_width(0) - 6,
          },
        },
      },
      signature = {
        enabled = true,
        ---@type NoiceViewOptions
        opts = {
          size = {
            max_width = vim.api.nvim_win_get_width(0) - 6,
          },
        },
      },
      progress = {
        enabled = false,
      },
      message = {
        enabled = false,
      },
    },
    presets = {
      lsp_doc_border = true,
    },
  },
}

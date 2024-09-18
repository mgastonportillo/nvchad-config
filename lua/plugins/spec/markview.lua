---@type NvPluginSpec
return {
  "OXY2DEV/markview.nvim",
  lazy = false,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    modes = { "i", "n", "v", "vs", "V", "Vs", "no", "c" },
    hybrid_modes = { "i" },
    callbacks = {
      on_enable = function(_, win)
        -- https://github.com/OXY2DEV/markview.nvim/issues/75
        vim.wo[win].wrap = false

        -- https://segmentfault.com/q/1010000000532491
        vim.wo[win].conceallevel = 2
        vim.wo[win].concealcursor = "nivc"
      end,
    },
    checkboxes = {
      enable = true,
    },
    tables = {
      use_virt_lines = true,
    },
  },
}

return {
  { "Bilal2453/luvit-meta" },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "luvit-meta/library", words = { "vim%.uv" } },
        {
          path = vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types",
          words = { "ChadrcConfig", "NvPluginSpec", "Base46Table", "Base46HLGroupsList" },
        },
        { path = "wezterm-types", mods = { "wezterm" } },
        -- vim.fn.expand "$HOME/workspace/neovim/ui/nvchad_types", -- get types when dev = true
      },
    },
  },
}

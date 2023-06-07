local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {
  -- Override plugin definition
  { import = "custom.configs.overrides-def" },
  -- Overrides
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },
  -- My plugins
  { import = "custom.configs.user.better-escape" },
  { import = "custom.configs.user.crates" },
  { import = "custom.configs.user.dap-python" },
  { import = "custom.configs.user.dap-ui" },
  { import = "custom.configs.user.dap-virtual-text" },
  { import = "custom.configs.user.dap" },
  { import = "custom.configs.user.diffview" },
  { import = "custom.configs.user.dressing" },
  { import = "custom.configs.user.fine-cmdline" },
  { import = "custom.configs.user.fugitive" },
  { import = "custom.configs.user.lspsaga" },
  { import = "custom.configs.user.notify" },
  { import = "custom.configs.user.rust-tools" },
  { import = "custom.configs.user.searchbox" },
  { import = "custom.configs.user.spectre", enabled = false },
  { import = "custom.configs.user.swenv" },
  { import = "custom.configs.user.todo-comments" },
  { import = "custom.configs.user.trouble" },
  { import = "custom.configs.user.ts-autotag" },
}

-- All NvChad plugins are lazy-loaded by default

-- For a plugin to be loaded, you will need to set either
-- `ft`, `cmd`, `keys`, `event`, or set `lazy = false`

-- If you want a plugin to load on startup,
-- add `lazy = false` to a plugin spec

-- If you want to disable a plugin,
-- add `enabled = false` instead

return plugins

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
  { import = "custom.configs.gale.better-escape" },
  { import = "custom.configs.gale.crates" },
  { import = "custom.configs.gale.dap-python" },
  { import = "custom.configs.gale.dap-ui" },
  { import = "custom.configs.gale.dap-virtual-text" },
  { import = "custom.configs.gale.dap" },
  { import = "custom.configs.gale.diffview" },
  { import = "custom.configs.gale.dressing" },
  { import = "custom.configs.gale.fine-cmdline" },
  { import = "custom.configs.gale.fugitive" },
  { import = "custom.configs.gale.lspsaga" },
  { import = "custom.configs.gale.notify" },
  { import = "custom.configs.gale.rust-tools" },
  { import = "custom.configs.gale.searchbox" },
  { import = "custom.configs.gale.spectre", enabled = false },
  { import = "custom.configs.gale.swenv" },
  { import = "custom.configs.gale.todo-comments" },
  { import = "custom.configs.gale.trouble" },
  { import = "custom.configs.gale.ts-autotag" },
}

-- All NvChad plugins are lazy-loaded by default

-- For a plugin to be loaded, you will need to set either
-- `ft`, `cmd`, `keys`, `event`, or set `lazy = false`

-- If you want a plugin to load on startup,
-- add `lazy = false` to a plugin spec

-- If you want to disable a plugin,
-- add `enabled = false` instead

return plugins

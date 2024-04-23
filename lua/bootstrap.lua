vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
local lazyrepo = "https://github.com/folke/lazy.nvim.git"

-- Install lazy if not in path
if not vim.loop.fs_stat(lazypath) then
  vim.system { "git", "clone", "--filter=blob:none", lazyrepo, "--branch=stable", lazypath }
end

-- Prepend lazy to runtime path
vim.opt.rtp:prepend(lazypath)

-- Load plugins
local lazy_config = require "configs.lazy"
require("lazy").setup({
  {
    "folke/neodev.nvim",
    config = function()
      require("neodev").setup {
        library = {
          plugins = { "nvim-dap-ui" },
        },
      }
    end,
  },
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require "options"
    end,
  },
  { import = "overrides" },
  { import = "plugins" },
}, lazy_config)

-- Load themes
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

-- No dashboard for me
vim.api.nvim_del_user_command "Nvdash"

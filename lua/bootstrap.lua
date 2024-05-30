---@diagnostic disable: undefined-field
-- NOTE: WSL + WT padding recipe: "20,4,0,-4"

vim.g.mapleader = " "
vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
local lazyrepo = "https://github.com/folke/lazy.nvim.git"

-- Install lazy if not in path
if not (vim.loop or vim.uv).fs_stat(lazypath) then
  vim.system { "git", "clone", "--filter=blob:none", lazyrepo, "--branch=stable", lazypath }
end

-- Prepend lazy to runtime path
vim.opt.rtp:prepend(lazypath)

-- Load plugins
local lazy_config = require "configs.lazy"
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require "colorify"
      require "options"
    end,
  },
  { import = "plugins" },
}, lazy_config)

-- Load themes
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

-- Re-activate providers
for _, v in pairs { "python3_provider", "node_provider" } do
  vim.g["loaded_" .. v] = nil
  vim.cmd("runtime " .. v)
end

-- No dashboard for me
vim.api.nvim_del_user_command "Nvdash"

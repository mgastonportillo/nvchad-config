vim.g.mapleader = " "
vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- Install lazy if not in path
if not vim.uv.fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
  vim.cmd "autocmd User LazyDone lua require('nvchad.mason').install_all()"
end
vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"
require("lazy").setup({
  { "Bilal2453/luvit-meta" },
  { "justinsgithub/wezterm-types" },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        -- "${3rd}/luv/library",
        "luvit-meta/library",
        "wezterm-types/types",
        vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types",
        -- vim.fn.expand "$HOME/workspace/neovim/ui/nvchad_types",
      },
    },
  },
  {
    "NvChad/NvChad",
    dev = false,
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
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
for _, v in ipairs { "python3_provider", "node_provider" } do
  vim.g["loaded_" .. v] = nil
  vim.cmd("runtime " .. v)
end

-- No dashboard for me
vim.api.nvim_del_user_command "Nvdash"

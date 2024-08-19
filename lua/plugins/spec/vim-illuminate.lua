---@type NvPluginSpec
return {
  "RRethy/vim-illuminate",
  enabled = false,
  event = "BufEnter",
  opts = {
    filetypes_denylist = { "NvimTree", "TelescopePrompt", "NeogitStatus", "lazy", "mason" },
  },
  config = function(_, opts)
    dofile(vim.g.base46_cache .. "vim-illuminate")
    require("illuminate").configure(opts)
  end,
}

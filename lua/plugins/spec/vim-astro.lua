---@type NvPluginSpec
return {
  "wuelnerdotexe/vim-astro",
  ft = "astro",
  config = function()
    vim.g.astro_typescript = "enable"
  end,
}

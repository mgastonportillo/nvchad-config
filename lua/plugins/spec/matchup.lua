---@type NvPluginSpec
return {
  "andymass/vim-matchup",
  event = "LspAttach",
  config = function()
    vim.g.matchup_matchparen_offscreen = { method = "popup" }
  end,
}

return {
  "andymass/vim-matchup",
  event = "BufRead",
  config = function()
    vim.g.matchup_matchparen_offscreen = { method = "popup" }
  end,
}

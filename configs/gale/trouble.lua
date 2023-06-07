local spec = {
  "folke/trouble.nvim",
  init = function()
    require("core.utils").load_mappings "trouble"
  end,
  cmd = { "Trouble", "TroubleToggle" },
}

return spec

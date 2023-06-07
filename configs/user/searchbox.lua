local spec = {
  "VonHeikemen/searchbox.nvim",
  event = "VimEnter",
  init = function()
    require("core.utils").load_mappings "searchbox"
  end,
  dependencies = "MunifTanjim/nui.nvim",
}

return spec

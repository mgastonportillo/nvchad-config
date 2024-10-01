---@type NvPluginSpec
return {
  "NvChad/ui",
  dev = false,
  branch = "v3.0",
  config = function()
    require "nvchad"
  end,
}

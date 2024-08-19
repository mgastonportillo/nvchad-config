---@type NvPluginSpec
return {
  "NvChad/nvim-colorizer.lua",
  enabled = false,
  opts = {
    user_default_options = {
      RRGGBBAA = true,
      rgb_fn = true,
      hsl_fn = true,
      css = true,
      css_fn = true,
      sass = { enable = true, parsers = { "css" } },
      mode = "virtualtext",
      virtualtext = "󱓻",
    },
  },
}

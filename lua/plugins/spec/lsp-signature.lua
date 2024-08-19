---@type NvPluginSpec
return {
  enabled = false,
  "ray-x/lsp_signature.nvim",
  event = "LspAttach",
  config = function()
    require("lsp_signature").setup()
  end,
}

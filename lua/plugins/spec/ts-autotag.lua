local status_ok, auto_tag = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

---@type NvPluginSpec
return {
  "windwp/nvim-ts-autotag",
  -- https://github.com/windwp/nvim-ts-autotag?tab=readme-ov-file#a-note-on-lazy-loading
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    ---@diagnostic disable-next-line
    auto_tag.setup {
      autotag = {
        enable = true,
      },
    }
  end,
}

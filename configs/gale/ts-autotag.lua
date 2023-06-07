local status_ok, auto_tag = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

local spec = {
  "windwp/nvim-ts-autotag",
  ft = {
    "html",
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
    "svelte",
    "vue",
    "tsx",
    "jsx",
    "rescript",
    "xml",
    "php",
    "markdown",
    "glimmer",
    "handlebars",
    "hbs",
  },
  config = function()
    auto_tag.setup {
      autotag = {
        enable = true,
      },
    }
  end,
}

return spec

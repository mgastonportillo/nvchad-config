local create_on_attach = require("gale.lsp").create_on_attach

---@type NvPluginSpec
return {
  "pmizio/typescript-tools.nvim",
  enabled = false,
  ft = {
    "astro",
    "html",
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
    "tsx",
    "jsx",
    "rescript",
    "xml",
    "php",
    "markdown",
    "glimmer",
    "handlebars",
    "hbs",
    "svelte",
    "vue",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "neovim/nvim-lspconfig",
  },
  opts = {
    on_attach = create_on_attach,
    lsp = {
      code_actions = {
        previewer = false,
      },
    },
    settings = {
      tsserver_file_preferences = {
        includeInlayEnumMemberValueHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayParameterNameHints = "all",
        includeCompletionsForModuleExports = true,
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayVariableTypeHints = false,
      },
      tsserver_plugins = {
        "@styled/typescript-styled-plugin",
      },
      jsx_close_tag = {
        enable = false,
        filetypes = { "javascriptreact", "typescriptreact" },
      },
    },
  },
}

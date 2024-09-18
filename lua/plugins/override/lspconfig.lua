---@type NvPluginSpec
return {
  "neovim/nvim-lspconfig",
  config = function()
    require("nvchad.configs.lspconfig").defaults()

    local lspconfig = require "lspconfig"
    local on_init = require("nvchad.configs.lspconfig").on_init
    local capabilities = require("nvchad.configs.lspconfig").capabilities
    local create_on_attach = require("gale.lsp").create_on_attach

    local servers = {
      astro = {},
      bashls = {
        on_attach = function(client, bufnr)
          local filename = vim.api.nvim_buf_get_name(bufnr)

          if filename:match "%.env$" then
            vim.lsp.stop_client(client.id)
          end
        end,
      },
      clangd = {},
      css_variables = {},
      cssls = {},
      eslint = {},
      html = {},
      hls = {},
      gopls = {},
      jsonls = {},
      lua_ls = {
        settings = {
          Lua = {
            hint = { enable = true },
            telemetry = { enable = false },
            diagnostics = { globals = { "bit", "vim", "it", "describe", "before_each", "after_each" } },
            -- workspace libraries are set via lazydev
          },
        },
      },
      marksman = {},
      ocamllsp = {},
      pyright = {},
      ruff_lsp = {
        on_attach = function(client, _)
          -- prefer pyright's hover provider
          client.server_capabilities.hoverProvider = false
        end,
      },
      somesass_ls = {},
      tailwindcss = {},
      taplo = {},
      yamlls = {},
      zls = {},
    }

    for name, opts in pairs(servers) do
      opts.on_init = on_init
      opts.on_attach = create_on_attach(opts.on_attach)
      opts.capabilities = capabilities
      lspconfig[name].setup(opts)
    end

    -- Customise LSP UI
    local border = "rounded"
    local win = require "lspconfig.ui.windows"
    win.default_options = { border = border } -- :LspInfo
    vim.diagnostic.config { virtual_text = false, float = { border = border } } -- vim.diagnostic
  end,
}

return {
  "neovim/nvim-lspconfig",
  config = function()
    require("nvchad.configs.lspconfig").defaults()

    local lspconfig = require "lspconfig"
    local on_init = require("nvchad.configs.lspconfig").on_init
    local capabilities = require("nvchad.configs.lspconfig").capabilities
    local on_attach = require("gale.custom").custom_on_attach

    local servers = {
      "astro",
      "bashls",
      "clangd",
      -- "css_variables",
      "cssls",
      "eslint",
      "html",
      "hls",
      "gopls",
      "jsonls",
      "marksman",
      "ocamllsp",
      "pyright",
      "somesass_ls",
      -- "tailwindcss",
      "taplo",
      "yamlls",
      "zls",
    }

    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities,
      }
    end

    lspconfig.ruff_lsp.setup {
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        -- Disable hover in favour of Pyright
        client.server_capabilities.hoverProvider = false
      end,
      on_init = on_init,
      capabilities = capabilities,
    }

    lspconfig.lua_ls.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      on_init = on_init,
      settings = {
        Lua = {
          hint = { enable = true },
          telemetry = { enable = false },
          diagnostics = { globals = { "bit", "vim", "it", "describe", "before_each", "after_each" } },
          --[[ runtime = {
            version = "LuaJIT",
            path = vim.split(package.path, ";"),
          }, ]]
          -- NOTE: workspace libraries are set during lazy bootstrapping via lazydev
        },
      },
    }

    local border = "rounded"
    -- :LspInfo
    local win = require "lspconfig.ui.windows"
    win.default_options = { border = border }
    -- vim.diagnostic.open_float()
    vim.diagnostic.config { virtual_text = false, float = { border = border } }
  end,
}

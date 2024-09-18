---@type NvPluginSpec

return {
  "neovim/nvim-lspconfig",
  config = function()
    dofile(vim.g.base46_cache .. "lsp")

    local lspconfig = require "lspconfig"
    local on_init = require("gale.lsp").on_init
    local capabilities = require("gale.lsp").capabilities
    local create_on_attach = require("gale.lsp").create_on_attach
    local inlay_hints_settings = require("gale.lsp").inlay_hints_settings

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
      -- tailwindcss = {},
      taplo = {},
      vtsls = {
        settings = {
          javascript = {
            inlayHints = inlay_hints_settings,
          },
          typescript = {
            inlayHints = inlay_hints_settings,
          },
          vtsls = {
            tsserver = {
              globalPlugins = {
                "@styled/typescript-styled-plugin",
              },
            },
            experimental = {
              completion = {
                enableServerSideFuzzyMatch = true,
              },
            },
          },
        },
      },
      yamlls = {},
      zls = {},
    }

    for name, opts in pairs(servers) do
      opts.on_init = on_init
      opts.on_attach = create_on_attach(opts.on_attach)
      opts.capabilities = capabilities
      lspconfig[name].setup(opts)
    end

    -- LSP UI
    local border = "rounded"

    local x = vim.diagnostic.severity
    vim.diagnostic.config {
      virtual_text = false,
      signs = { text = { [x.ERROR] = "", [x.WARN] = "", [x.INFO] = "", [x.HINT] = "󰌵" } },
      float = { border = border },
      underline = true,
    }

    -- :LspInfo
    local win = require "lspconfig.ui.windows"
    win.default_options = { border = border }

    -- Gutter
    vim.fn.sign_define("CodeActionSign", { text = "󰉁", texthl = "CodeActionSignHl" })
  end,
}

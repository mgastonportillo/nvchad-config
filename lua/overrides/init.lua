return {
  -- https://github.com/neovim/nvim-lspconfig
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      -- actual overrides
      require "configs.lspconfig"
    end,
  },
  -- https://github.com/numToStr/Comment.nvim
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
  },
  -- https://github.com/stevearc/conform.nvim
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = {
      formatters_by_ft = {
        -- clang should work by default
        css = { "prettier" },
        scss = { "prettier" },
        gleam = { "gleam" },
        go = { "gofmt" },
        html = { "prettier" },
        javascript = { "prettier" },
        lua = { "stylua" },
        toml = { "taplo" },
      },
      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
      },
    },
  },
  -- https://github.com/williamboman/mason.nvim
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- Bash
        "bash-language-server",
        "beautysh",
        "shellcheck",
        -- C
        "clangd",
        "clang-format",
        -- Go
        "golangci-lint",
        -- Markdown
        "marksman",
        "markdownlint",
        "mdformat",
        -- Lua
        "lua-language-server",
        "stylua",
        -- Web Dev
        "css-lsp",
        "djlint",
        "html-lsp",
        "stylelint",
        "typescript-language-server",
        "prettier",
        "tailwindcss-language-server",
        -- Python
        "debugpy",
        "mypy",
        "ruff-lsp",
        "pyright",
        "python-lsp-server",
        -- Rust
        "rust-analyzer",
        "codelldb",
        -- toml
        "dprint",
        "astro-language-server",
      },
    },
  },
  -- https://github.com/nvim-treesitter/nvim-treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "astro",
        "bash",
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "scss",
        "javascript",
        "typescript",
        "tsx",
        "c",
        "rust",
        "toml",
        "http",
        "json",
        "markdown",
        "markdown_inline",
      },
      indent = {
        enable = true,
      },
    },
  },
  -- https://github.com/nvim-tree/nvim-tree.lua
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = {
        enable = true,
      },
      renderer = {
        highlight_git = true,
        icons = {
          glyphs = {
            folder = {
              default = "",
              open = "",
              empty = "",
              empty_open = "",
            },
          },
        },
      },
      -- allow statuscolumn to be applied on nvim-tree
      view = {
        signcolumn = "no",
      },
    },
  },
  -- https://github.com/nvim-tree/nvim-web-devicons
  {
    "nvim-tree/nvim-web-devicons",
    opts = {
      override_by_extension = {
        ["astro"] = {
          icon = "",
          color = "#EF8547",
          name = "Astro",
        },
      },
    },
  },
}

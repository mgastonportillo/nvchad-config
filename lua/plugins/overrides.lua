local cmp = require "cmp"

return {
  -- testing
  --[[ {
    "NvChad/ui",
    branch = "bugfix",
  }, ]]
  -- https://github.com/neovim/nvim-lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = { "folke/neodev.nvim" },
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  -- https://github.com/hrsh7th/nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    opts = {
      mapping = {
        ["<Tab>"] = cmp.mapping(function(fallback)
          fallback()
        end),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          fallback()
        end),
      },
    },
  },
  -- https://github.com/nvim-telescope/telescope.nvim
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        selection_caret = " ",
        entry_prefix = " ",
      },
    },
  },
  -- https://github.com/numToStr/Comment.nvim
  {
    "numToStr/Comment.nvim",
    config = function()
      require "configs.comment"
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
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        lua = { "stylua" },
        toml = { "taplo" },
      },
      format_on_save = function(bufnr)
        -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return { timeout_ms = 500, lsp_fallback = true }
      end,
    },
  },
  -- https://github.com/williamboman/mason.nvim
  {
    "williamboman/mason.nvim",
    opts = {
      ui = { border = "rounded" },
      ensure_installed = {
        "bash-language-server",
        "beautysh",
        "shellcheck",
        "clangd",
        "clang-format",
        "golangci-lint",
        "marksman",
        "markdownlint",
        "mdformat",
        "lua-language-server",
        "stylua",
        "css-lsp",
        "djlint",
        "html-lsp",
        "stylelint",
        "typescript-language-server",
        "astro-language-server",
        "prettier",
        "tailwindcss-language-server",
        "debugpy",
        "mypy",
        "ruff-lsp",
        "pyright",
        "python-lsp-server",
        "rust-analyzer",
        "codelldb",
        "dprint",
      },
    },
  },
  -- https://github.com/nvim-treesitter/nvim-treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
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
        "go",
        "rust",
        "toml",
        "http",
        "json",
        "gleam",
        "markdown",
        "markdown_inline",
      },
      auto_install = true,
      indent = { enable = true },
      highlight = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<leader>v",
          node_incremental = "<Tab>",
          scope_incremental = "<S-s>",
          node_decremental = "<S-Tab>",
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = { query = "@function.outer", desc = "Select around function" },
            ["if"] = { query = "@function.inner", desc = "Select inner part of function" },
            ["ac"] = { query = "@class.outer", desc = "Select around class" },
            ["ic"] = { query = "@class.inner", desc = "Select inner part of class" },
            ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
          },
          selection_modes = {
            ["@parameter.outer"] = "v",
            ["@function.outer"] = "V",
            ["@class.outer"] = "<c-v>",
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ["<leader>wn"] = "@parameter.inner",
          },
          swap_previous = {
            ["<leader>wp"] = "@parameter.inner",
          },
        },
      },
    },
  },
  -- https://github.com/nvim-tree/nvim-tree.lua
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = { enable = true },
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
      -- Allow statuscolumn to be applied on nvim-tree
      view = { signcolumn = "no" },
    },
  },
  -- https://github.com/nvim-tree/nvim-web-devicons
  {
    "nvim-tree/nvim-web-devicons",
    opts = {
      override_by_extension = {
        ["astro"] = { icon = "", color = "#fe5d02", name = "Astro" },
      },
    },
  },
}

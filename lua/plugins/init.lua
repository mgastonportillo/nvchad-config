return {
  { import = "plugins.gale.better-escape" },
  { import = "plugins.gale.ccc" },
  { import = "plugins.gale.chatgpt", enabled = false },
  { import = "plugins.gale.codeium", enabled = false },
  { import = "plugins.gale.crates" },
  { import = "plugins.gale.dap-python" },
  { import = "plugins.gale.dap-ui", enabled = false }, -- error with nvim-nio
  { import = "plugins.gale.dap-virtual-text" },
  { import = "plugins.gale.diffview" },
  { import = "plugins.gale.dressing" },
  { import = "plugins.gale.fine-cmdline" },
  { import = "plugins.gale.fugitive" },
  { import = "plugins.gale.hover" },
  { import = "plugins.gale.lspsaga" },
  { import = "plugins.gale.lsp-signature" },
  { import = "plugins.gale.md-preview" },
  { import = "plugins.gale.neocomposer" },
  { import = "plugins.gale.neodev" },
  { import = "plugins.gale.notify" },
  { import = "plugins.gale.project" },
  { import = "plugins.gale.regexplainer" },
  { import = "plugins.gale.rust-tools" },
  { import = "plugins.gale.searchbox" },
  { import = "plugins.gale.swenv" },
  { import = "plugins.gale.todo-comments" },
  { import = "plugins.gale.trouble" },
  { import = "plugins.gale.ts-autotag" },
  { import = "plugins.gale.typescript-tools" },
  { import = "plugins.gale.ufo-statuscol", enabled = false },
  { import = "plugins.gale.zen-mode" },
  { "TabbyML/vim-tabby", lazy = false },
  { "gleam-lang/gleam.vim", lazy = false },
  -- core plugins
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  { "lukas-reineke/lsp-format.nvim" },
  {
    "creativenull/efmls-configs-nvim",
    dependencies = { "neovim/nvim-lspconfig" },
  },
  {
    "numToStr/Comment.nvim",
    dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
    config = function()
      require("Comment").setup {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "efm",
        -- Bash
        "bash-language-server",
        "beautysh",
        "shellcheck",
        -- C
        "clangd",
        "clang-format",
        -- Deno
        "prettier",
        -- Go
        "golangci-lint",
        -- Haskell
        "fourmolu",
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
        -- Python
        "debugpy",
        "mypy",
        "ruff",
        "pyright",
        "python-lsp-server",
        -- Rust
        "rust-analyzer",
        -- toml
        "dprint",
        -- "lua-language-server", "stylua",
        -- "html-lsp", "css-lsp" , "prettier",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
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

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = {
        enable = true,
      },

      renderer = {
        highlight_git = true,
        icons = {
          show = {
            -- git = true,
          },
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
    },
  },
  -- {
  --   "stevearc/conform.nvim",
  --   event = 'BufWritePre', -- uncomment for format on save
  --   config = function()
  --     require "conform"
  --   end,
  -- },
}

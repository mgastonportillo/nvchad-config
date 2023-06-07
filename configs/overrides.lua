local M = {}

M.mason = {
  ensure_installed = {
    -- bash
    "bash-language-server",
    -- markdown
    "marksman",
    -- lua
    "lua-language-server",
    "stylua",
    -- web dev
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    -- deno
    "prettier",
    -- c/cpp
    "clangd",
    "clang-format",
    -- python
    "black",
    "debugpy",
    "mypy",
    "ruff",
    "python-lsp-server",
    -- rust
    "rust-analyzer",
  },
}

-- git support in nvimtree
M.nvimtree = {
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
}

M.treesitter = {
  ensure_installed = {
    "bash",
    "vim",
    "lua",
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
    -- disable = {
    --   "python"
    -- },
  },
}

return M

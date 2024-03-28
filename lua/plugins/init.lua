return {
	-- Escape from insert mode without delay when typing
	-- https://github.com/max397574/better-escape.nvim
	{ import = "plugins.gale.better-escape" },
	-- Color picker and highlighter
	-- https://github.com/uga-rosa/ccc.nvim
	{ import = "plugins.gale.ccc" },
	-- Manage crates.io dependencies
	-- https://github.com/Saecki/crates.nvim
	{ import = "plugins.gale.crates" },
	-- Python support for nvim-dap
	-- https://github.com/mfussenegger/nvim-dap-python
	{ import = "plugins.gale.dap-python" },
	-- HACK: Ensure dap-ui dependency, nvim-nio, is installed
	{ "nvim-neotest/nvim-nio" },
	-- UI for nvim-dap
	-- https://github.com/rcarriga/nvim-dap-ui
	{ import = "plugins.gale.dap-ui" },
	-- Virtual text support for nvim-dap
	-- https://github.com/theHamsta/nvim-dap-virtual-text
	{ import = "plugins.gale.dap-virtual-text" },
	-- Git integration for buffers
	-- https://github.com/lewis6991/gitsigns.nvim
	{ import = "plugins.gale.gitsigns" },
	-- Neovim plugin to improve the default vim.ui interfaces
	-- https://github.com/stevearc/dressing.nvim
	{ import = "plugins.gale.dressing", enabled = false },
	-- Enter ex-commands in a nice floating input
	-- https://github.com/VonHeikemen/fine-cmdline.nvim
	{ import = "plugins.gale.fine-cmdline", enabled = false },
	-- A Git wrapper so awesome, it should be illegal
	-- https://github.com/tpope/vim-fugitive
	{ import = "plugins.gale.fugitive" },
	-- Gleam language support
	-- https://github.com/gleam-lang/gleam.vim
	{ import = "plugins.gale.gleam" },
	-- Hover plugin framework
	-- https://github.com/lewis6991/hover.nvim
	{ import = "plugins.gale.hover" },
	-- Improves the built-in LSP experience
	-- https://github.com/nvimdev/lspsaga.nvim
	{ import = "plugins.gale.lspsaga" },
	-- LSP signature hint as you type
	-- https://github.com/ray-x/lsp_signature.nvim
	{ import = "plugins.gale.lsp-signature" },
	-- Markdown Preview
	-- https://github.com/iamcco/markdown-preview.nvim
	{ import = "plugins.gale.md-preview" },
	-- Neovim plugin that simplifies macros, enhancing productivity with harmony
	-- https://github.com/ecthelionvi/NeoComposer.nvim
	{ import = "plugins.gale.neocomposer", enabled = false },
	-- Neovim setup for init.lua and plugin development with full signature help, docs and completion for the nvim lua API
	-- https://github.com/folke/neodev.nvim
	{ import = "plugins.gale.neodev" },
	-- A fancy, configurable, notification manager
	-- https://github.com/rcarriga/nvim-notify
	{ import = "plugins.gale.notify" },
	-- The superior project management solution
	-- https://github.com/ahmedkhalf/project.nvim
	{ import = "plugins.gale.project", enabled = false },
	-- Describe the regexp under the cursor
	-- https://github.com/bennypowers/nvim-regexplainer
	{ import = "plugins.gale.regexplainer" },
	-- A heavily modified fork of rust-tools.nvim
	-- https://github.com/mrcjkb/rustaceanvim
	{ import = "plugins.gale.rustaceanvim" },
	-- Start your search from a more comfortable place
	-- https://github.com/VonHeikemen/searchbox.nvim
	{ import = "plugins.gale.searchbox" },
	-- Tiny plugin to quickly switch python virtual environments from within neovim without restarting
	-- Tiny plugin to quickly switch python virtual environments from within neovim without restarting
	{ import = "plugins.gale.swenv", enabled = false },
	---- Opensource, self-hosted AI coding assistant
	---- https://tabby.tabbyml.com/docs/extensions/installation/vim/
	{ import = "plugins.gale.tabby-ml" },
	-- Highlight, list and search todo comments in your projects
	-- https://github.com/folke/todo-comments.nvim
	{ import = "plugins.gale.todo-comments" },
	-- A pretty diagnostics, references, telescope results, quickfix and location list to help you solve all the trouble your code is causing
	-- https://github.com/folke/trouble.nvim
	{ import = "plugins.gale.trouble" },
	-- Use treesitter to auto close and auto rename html tags
	-- https://github.com/windwp/nvim-ts-autotag
	{ import = "plugins.gale.ts-autotag" },
	-- TypeScript integration NeoVim deserves
	-- https://github.com/pmizio/typescript-tools.nvim
	{ import = "plugins.gale.typescript-tools" },
	-- Distraction-free coding
	-- https://github.com/folke/zen-mode.nvim
	{ import = "plugins.gale.zen-mode" },

	-- GROUP: [[ OVERRIDES ]]

	-- https://github.com/neovim/nvim-lspconfig
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("nvchad.configs.lspconfig").defaults()
			require("configs.lspconfig")
		end,
	},
	-- https://github.com/numToStr/Comment.nvim
	{
		"numToStr/Comment.nvim",
		opts = "configs.comment",
	},
	-- https://github.com/stevearc/conform.nvim
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		opts = require("configs.conform-opts"),
	},
	-- https://github.com/williamboman/mason.nvim
	{
		"williamboman/mason.nvim",
		opts = "configs.mason",
	},
	-- https://github.com/nvim-treesitter/nvim-treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		opts = require("configs.nvim-treesitter"),
	},
	-- https://github.com/nvim-tree/nvim-tree.lua
	{
		"nvim-tree/nvim-tree.lua",
		opts = require("configs.nvim-tree"),
	},
}

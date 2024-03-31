# My custom Nvchad v2.5 configuration

<p align="center"><img src="https://github.com/mgastonportillo/nvchad-config/assets/106234166/674bfdac-6914-41be-b001-3dd6bc610495"></p>
<hr>

### Features:

- Supports NvChad v2.5
- Target OS: WSL2 (Windows 11) - To use on Linux, comment out clipboard in the g table at `lua/options.lua` and make sure you have something like xclip installed
- Modularised setup of plugins and configurations
- Pair with Wezterm using
  <a href="https://github.com/mgastonportillo/wezterm-config">my Wezterm
  configuration</a> for a smoother experience
- Scripting with Bash, Lua and Toml as smooth as it gets
- Development with C, Go, Haskell, Python, Javascript/Typescript and React **fully covered**
- Many Web Dev tools included: Linter and formatters for JSON, Markdown, SASS, etc.
- Currently figuring out Rust setup
- Git integrated using Gitsigns, DiffView and VimFugitive
- Markdown Preview with live changes in browser

<hr>

### Planned implementations:

- ~~Markdown Preview~~ **added!**
- ~~Python code completion~~ **added!**
- Self-install (no ETA)

<hr>

### Bugs:

- Nothing here

### Dependencies:

Required:

- NVIM v0.9.5+
- NvChad v2.5+
- Python 3.10.6+ & pip
- pip: `pynvim==0.4.3+`, `ruff-lsp==0.0.53`, `mypy==1.9.0`
- npm: `neovim@4.10.1+`

Recommended:

- Node.js v21.3.0+
- Cargo 1.74.1+

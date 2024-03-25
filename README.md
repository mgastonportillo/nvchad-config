# My custom Nvchad v2.5 configuration

<p align="center"><img src="https://github.com/mgastonportillo/nvchad-config/assets/106234166/674bfdac-6914-41be-b001-3dd6bc610495"></p>
<hr>

### Disclaimer:

After the migration from NvChad v2.0 to v2.5 there might be some bugs or things not working. If you use my config, please let me know if you find anything broken and I'll try my best to fix it.

### Featuring:

- Supports NvChad v2.5
- Modularised setup of plugins and configurations
- Pair with Wezterm using
  <a href="https://github.com/mgastonportillo/wezterm-config">my Wezterm
  configuration</a> for a smoother experience
- Scripting with Bash, Lua and Toml as smooth as it gets
- Development with C, Go, Haskell, Python, Rust, Javascript and React **fully covered**
- Many Web Dev tools included: Linter and formatters for JSON, Markdown, SASS, etc.
- Git integrated using Gitsigns and Vim Fugitive
- Markdown Preview with live changes in browser
- **Only** major change regarding NvChad defaults is using typescript-tools (tsserver) over deno as an lsp

<hr>

### Planned implementations:

- ~~Markdown Preview~~ **added!**
- ~~Python code completion~~ **added!**
- Move back to deno as an lsp
- Self-install (no ETA)

<hr>

### Bugs:

- Markdown Preview might not working depending on your setup

### Dependencies:

Required:

- NVIM v0.9.5+
- NvChad v2.5+
- Python 3.10.6+ & pip
- pip: `pynvim==0.4.3+`
- npm: `neovim@4.10.1+`

Recommended:

- Node.js v21.3.0+
- Cargo 1.74.1+

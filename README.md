# My custom Neovim configuration

<p align="center"><img src="https://github.com/mgastonportillo/nvchad-config/assets/106234166/1ee24026-0a17-4964-9716-1fe0cb1bd5fc"></p>
<hr>

### Features:

- Features [NvChad v2.5](https://nvchad.com/news/v2.5_release)
- Target OS: WSL2/Linux
- Modularised setup of plugins and configurations
- Scripting with Bash, Lua and Toml as smooth as it gets
- Web development with JS/TS, React and Astro **fully covered**
- Development with Rust, C and Go
- Git integrated using [Neogit](https://github.com/NeogitOrg/neogit),
  [Gitsigns](https://github.com/lewis6991/gitsigns.nvim),
  [DiffView](https://github.com/sindrets/diffview.nvim),
  [Telescope](https://github.com/nvim-telescope/telescope.nvim?tab=readme-ov-file#git-pickers)
  and [VimFugitive](https://github.com/tpope/vim-fugitive)
- [Markdown Preview](https://github.com/iamcco/markdown-preview.nvim) with live
  changes in browser
- Round borders as a priority over sharp borders

> [!TIP]
>
> Pair with <a href="https://github.com/mgastonportillo/wezterm-config"> my
> Wezterm configuration</a> for a smoother experience

> [!WARNING]
>
> **Disclaimer**: I frequently use `git rebase -i` to streamline my
> configuration. if you plan to use `lazy-lock.json` to stick with certain
> snapshots of the config, you might have a hard time due to changing commit
> hashes.

<hr>

### Planned implementations:

- ✅ ~~Markdown Preview~~
- ✅ ~~Python code completion~~
- ✅ ~~Polish setup for development with C and Go~~

<hr>

### Bugs:

- 🐞

### Dependencies:

Required:

- NVIM Stable v0.10.0+ (Nightlies might work)
- NvChad v2.5
- Python 3.11.7+ & pip
- pip: `pynvim==0.4.3+`
- Node.js v22+
- npm: `neovim@4.10.1+`

Recommended:

- Cargo 1.74.1+

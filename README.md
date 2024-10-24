# My custom Neovim configuration

<p align="center"><img src="https://github.com/user-attachments/assets/5fe2b095-1d53-41e9-8ce8-12288bc2b5e1"></p>
<hr>

### Features

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

>[!TIP]
> Pair with <a href="https://github.com/mgastonportillo/wezterm-config"> my
> Wezterm configuration</a> for a smooth experience

>[!WARNING]
> **Disclaimer**: I frequently use `git rebase -i` to streamline my
> configuration. if you plan to use `lazy-lock.json` to stick with certain
> snapshots of the config, you might have a hard time due to changing commit
> hashes.

<hr>

### Planned implementations

- 💡 I'm all ears for suggestions and ideas

<hr>

### Known bugs

- 🐞 If you find any, please open an issue

<hr>

### Dependencies

Required:

- [NVIM](https://neovim.io/) Stable v0.10.1+ (Nightlies might work)
- [NvChad](https://nvchad.com/) v2.5
- Any [NerdFont](https://www.nerdfonts.com/) or patched font (I use [JetBrains Mono](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip))
- [win32yank](https://github.com/equalsraf/win32yank) (recent choice, only required for WSL users)
- Python 3.11.7+ & pip 23.3.1+
- pip: `pynvim==0.4.3+`
- Node.js v22+
- npm: `neovim@4.10.1+`

Recommended:

- Cargo 1.80.1+

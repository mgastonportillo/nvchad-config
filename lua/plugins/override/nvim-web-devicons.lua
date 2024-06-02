return {
  "nvim-tree/nvim-web-devicons",
  opts = {
    override = {
      md = { icon = "󰽛", color = "#ffffff", name = "Markdown" },
      mdx = { icon = "󰽛", color = "#ffffff", name = "Mdx" },
    },
    override_by_extension = {
      astro = { icon = "", color = "#fe5d02", name = "astro" },
      javascript = { icon = "" },
      typescript = { icon = "󰛦" },
      lockb = { icon = "", color = "#fbf0df", name = "bun-lock" },
    },
    override_by_filename = {
      [".stylua.toml"] = { icon = "", color = "#6d8086", name = "stylua" },
      [".gitignore"] = { icon = "", color = "#6d8086", name = "gitignore" },
      ["license"] = { icon = "󰿃", name = "License" },
    },
  },
}

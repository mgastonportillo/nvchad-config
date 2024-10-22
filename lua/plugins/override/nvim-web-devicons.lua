---@type NvPluginSpec
return {
  "nvim-tree/nvim-web-devicons",
  opts = {
    override = {
      md = { icon = "󰽛", color = "#FFFFFF", name = "Md" },
      mdx = { icon = "󰽛", color = "#FFFFFF", name = "Mdx" },
      jsonl = { icon = "", color = "#CBCB41", name = "Jsonl" },
      markdown = { icon = "󰽛", color = "#FFFFFF", name = "Markdown" },
    },
    override_by_extension = {
      astro = { icon = "", color = "#FE5D02", name = "Astro" },
      javascript = { icon = "" },
      typescript = { icon = "󰛦" },
      lockb = { icon = "", color = "#FBF0DF", name = "bun-lock" },
    },
    override_by_filename = {
      [".stylua.toml"] = { icon = "", color = "#6D8086", name = "stylua" },
      [".gitignore"] = { icon = "", color = "#F44D27", name = "gitignore" },
      ["license"] = { icon = "󰿃", name = "License" },
    },
  },
}

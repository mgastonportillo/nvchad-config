return {
  "VonHeikemen/fine-cmdline.nvim",
  event = "VimEnter",
  dependencies = "MunifTanjim/nui.nvim",
  config = function()
    require("fine-cmdline").setup {
      cmdline = {
        prompt = "   ",
      },
    }
  end,
}

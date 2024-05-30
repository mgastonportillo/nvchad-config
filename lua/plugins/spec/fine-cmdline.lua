return {
  enabled = false,
  "VonHeikemen/fine-cmdline.nvim",
  cmd = "FineCmdline",
  dependencies = "MunifTanjim/nui.nvim",
  init = function()
    local map = vim.keymap.set
    map("n", ":", "<cmd>FineCmdline<CR>", { desc = "CMD enter command mode" })
  end,
  config = function()
    require("fine-cmdline").setup {
      cmdline = {
        prompt = "   ",
      },
    }
  end,
}

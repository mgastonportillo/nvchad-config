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

    local map = vim.keymap.set
    map("n", ":", "<cmd>FineCmdline<CR>", { desc = "CMD enter command mode" })
  end,
}

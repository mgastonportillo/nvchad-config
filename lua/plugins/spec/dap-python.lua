---@type NvPluginSpec
return {
  "mfussenegger/nvim-dap-python",
  ft = "python",
  dependencies = {
    { "mfussenegger/nvim-dap" },
    { "rcarriga/nvim-dap-ui" },
  },
  config = function()
    local dap_py = require "dap-python"
    local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"

    dap_py.setup(path)

    vim.keymap.set("n", "<leader>pdr", function()
      dap_py.test_method()
    end, { desc = "Run Python debug" })
  end,
}

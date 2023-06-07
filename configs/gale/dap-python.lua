local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
local spec = {
  "mfussenegger/nvim-dap-python",
  ft = "python",
  dependencies = {
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
  },
  config = function()
    require("dap-python").setup(path)
    require("core.utils").load_mappings "dap_python"
  end,
}

return spec

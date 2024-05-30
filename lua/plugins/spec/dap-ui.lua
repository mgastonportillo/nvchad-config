return {
  "rcarriga/nvim-dap-ui",
  event = "LspAttach",
  dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
  opts = {},
  config = function()
    local map = vim.keymap.set
    local dap = require "dap"
    local dapui = require "dapui"
    local widgets = require "dap.ui.widgets"
    local sidebar = widgets.sidebar(widgets.scopes)

    dapui.setup()

    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    map("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", { desc = "DAP Toggle breakpoint" })
    map("n", "<leader>dt", function()
      sidebar.toggle()
    end, { desc = "DAP Toggle sidebar" })
  end,
}

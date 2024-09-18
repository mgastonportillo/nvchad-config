return {
  "supermaven-inc/supermaven-nvim",
  event = "LspAttach",
  opts = {
    keymaps = {
      accept_suggestion = "<Tab>",
      clear_suggestion = "<C-x>",
      accept_word = "<C-y>",
    },
    disable_keymaps = false,
    log_level = "info",
    dsable_inline_completion = false,
  },
}

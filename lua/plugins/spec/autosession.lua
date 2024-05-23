return {
  enabled = false,
  "rmagatti/auto-session",
  event = "VimEnter",
  config = function()
    require("auto-session").setup {
      log_level = "error",
      auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
    }
  end,
}

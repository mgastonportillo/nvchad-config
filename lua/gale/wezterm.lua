if not vim.g.is_wsl then
  return {}
end

local is_wezterm = function()
  local term = vim.fn.getenv "TERM_PROGRAM"
  return term == "WezTerm"
end

if not is_wezterm() then
  return {}
end

return {
  { "justinsgithub/wezterm-types" },
}

-- Automatically detect context for comment string
_G.__toggle_contextual = function(mode)
  local cfg = require("Comment.config"):get()
  local U = require "Comment.utils"
  local Op = require "Comment.opfunc"
  local range = U.get_region(mode)
  local same_line = range.srow == range.erow

  local ctx = {
    cmode = U.cmode.toggle,
    range = range,
    cmotion = U.cmotion[mode] or U.cmotion.line,
    ctype = same_line and U.ctype.linewise or U.ctype.blockwise,
  }

  local lcs, rcs = U.parse_cstr(cfg, ctx)
  local lines = U.get_lines(range)

  local params = {
    range = range,
    lines = lines,
    cfg = cfg,
    cmode = ctx.cmode,
    lcs = lcs,
    rcs = rcs,
    cfg,
  }

  if same_line then
    Op.linewise(params)
  else
    Op.blockwise(params)
  end
end

---@param case_table table
-- Add Switch/Case functionality
_G.switch = function(param, case_table)
  local case = case_table[param]
  if case then
    return case()
  end
  local def = case_table["default"]
  return def and def() or nil
end

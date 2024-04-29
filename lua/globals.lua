-- Reload plugin via plenary
RELOAD = function(...)
  return require("plenary.reload").reload_module(...)
end

-- Actually reload plugin
R = function(name)
  RELOAD(name)
  return require(name)
end

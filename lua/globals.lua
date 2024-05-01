-- Reload plugin via plenary
RELOAD = function(name)
  return require("plenary.reload").reload_module(name)
end

-- Actually reload plugin
R = function(name)
  RELOAD(name)
  return require(name)
end

local normalise = vim.fs.normalize

local config = vim.fn.stdpath "config"
local modules = { "/lua/plugins/gale", "/lua/plugins/spec", "/lua/plugins/override" }
local output = normalise(config .. "/lua/plugins") .. "/init.lua"

local reverse_table_in_place = function(tbl)
  local len = #tbl
  for i = 1, math.floor(len / 2) do
    tbl[i], tbl[len - i + 1] = tbl[len - i + 1], tbl[i]
  end
end

local normalise_module = function(path)
  local modified_str, _ = path:gsub("/", "", 1):gsub("/", ".")
  return modified_str
end

local get_spec_paths = function(path)
  local spec_paths = {}
  for file, _ in vim.fs.dir(normalise(config .. path)) do
    table.insert(spec_paths, normalise_module(path:gsub("lua/", "")) .. "." .. file:gsub(".lua", ""))
  end
  return spec_paths
end

local write_file = function(file_path, content)
  local file = assert(io.open(file_path, "w"))
  if not file then
    print "Error: Could not open output file for writing."
    return
  end

  file:write(content)
  file:close()
end

local generate_imports = function()
  local insertion_index = 2
  local content = {
    "return {",
    "}",
  }

  local raw_imports = {}
  for _, dir in ipairs(modules) do
    local temp_tbl = get_spec_paths(dir)
    for _, v in ipairs(temp_tbl) do
      table.insert(raw_imports, v)
    end
  end

  local final_imports = {}
  for _, str in ipairs(raw_imports) do
    table.insert(final_imports, string.format('{ import = "%s" },', str))
  end

  reverse_table_in_place(final_imports)
  for _, str in ipairs(final_imports) do
    table.insert(content, insertion_index, string.rep(" ", vim.o.tabstop) .. str)
  end

  write_file(output, table.concat(content, "\n"))
  print(#final_imports .. " imports written to " .. output)
end

generate_imports()

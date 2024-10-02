if vim.fn.has "unix" ~= 1 or vim.fn.has "macunix" == 1 or vim.fn.has "wsl" == 1 then
  return
end

-- Function to check if a command exists
local function command_exists(cmd)
  return vim.fn.executable(cmd) == 1
end

-- Check for available clipboard tools
local clipboard_tool = ""
if command_exists "xclip" then
  clipboard_tool = "xclip -selection clipboard"
elseif command_exists "xsel" then
  clipboard_tool = "xsel --clipboard --input"
elseif command_exists "wl-copy" then
  clipboard_tool = "wl-copy"
else
  -- Try to install xclip on Ubuntu/Debian systems
  if command_exists "apt-get" then
    print "Clipboard tool not found. Attempting to install xclip..."
    os.execute "sudo apt-get update && sudo apt-get install -y xclip"
    if command_exists "xclip" then
      clipboard_tool = "xclip -selection clipboard"
      print "xclip installed successfully."
    else
      print "Failed to install xclip. Please install xclip, xsel, or wl-copy manually."
      return
    end
  else
    print "No clipboard tool found. Please install xclip, xsel, or wl-copy manually."
    return
  end
end

vim.g.clipboard = {
  name = "linux-clipboard",
  copy = {
    ["+"] = clipboard_tool,
    ["*"] = clipboard_tool,
  },
  paste = {
    ["+"] = clipboard_tool == "wl-copy" and "wl-paste" or (clipboard_tool .. " -o"),
    ["*"] = clipboard_tool == "wl-copy" and "wl-paste" or (clipboard_tool .. " -o"),
  },
  cache_enabled = 0,
}

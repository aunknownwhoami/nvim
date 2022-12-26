-- Name of the colorscheme
local name = "dull"

-- Check for colorscheme configuration, if available or not
pcall(require, "user.core.colorscheme.config." .. name)

-- Set the colorscheme, if it's found
local colorscheme_status_ok, _ = pcall(vim.cmd, "colorscheme " .. name)
if not colorscheme_status_ok then
  return
end

local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local dull = require "user.theme.lualine.themes.dull"
local statusline = nil

if vim.g.dull_style == "slime" then
  statusline = require "user.plugins.lualine.slime_lualine"
elseif vim.g.dull_style == "sunset" then
  statusline = require "user.plugins.lualine.sunset_lualine"
else
  statusline = require "user.plugins.lualine.night_lualine"
end

lualine.setup {
  options = {
    globalstatus = true,
    icons_enabled = true,
    theme = dull,
    disabled_filetypes = {
      "dashboard",
      "lspinfo",
      "mason",
      "startuptime",
      "checkhealth",
      "help",
      "TelescopePrompt",
      "toggleterm",
    },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      statusline.branch,
      statusline.mode,
      statusline.diagnostics,
      "%=",
      statusline.lsp,
    },
    lualine_x = {
      statusline.diff,
      statusline.filetype,
      statusline.filesize,
      statusline.progress,
      statusline.percent,
      statusline.total_lines,
    },
    lualine_y = {},
    lualine_z = {},
  },
}

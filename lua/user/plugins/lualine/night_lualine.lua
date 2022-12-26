local M = {}

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local null_ls = require "user.plugins.lsp.null-ls"
local color = require "user.theme.palette"

local mode_names = {
  ["n"] = "NORMAL",
  ["no"] = "PENDING",
  ["nov"] = "PENDING",
  ["noV"] = "PENDING",
  ["no\22"] = "PENDING",
  ["niI"] = "NORMAL",
  ["niR"] = "NORMAL",
  ["niV"] = "NORMAL",
  ["nt"] = "NORMAL",
  ["ntT"] = "NORMAL",
  ["v"] = "VISUAL",
  ["vs"] = "VISUAL",
  ["V"] = "V-LINE",
  ["Vs"] = "V-LINE",
  ["\22"] = "V-BLOCK",
  ["\22s"] = "V-BLOCK",
  ["s"] = "SELECT",
  ["S"] = "S-LINE",
  ["\19"] = "S-BLOCK",
  ["i"] = "INSERT",
  ["ic"] = "INSERT",
  ["ix"] = "INSERT",
  ["R"] = "REPLACE",
  ["Rc"] = "REPLACE",
  ["Rx"] = "REPLACE",
  ["Rv"] = "V-REPLACE",
  ["Rvc"] = "V-REPLACE",
  ["Rvx"] = "V-REPLACE",
  ["c"] = "COMMAND",
  ["cv"] = "EX",
  ["ce"] = "EX",
  ["r"] = "REPLACE",
  ["rm"] = "MORE",
  ["r?"] = "CONFIRM",
  ["!"] = "SHELL",
  ["t"] = "TERMINAL",
}

M.mode = {
  function()
    local mode_name = vim.api.nvim_get_mode().mode
    if mode_names[mode_name] == nil then
      return mode_name
    end
    return mode_names[mode_name]
  end,
  color = function()
    local mode_color = {
      n = color.blue,
      no = color.blue,
      nov = color.blue,
      noV = color.blue,
      ["no\22"] = color.blue,
      niI = color.blue,
      niR = color.blue,
      ntT = color.blue,
      nt = color.blue,
      i = color.green,
      ic = color.yellow,
      ix = color.green,
      v = color.purple,
      vs = color.purple,
      Vs = color.purple,
      [""] = color.purple,
      ["\22s"] = color.purple,
      V = color.purple,
      s = color.const_orange,
      S = color.const_orange,
      [""] = color.const_orange,
      R = color.red,
      Rc = color.red,
      Rv = color.red,
      Rx = color.red,
      Rvc = color.red,
      Rvx = color.red,
      c = color.yellow,
      cv = color.blue,
      ce = color.blue,
      r = color.red,
      rm = color.cyan,
      ["r?"] = color.cyan,
      ["!"] = color.blue,
      t = color.blue,
    }
    return { fg = mode_color[vim.api.nvim_get_mode().mode], bg = "#242E32" }
  end,
  separator = { right = "" },
}

M.diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn", "hint" },
  symbols = { error = " ", warn = " ", hint = " " },
  diagnostics_color = {
    error = { fg = color.red },
    warn = { fg = color.yellow },
    hint = { fg = color.violet },
  },
  update_in_insert = false,
  always_visible = true,
  color = { bg = "#000F10" },
  separator = { right = "" },
}

M.diff = {
  "diff",
  symbols = { added = " ", modified = " ", removed = " " },
  diff_color = {
    added = { fg = color.green },
    modified = { fg = color.blue },
    removed = { fg = color.red },
  },
  cond = hide_in_width,
  color = { bg = "#000f10" },
  separator = { left = "" },
}
M.branch = {
  "branch",
  icons_enabled = true,
  color = { fg = color.blue, bg = "#000f10" },
  icon = " ",
  separator = { right = "" },
}

M.filesize = {
  function()
    local function format_file_size(file)
      local size = vim.fn.getfsize(file)
      if size <= 0 then
        return ""
      end
      local sufixes = { " B", " KB", " MB", " GB" }
      local i = 1
      while size > 1024 do
        size = size / 1024
        i = i + 1
      end
      return string.format("%.1f%s", size, sufixes[i])
    end

    local file = vim.fn.expand "%:p"
    if string.len(file) == 0 then
      return ""
    end
    return format_file_size(file)
  end,
  color = { fg = color.blue, bg = "gray10" },
  separator = { left = "" },
}

M.lsp = {
  function()
    local buf_clients = vim.lsp.buf_get_clients()
    local clients = {}

    -- add client
    for _, client in pairs(buf_clients) do
      if client.name ~= "null-ls" then
        table.insert(clients, client.name)
      end
    end

    local supported_formatters = null_ls.list_registered_formatters(vim.bo.filetype)
    vim.list_extend(clients, supported_formatters)

    local supported_linters = null_ls.list_registered_linters(vim.bo.filetype)
    vim.list_extend(clients, supported_linters)

    if #clients > 0 then
      return table.concat(clients, ", ")
    else
      return "LS Inactive"
    end
  end,
  color = { fg = color.fg_dark, bg = "#000f10" },
  separator = { left = "", right = "" },
}

M.progress = {
  function()
    local current_line = vim.fn.line "."
    local total_lines = vim.fn.line "$"
    local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
    local line_ratio = current_line / total_lines
    local index = math.ceil(line_ratio * #chars)
    return chars[index]
  end,
  color = { fg = color.blue, bg = "#020F10" },
  separator = { left = "" },
}

M.total_lines = {
  function()
    return "%L"
  end,
  separator = { left = "" },
  color = { fg = color.blue, bg = "#000f10" },
}

M.percent = {
  "progress",
  separator = { left = "" },
  color = { fg = color.blue, bg = "#201B20" },
}

-- local spaces = {
--   function()
--     return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
--   end,
--   color = { fg = C.yellow, bg = "gray18" },
--   separator = { left = "" },
-- }

M.filetype = {
  "filetype",
  color = { fg = color.fg, bg = "#000F10" },
  separator = { left = "" },
  pading = 0,
}

return M

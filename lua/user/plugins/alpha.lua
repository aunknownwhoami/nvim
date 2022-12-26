local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local dashboard = require "alpha.themes.dashboard"
dashboard.section.header.val = {
  [[]],
  [[]],
  [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
  [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
  [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
  [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
  [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
  [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
}

dashboard.section.buttons.val = {
  dashboard.button("f", "  Find File", ":Telescope find_files<CR>"),
  dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("r", "  Recent Files", ":Telescope oldfiles<CR>"),
  dashboard.button("t", "  Find Text", ":Telescope live_grep<CR>"),
  dashboard.button("c", "  Configuration", ":e $MYVIMRC<CR>"),
  dashboard.button("u", "  Update Plugins", ":Lazy sync<CR>"),
  dashboard.button("q", "  Quit Neovim", ":qa!<CR>"),
}

local footer = function()
  -- Temporary solution
  local version = " " .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch
  local lazy_lock_path = vim.fn.stdpath "data" .. "/lazy-lock.json"
  local file = require("plenary.path"):new(lazy_lock_path)
  local plugins_count = 0

  if file:exists() then
    for _, _ in pairs(vim.fn.json_decode(file:read())) do
      plugins_count = plugins_count + 1
    end

    local total_plugins = "   " .. plugins_count .. " Plugins"
    return version .. total_plugins
  else
    return version
  end
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "AlphaFooter"
dashboard.section.header.opts.hl = "AlphaHeader"
dashboard.section.buttons.opts.hl = "AlphaButton"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)

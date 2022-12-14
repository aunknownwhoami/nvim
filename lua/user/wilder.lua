--wilder config for nvim
local wilder_status, wilder = pcall(require, "wilder")
if not wilder_status then
  return
end

wilder.set_option("use_python_remote_plugin", 0)
wilder.setup { modes = { ":", "/", "?" } }

wilder.set_option("pipeline", {
  wilder.branch(wilder.cmdline_pipeline(), wilder.search_pipeline()),
})

wilder.set_option(
  "renderer",
  wilder.popupmenu_renderer(wilder.popupmenu_border_theme {
    highlights = {
      border = "Normal", -- highlight to use for the border
    },
    -- 'single', 'double', 'rounded' or 'solid'
    -- can also be a list of 8 characters, see :h wilder#popupmenu_border_theme() for more details
    border = "rounded",
  })
)

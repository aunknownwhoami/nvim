require("lspconfig")["pyright"].setup {
  on_attach = on_attach,
}

--tailwindcss 
require("lspconfig")["tailwindcss"].setup {
  on_attach = on_attach,
}

--toggle lsp diagnostics
require("toggle_lsp_diagnostics").init {
  --config
  show_diagnostics = true,
  show_line_diagnostics = true,
  show_cursor_diagnostics = true,
  show_virtual_text = true,
  show_signs = true,
  show_diagnostic_hover = true,
  show_cursor_diagnostic_hover = true,
  show_diagnostic_virtual_text = true,
  show_cursor_diagnostic_virtual_text = true,
  underline_diagnostics = true,
  update_in_insert = false,
  severity_sort = false,
}



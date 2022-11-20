require("lspconfig")["pyright"].setup {
  on_attach = on_attach,
}

require("lspconfig")["tailwindcss"].setup {
  on_attach = on_attach,
}

--go
require("lspconfig")["gopls"].setup {
  on_attach = on_attach,
}

-- coderunner
require("code_runner").setup {
  -- put here the commands by filetype
  filetype = {
    java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
    python = "python3 -u",
    typescript = "deno run",
    rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
    c = "cd $dir && gcc $fileName -o $fileNameWithoutExt && $dir/$fileNameWithoutExt",
    cpp = "cd $dir && g++ $fileName -o $fileNameWithoutExt && $dir/$fileNameWithoutExt",
    -- sh = "bash",
    javascript = "node",
    php = "php",
    assembly = "nasm -f elf64 $fileName && ld $fileNameWithoutExt.o -o $fileNameWithoutExt && $dir/$fileNameWithoutExt",
  },

  -- mode = "toggleterm", -- "terminal" or "popup"
}

require("nvim-highlight-colors").setup {
  render = "background", -- or 'foreground' or 'first_column'
  enable_named_colors = true,
  enable_tailwind = true,
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


require("lspconfig")["pyright"].setup {
  on_attach = on_attach,
}

require("lspconfig")["tailwindcss"].setup {
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

--lsp_lines toogle
require("lsp_lines").toggle()

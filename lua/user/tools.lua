require("lspconfig")["pyright"].setup {
  on_attach = on_attach,
  flags = lsp_flags,

}

require("lspconfig")["tailwindcss"].setup {
  on_attach = on_attach,
  flags = lsp_flags,
}

--intelephense is a php language server that supports intellisense
require("lspconfig")["intelephense"].setup {
  on_attach = on_attach,
  flags = lsp_flags,
}

-- coderunner
require('code_runner').setup({
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
   
})

require("nvim-highlight-colors").setup {
	render = 'background', -- or 'foreground' or 'first_column'
	enable_named_colors = true,
	enable_tailwind = true
}

--grivebox coloerscheme 
require("gruvbox").setup({
    palette_overrides = {
        light0 = "#00ff00",
        light1 = "#00ff00",
        bright_blue = "#3cc1c7",
    }
})
vim.cmd("colorscheme gruvbox")


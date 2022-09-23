require "user.hot-reload"
require "user.keymaps"
require "user.plugins"
require "user.autocommands"
require "user.colorscheme"
require "user.cmp"
require "user.navic"
require "user.lsp-inlayhints"
require "user.lsp"
require "user.telescope"
require "user.treesitter"
require "user.autopairs"
require "user.comment"
require "user.gitsigns"
require "user.nvim-tree"
reload "user.lualine"
require "user.toggleterm"
require "user.project"
require "user.impatient"
require "user.indentline"
require "user.alpha"
require "user.whichkey"
require "user.hop"
require "user.matchup"
require "user.numb"
require "user.dial"
require "user.colorizer"
require "user.spectre"
require "user.zen-mode"
require "user.neoscroll"
require "user.todo-comments"
require "user.bookmark"
require "user.symbol-outline"
require "user.git-blame"
require "user.gist"
require "user.gitlinker"
require "user.notify"
require "user.ts-context"
require "user.registers"
require "user.sniprun"
require "user.functions"
require "user.illuminate"
require "user.dap"
require "user.lir"
require "user.cybu"
require "user.winbar"
require "user.options"
require "user.nvim-webdev-icons"
require "user.bfs"
require "user.crates"
require "user.dressing"
require "user.tabout"
require "user.fidget"
require "user.browse"
require "user.auto-session"
require "user.jaq"
require "user.surround"
require "user.harpoon"
require "user.lab"
require "user.vim-slash"
require "user.bufferline"
require "user.wilder"
require "user.move"


require("lspconfig")["pyright"].setup {
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
    sh = "bash",
    js = "node"

	},
})




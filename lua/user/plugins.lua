local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
---@diagnostic disable-next-line: missing-parameter
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  -- snapshot = "july-24",
  snapshot_path = fn.stdpath "config" .. "/snapshots",
  max_jobs = 50,
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
    prompt_border = "rounded", -- Border style of prompt popups.
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- Plugin Mangager
  use "wbthomason/packer.nvim" -- Have packer manage itself

  -- Lua Development
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "nvim-lua/popup.nvim"
  use "christianchiarulli/lua-dev.nvim"
  -- use "folke/lua-dev.nvim"

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  -- use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  use "ray-x/lsp_signature.nvim"
  use "SmiteshP/nvim-navic"
  use "simrat39/symbols-outline.nvim"
  use "b0o/SchemaStore.nvim"
  use "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim"

  --lsp_lines toogle

  -- use "github/copilot.vim"

  use "RRethy/vim-illuminate"
  use "j-hui/fidget.nvim"
  use "lvimuser/lsp-inlayhints.nvim"
  use "simrat39/inlay-hints.nvim"
  use "https://git.sr.ht/~whynothugo/lsp_lines.nvim"

  -- Completion
  use "christianchiarulli/nvim-cmp"
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use { "hrsh7th/cmp-nvim-lsp" }
  use "hrsh7th/cmp-emoji"
  use "hrsh7th/cmp-nvim-lua"
  use {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    config = function()
      vim.schedule(function()
        require("copilot").setup()
      end)
    end,
  }
  use {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
  }
  --tabnine
  use { "tzachar/cmp-tabnine", run = "./install.sh" }

  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- Syntax/Treesitter
  use "nvim-treesitter/nvim-treesitter"
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use "p00f/nvim-ts-rainbow"
  use "nvim-treesitter/playground"
  use "windwp/nvim-ts-autotag"
  use "nvim-treesitter/nvim-treesitter-textobjects"
  -- use "wellle/targets.vim"
  -- use "RRethy/nvim-treesitter-textsubjects"
  use "kylechui/nvim-surround"
  use {
    "abecodes/tabout.nvim",
    wants = { "nvim-treesitter" }, -- or require if not used so far
  }
  use { "m-demare/hlargs.nvim", require("hlargs").setup() }

  -- Marks
  use "christianchiarulli/harpoon"
  use "MattesGroeger/vim-bookmarks"

  -- Fuzzy Finder/Telescope
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-media-files.nvim"
  use "tom-anders/telescope-vim-bookmarks.nvim"

  -- Note Taking
  use "mickael-menu/zk-nvim"

  -- Color
  -- use "NvChad/nvim-colorizer.lua"
  -- use "ziontee113/color-picker.nvim"
  use {
    "max397574/colortils.nvim",
    cmd = "Colortils",
    config = function() end,
  }

  -- Colorschemes
  use "lunarvim/onedarker.nvim"
  use "lunarvim/darkplus.nvim"
  use "folke/tokyonight.nvim"
  -- use "lunarvim/colorschemes"

  -- Utility
  use "rcarriga/nvim-notify"
  use "stevearc/dressing.nvim"
  use "ghillb/cybu.nvim"
  use "moll/vim-bbye"
  use "lewis6991/impatient.nvim"
  use "lalitmee/browse.nvim"

  -- Icon
  use "kyazdani42/nvim-web-devicons"

  -- Debugging
  use "mfussenegger/nvim-dap"
  use "rcarriga/nvim-dap-ui"
  -- use "theHamsta/nvim-dap-virtual-text"
  -- use "Pocco81/DAPInstall.nvim"

  -- Tabline
  use "akinsho/bufferline.nvim"
  use "tiagovla/scope.nvim"

  -- Statusline
  use "christianchiarulli/lualine.nvim"

  -- Startup
  use "goolord/alpha-nvim"

  -- Indent
  use "lukas-reineke/indent-blankline.nvim"

  -- File Explorer
  use "kyazdani42/nvim-tree.lua"
  use "christianchiarulli/lir.nvim"

  -- Comment
  use "numToStr/Comment.nvim"
  use "folke/todo-comments.nvim"

  -- Terminal
  use "akinsho/toggleterm.nvim"

  -- Project
  use "ahmedkhalf/project.nvim"
  use "windwp/nvim-spectre"

  -- Session
  use "rmagatti/auto-session"
  use "rmagatti/session-lens"

  -- Quickfix
  use "kevinhwang91/nvim-bqf"

  -- Code Runner
  use "is0n/jaq-nvim"
  use {
    "0x100101/lab.nvim",
    run = "cd js && npm ci",
  }

  -- Git
  use "lewis6991/gitsigns.nvim"
  use "f-person/git-blame.nvim"
  use "ruifm/gitlinker.nvim"
  use "mattn/vim-gist"
  use "mattn/webapi-vim"

  -- Github
  use "pwntester/octo.nvim"

  -- Editing Support
  use "windwp/nvim-autopairs"
  use "monaqa/dial.nvim"
  use "nacro90/numb.nvim"
  use "andymass/vim-matchup"
  use "folke/zen-mode.nvim"
  -- use "Pocco81/true-zen.nvim"
  use "karb94/neoscroll.nvim"
  use "junegunn/vim-slash"

  -- Motion
  use "phaazon/hop.nvim"
  -- use "jinh0/eyeliner.nvim"

  -- Keybinding
  use "folke/which-key.nvim"

  -- Java
  use "mfussenegger/nvim-jdtls"

  -- Rust
  use { "christianchiarulli/rust-tools.nvim", branch = "modularize_and_inlay_rewrite" }
  use "Saecki/crates.nvim"

  -- Typescript TODO: set this up, also add keybinds to ftplugin
  use "jose-elias-alvarez/typescript.nvim"

  -- Markdown
  use {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = "markdown",
  }

  --auto save
  use {
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup {
        -- your config goes here
        -- or just leave it empty :)
      }
    end,
  }
  --command auto complete
  use {
    "gelguy/wilder.nvim",
    config = function()
      -- config goes here
    end,
  }

  --move lines
  use "fedepujol/move.nvim"

  --multi cursor
  use { "mg979/vim-visual-multi", branch = "master" }

  --code runner
  use { "CRAG666/code_runner.nvim", requires = "nvim-lua/plenary.nvim" }

  --live server
  --  use "manzeloth/live-server"

  --liveserver with live complete
  use { "turbio/bracey.vim", run = "npm install --prefix server" }

  --coloriger with rgb hexa
  use { "brenoprata10/nvim-highlight-colors" }

  -- better escaping
  use {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
  }

  -- Graveyard
  -- use "romgrk/nvim-treesitter-context"
  -- use "mizlan/iswap.nvim"
  -- use {'christianchiarulli/nvim-ts-rainbow'}
  -- use "nvim-telescope/telescope-ui-selectvvim"
  use "nvim-telescope/telescope-file-browser.nvim"
  -- use 'David-Kunz/cmp-npm' -- doesn't seem to work
  -- use { "christianchiarulli/JABS.nvim" }
  -- use "lunarvim/vim-solidity"
  -- use "tpope/vim-repeat"
  -- use "Shatur/neovim-session-manager"
  -- use "metakirby5/codi.vim"
  -- use { "nyngwang/NeoZoom.lua", branch = "neo-zoom-original" }
  -- use "rcarriga/cmp-dap"
  -- use "filipdutescu/renamer.nvim"
  -- use "https://github.com/rhysd/conflict-marker.vim"
  -- use "rebelot/kanagawa.nvim"
  -- use "unblevable/quick-scope"
  -- use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  -- use "gbprod/cutlass.nvim"
  --  use "christianchiarulli/lsp-inlay-hints"
  -- use "rmagatti/goto-preview
  -- use "stevearc/aerial.nvim"
  -- use "nvim-lua/lsp_extensions.nvim"
  -- use { "christianchiarulli/nvim-gps", branch = "text_hl" }
  -- use "stevearc/stickybuf.nvim"
  -- use "folke/trouble.nvim"
  -- use "drybalka/tree-climber.nvim"
  -- use "phaazon/hop.nvim"
  use { "michaelb/sniprun", run = "bash ./install.sh" }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

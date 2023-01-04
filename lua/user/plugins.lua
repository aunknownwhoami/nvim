local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  }
end

vim.opt.runtimepath:prepend(lazypath)

-- Install your plugins here
local plugins = {
  -- Plugin Mangager
  {
    "folke/lazy.nvim",
  }, -- Plugin Manager

  -- Lua Development
  { "nvim-lua/plenary.nvim" }, -- Useful lua functions used ny lots of plugins
  { "nvim-lua/popup.nvim" },
  { "christianchiarulli/lua-dev.nvim" },
  -- use "folke/lua-dev.nvim"

  -- LSP
  {
    "neovim/nvim-lspconfig", -- enable LSP
    -- use "williamboman/nvim-lsp-installer" -- simple to use language server installer
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "jose-elias-alvarez/null-ls.nvim", -- for formatters and linters
    {
      "ray-x/lsp_signature.nvim",
      config = function()
        require("lsp_signature").setup()
      end,
    },
  },
  {
    "SmiteshP/nvim-navic",
    "simrat39/symbols-outline.nvim",
    "b0o/SchemaStore.nvim",
    "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",
    "Maan2003/lsp_lines.nvim",
  },
  -- use "github/copilot.vim"

  {
    "RRethy/vim-illuminate",
    "j-hui/fidget.nvim",
    "lvimuser/lsp-inlayhints.nvim",
    "simrat39/inlay-hints.nvim",
    -- "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  },
  {
    -- Completion
    "hrsh7th/nvim-cmp", -- completion
    -- use "christianchiarulli/nvim-cmp"
    "hrsh7th/cmp-buffer", -- buffer completions
    "hrsh7th/cmp-path", -- path completions
    "hrsh7th/cmp-cmdline", -- cmdline completions
    "saadparwaiz1/cmp_luasnip", -- snippet completions
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-emoji",
    "hrsh7th/cmp-nvim-lua",
    -- use "hrsh7th/cmp-copilot"
  },
  --github copilot lua
  {
    "zbirenbaum/copilot.lua",
    event = { "VimEnter" },
    config = function()
      vim.defer_fn(function()
        require "user.copilot"
      end, 100)
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },
  --tabnine
  { "tzachar/cmp-tabnine", build = "./install.sh" },
  {
    "L3MON4D3/LuaSnip", --snippet engine
    "rafamadriz/friendly-snippets", -- a bunch of snippets to use
  },
  {
    -- Syntax/Treesitter
    "nvim-treesitter/nvim-treesitter",
    "JoosepAlviste/nvim-ts-context-commentstring",
    "p00f/nvim-ts-rainbow",
    "nvim-treesitter/playground",
    "windwp/nvim-ts-autotag",
    "nvim-treesitter/nvim-treesitter-textobjects",
    -- use "wellle/targets.vim"
    -- use "RRethy/nvim-treesitter-textsubjects"
    "kylechui/nvim-surround",
    {
      "abecodes/tabout.nvim",
      wants = { "nvim-treesitter" }, -- or require if not used so far
    },
  },
  {
    -- Marks
    "christianchiarulli/harpoon",
    "MattesGroeger/vim-bookmarks",
    -- Fuzzy Finder/Telescope
    "nvim-telescope/telescope.nvim",
    "nvim-telescope/telescope-media-files.nvim",
    "tom-anders/telescope-vim-bookmarks.nvim",
    -- Note Taking
    "mickael-menu/zk-nvim",
    -- Color
    -- use "NvChad/nvim-colorizer.lua"
    "uga-rosa/ccc.nvim",
    "brenoprata10/nvim-highlight-colors",
    -- Colorschemes
    "lunarvim/onedarker.nvim",
    "lunarvim/darkplus.nvim",
    "folke/tokyonight.nvim",
    "ellisonleao/gruvbox.nvim",
    -- use "lunarvim/colorschemes"
    -- Utility
    "rcarriga/nvim-notify",
    "stevearc/dressing.nvim",
    "ghillb/cybu.nvim",
    "moll/vim-bbye",
    "lewis6991/impatient.nvim",
    "lalitmee/browse.nvim",
    -- Icon
    "kyazdani42/nvim-web-devicons",
  },
  {
    -- Debugging
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
    "mfussenegger/nvim-dap-python",
    "theHamsta/nvim-dap-virtual-text",
    -- use "Pocco81/DAPInstall.nvim"

    -- Tabline
    "akinsho/bufferline.nvim",
    "tiagovla/scope.nvim",

    -- Statusline
    "christianchiarulli/lualine.nvim",

    -- Startup
    "goolord/alpha-nvim",

    -- Indent
    "lukas-reineke/indent-blankline.nvim",

    -- File Explorer
    "kyazdani42/nvim-tree.lua",
    "christianchiarulli/lir.nvim",

    -- Comment
    "numToStr/Comment.nvim",
    "folke/todo-comments.nvim",

    -- Terminal
    "akinsho/toggleterm.nvim",

    -- Project
    "ahmedkhalf/project.nvim",
    "windwp/nvim-spectre",
  },
  {
    -- Session
    "rmagatti/auto-session",
    "rmagatti/session-lens",

    -- Quickfix
    "kevinhwang91/nvim-bqf",

    -- Code Runner
    "is0n/jaq-nvim",
  },
  {
    "0x100101/lab.nvim",
    build = "cd js && npm ci",
  },
  {
    -- Git
    "lewis6991/gitsigns.nvim",
    "f-person/git-blame.nvim",
    "ruifm/gitlinker.nvim",
    "mattn/vim-gist",
    "mattn/webapi-vim",

    -- Github
    "pwntester/octo.nvim",

    -- Editing Support
    "windwp/nvim-autopairs",
    "monaqa/dial.nvim",
    "nacro90/numb.nvim",
    "andymass/vim-matchup",
    "folke/zen-mode.nvim",
    -- use "Pocco81/true-zen.nvim"
    "karb94/neoscroll.nvim",
    "junegunn/vim-slash",

    -- Motion
    "phaazon/hop.nvim",
    -- use "jinh0/eyeliner.nvim"

    -- Keybinding
    "folke/which-key.nvim",

    -- Java
    "mfussenegger/nvim-jdtls",
  },
  -- Rust
  { "christianchiarulli/rust-tools.nvim", branch = "modularize_and_inlay_rewrite" },
  { "Saecki/crates.nvim" },

  -- Typescript TODO: set this up, also add keybinds to ftplugin
  { "jose-elias-alvarez/typescript.nvim" },

  -- Markdown
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = "markdown",
  },
  --auto save
  {
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup {
        -- your config goes here
        -- or just leave it empty :)
      }
    end,
  },
  --move lines
  { "fedepujol/move.nvim" },

  --multi cursor
  { "mg979/vim-visual-multi", branch = "master" },

  --live server
  { "manzeloth/live-server" },

  --liveserver with live complete
  { "turbio/bracey.vim", build = "npm install --prefix server" },

  -- better escaping
  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
  },
  { "ThePrimeagen/vim-be-good" },
  {
    "jackMort/ChatGPT.nvim",
    config = function()
      require("chatgpt").setup {}
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
  },
  --commadline
  {
    "gelguy/wilder.nvim",
    config = function()
      require("wilder").setup()
      -- config goes here
    end,
  },
  { "mattn/emmet-vim" },
  -- Graveyard
  -- use "romgrk/nvim-treesitter-context"
  -- use "mizlan/iswap.nvim"
  -- use {'christianchiarulli/nvim-ts-rainbow'}
  -- use "nvim-telescope/telescope-ui-selectvvim"
  { "nvim-telescope/telescope-file-browser.nvim" },
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
  { "michaelb/sniprun", build = "bash ./install.sh" },
}

local opts = {
  git = {
    -- defaults for the `Lazy log` command
    -- log = { "-10" }, -- show the last 10 commits
    log = { "--since=3 days ago" }, -- show commits from the last 3 days
    timeout = 300, -- kill processes that take more than 2 minutes
    url_format = "https://github.com/%s.git",
  },
  lockfile = vim.fn.stdpath "data" .. "/lazy-lock.json", -- lockfile generated after running update.
  concurrency = nil, ---@type number limit the maximum amount of concurrent tasks
  dev = {
    -- directory where you store your local plugin projects
    path = "~/projects",
    ---@type string[] plugins that match these patterns will use your local versions instead of being fetched from GitHub
    patterns = {}, -- For example {"folke"}
  },
  install = {
    -- install missing plugins on startup. This doesn't increase startup time.
    missing = true,
    -- try to load one of these colorschemes when starting an installation during startup
    colorscheme = { "tokyonight-night" },
  },
  ui = {
    -- a number <1 is a percentage., >1 is a fixed size
    size = { width = 0.8, height = 0.8 },
    -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
    border = "rounded",
    icons = {
      cmd = " ",
      config = "",
      event = "",
      ft = " ",
      init = " ",
      keys = " ",
      plugin = " ",
      runtime = " ",
      source = " ",
      start = "",
      task = "✔ ",
    },
    throttle = 20, -- how frequently should the ui process render events
    custom_keys = {},
    diff = {
      -- diff command <d> can be one of:
      -- * browser: opens the github compare view. Note that this is always mapped to <K> as well,
      --   so you can have a different command for diff <d>
      -- * git: will run git diff and open a buffer with filetype git
      -- * terminal_git: will open a pseudo terminal with git diff
      -- * diffview.nvim: will open Diffview to show the diff
      cmd = "git",
    },
  },

  checker = {
    -- automatically check for plugin updates
    enabled = false,
    concurrency = nil, ---@type number? set to 1 to check for updates very slowly
    notify = true, -- get a notification when new updates are found
    frequency = 3600, -- check for updates every hour
  },
  change_detection = {
    -- automatically check for config file changes and reload the ui
    enabled = true,
    notify = true, -- get a notification when changes are found
  },
  -- lazy can generate helptags from the headings in markdown readme files,
  -- so :help works even for plugins that don't have vim docs.
  -- when the readme opens with :help it will be correctly displayed as markdown
  performance = {
    cache = {
      enabled = true,
      path = vim.fn.stdpath "state" .. "/lazy/cache",
      -- Once one of the following events triggers, caching will be disabled.
      -- To cache all modules, set this to `{}`, but that is not recommended.
      -- The default is to disable on:
      --  * VimEnter: not useful to cache anything else beyond startup
      --  * BufReadPre: this will be triggered early when opening a file from the command line directly
      disable_events = { "VimEnter", "BufReadPre" },
    },
    reset_packpath = true, -- reset the package path to improve startup time
    rtp = {
      reset = false, -- reset the runtime path to $VIMRUNTIME and your config directory
      ---@type string[] list any plugins you want to disable here
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  readme = {
    root = vim.fn.stdpath "state" .. "/lazy/readme",
    files = { "README.md" },
    -- only generate markdown helptags for plugins that dont have docs
    skip_if_doc_exists = true,
  },
}

local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
  return
end

lazy.setup(plugins, opts)

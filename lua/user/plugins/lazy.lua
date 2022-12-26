local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if vim.fn.isdirectory(lazypath) == 0 then
  print "Installing plugins\n\nClose and reopen neovim when it's done..."
  vim.fn.system {
    "git",
    "clone",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  }
end

vim.opt.runtimepath:prepend(lazypath)

local plugins = {
  {
    "folke/lazy.nvim",
  }, -- Plugin Manager

  {
    "nvim-lua/plenary.nvim",
    module = true,
  }, -- Lua Functions

  {
    "numToStr/Comment.nvim",
    event = "BufRead",
    config = function()
      require "user.plugins.comment"
    end,
  }, -- Commenting

  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require "user.plugins.icons"
    end,
  }, -- Icons and Glyphs

  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require "user.plugins.nvim-tree"
    end,
  }, -- File Explorer

  {
    "akinsho/bufferline.nvim",
    event = "BufRead", -- remove this if there's an issue.
    config = function()
      require "user.plugins.bufferline"
    end,
  }, -- Tabline

  {
    "moll/vim-bbye",
  }, -- Delete Buffer

  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require "user.plugins.lualine"
    end,
  }, -- Statusline

  {
    "goolord/alpha-nvim",
    config = function()
      require "user.plugins.alpha"
    end,
  }, -- Start Screen

  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require "user.plugins.colorizer"
    end,
  }, -- Preview Colors

  {
    "akinsho/toggleterm.nvim",
    config = function()
      require "user.plugins.toggleterm"
    end,
  }, -- Terminal

  {
    "is0n/jaq-nvim",
    cmd = { "Jaq", "Jaq terminal", "Jaq float", "Jaq bang", "Jaq quickfix", "Jaq internal" },
    keys = "<F5>",
    config = function()
      require "user.plugins.jaq"
    end,
  }, -- Code Runner

  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "hrsh7th/cmp-buffer", -- Buffer Completions
      "hrsh7th/cmp-path", -- Path Completions
      "saadparwaiz1/cmp_luasnip", -- Snippet Completions
      "hrsh7th/cmp-nvim-lsp", -- LSP Completions
      "hrsh7th/cmp-nvim-lua", -- Lua Completions
      "hrsh7th/cmp-cmdline", -- CommandLine Completions
      "L3MON4D3/LuaSnip", -- Snippet Engine
      "rafamadriz/friendly-snippets", -- Bunch of Snippets
      {
        "windwp/nvim-autopairs",
        config = function()
          require "user.plugins.autopairs" -- Auto Pairs
        end,
      },
    },
    config = function()
      require "user.plugins.cmp"
    end,
  }, -- Completion Engine

  {
    "neovim/nvim-lspconfig",
    event = "BufRead",
    config = function()
      require "user.plugins.lsp.mason"
      require("user.plugins.lsp.handlers").setup()
    end,
  }, -- Built-in LSP

  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require "user.plugins.lsp.null-ls"
    end,
  }, -- Formatters and Linters

  {
    "glepnir/lspsaga.nvim",
    config = function()
      require "user.plugins.lsp.lspsaga"
    end,
  }, -- LSP UI

  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
    module = true,
  }, -- Package Manager

  {
    "williamboman/mason-lspconfig.nvim",
    module = true,
  }, -- Extension of mason.nvim

  {
    "nvim-telescope/telescope.nvim",
    module = true,
    cmd = "Telescope",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = ":make",
      }, -- FZF sorter for telescope written in c
    },
    config = function()
      require "user.plugins.telescope"
    end,
  }, -- Fuzzy Finder

  {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    config = function()
      require "user.plugins.gitsigns"
    end,
  }, -- Git Integration

  {
    "folke/which-key.nvim",
    module = true,
    cmd = "WhichKey",
    keys = "<leader>",
    config = function()
      require "user.plugins.which-key"
    end,
  }, -- Keymaps Popup

  {
    "nvim-treesitter/nvim-treesitter",
    module = true,
    event = "BufRead",
    cmd = {
      "TSInstall",
      "TSInstallInfo",
      "TSUpdate",
      "TSBufEnable",
      "TSBufDisable",
      "TSEnable",
      "TSDisable",
      "TSModuleInfo",
    },
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring", -- Smart Commenting
      {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
          require "user.plugins.indent-blankline"
        end,
      }, -- Indentline
    },
    build = ":TSUpdate",
    config = function()
      require "user.plugins.treesitter"
    end,
  }, -- Syntax Highlighting

  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    ft = "markdown",
  }, -- Markdown Previewer

  {
    "dstein64/vim-startuptime",
    init = function()
      vim.g.startuptime_tries = 10
    end,
    cmd = "StartupTime",
  }, -- Measure Startup Time
  {
    "zbirenbaum/copilot.lua",
    event = { "VimEnter" },
    config = function()
      vim.defer_fn(function()
        require "user.plugins.copilot"
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
  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup {
      }
    end,
  },
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
    colorscheme = { "dull" },
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

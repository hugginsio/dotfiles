-- plugins for lazy
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      vim.cmd("colorscheme catppuccin-mocha")
    end
  },
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    tag = "0.1.0",
    dependencies = "nvim-lua/plenary.nvim"
  },
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufReadPost",
    build = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true})
      ts_update()
    end,
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "org" }
      })
    end
  },
  {
    "VonHeikemen/lsp-zero.nvim",
    event = "BufReadPre",
    dependencies = {
      -- LSP Support
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",

      -- Autocompletion
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",

      -- Snippets
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    }
  },
  {
    "m4xshen/autoclose.nvim",
    event = "InsertEnter",
    config = function()
      require("autoclose").setup({})
    end
  },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end
  },
  {
    "nvim-orgmode/orgmode",
    event = "BufReadPre",
    config = function()
      require("orgmode").setup()
      require("orgmode").setup_ts_grammar()
    end
  },
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    cmds = { "TodoTrouble", "TodoTelescope" },
    config = function()
      require("todo-comments").setup()
    end
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("which-key").setup()
    end
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    config = function()
      require("gitsigns").setup()
    end
  },
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    dependencies = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup()
    end
  },
  {
    "mbbill/undotree",
    cmd = { "UndotreeToggle" }
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = "kyazdani42/nvim-web-devicons",
    event = "VeryLazy",
    config = function()
      require("lualine").setup({
        options = {
          globalstatus = true
        }
      })
    end
  }
}

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
    event = "VeryLazy",
    tag = "0.1.0",
    dependencies = {
      "nvim-lua/plenary.nvim"
    }
  },
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufReadPre",
    build = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true})
      ts_update()
    end,
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua" }
      })
    end
  },
  {
    "VonHeikemen/lsp-zero.nvim",
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
    event = "BufReadPre"
    config = function()
      require("orgmode").setup()
    end
  },
  {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    event = "BufReadPre",
    config = function()
      require("todo-comments").setup()
    end
  }
}

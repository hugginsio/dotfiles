-- plugins for lazy
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      vim.cmd("colorscheme catppuccin-mocha")
    end,
    lazy = false,
    priority = 1000,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    tag = "0.1.0",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true})
      ts_update()
    end,
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "org" }
      })
    end,
    event = "BufReadPost",
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
    },
    event = "BufReadPre",
  },
  {
    "m4xshen/autoclose.nvim",
    config = function()
      require("autoclose").setup({})
    end,
    event = "InsertEnter",
  },
  {
    "kylechui/nvim-surround",
    config = true,
  },
  {
    "nvim-orgmode/orgmode",
    config = function()
      require("orgmode").setup()
      require("orgmode").setup_ts_grammar()
    end,
    event = "BufReadPre",
  },
  {
    "folke/todo-comments.nvim",
    config = true,
    dependencies = "nvim-lua/plenary.nvim",
  },
  {
    "folke/which-key.nvim",
    config = true,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = true,
    event = "BufReadPre",
  },
  {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup()
    end,
    dependencies = "nvim-tree/nvim-web-devicons",
  },
  {
    "mbbill/undotree",
    cmd = { "UndotreeToggle" }
  },
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        options = {
          globalstatus = true,
          section_separators = "",
          component_separators = ""
        }
      })
    end,
    dependencies = "nvim-tree/nvim-web-devicons",
    lazy = false,
  },
  {
    "nvim-tree/nvim-tree.lua",
    config = true,
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
  },
  {
    "ellisonleao/glow.nvim",
    config = true,
    cmd = "Glow"
  },
  {
    "AckslD/nvim-neoclip.lua",
    config = function()
      require("neoclip").setup()
      require("telescope").load_extension("neoclip")
    end,
    dependencies = {
      "nvim-telescope/telescope.nvim"
    },
  }
}

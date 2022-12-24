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
    config = true
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
    config = true
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = true
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    config = true
  },
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    dependencies = "nvim-tree/nvim-web-devicons",
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
    config = function()
      require("lualine").setup({
        options = {
          globalstatus = true
        }
      })
    end,
    dependencies = "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
  },
  {
    "nvim-tree/nvim-tree.lua",
    config = true,
    cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeFindFile" },
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
    event = "VeryLazy"
  }
}

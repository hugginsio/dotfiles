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
    event = "VeryLazy",
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
        ensure_installed = { "json", "lua", "org", "markdown"}
      })
    end,
    event = "BufReadPost",
  },
  {
    "kylechui/nvim-surround",
    config = true,
    event = "BufReadPost",
  },
  {
    "nvim-orgmode/orgmode",
    config = function()
      require("orgmode").setup({
        org_agenda_files = "$HOME/OneDrive - J.B. Hunt Transport/Documents/org/**/*",
        calendar_week_start_day = 0,
        org_deadline_warning_days = 0,
      })
      require("orgmode").setup_ts_grammar()
    end,
    event = "VeryLazy",
    ft = "org",
  },
  {
    "folke/todo-comments.nvim",
    config = true,
    dependencies = "nvim-lua/plenary.nvim",
    event = "VeryLazy",
  },
  {
    "folke/which-key.nvim",
    config = true,
    event = "VeryLazy",
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
    event = "BufReadPost",
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
    event = "VeryLazy",
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
    event = "VeryLazy",
  },
  {
    "goolord/alpha-nvim",
    config = function()
      require("alpha").setup(require("alpha.themes.startify").config)
    end,
    dependencies = {
      "nvim-telescope/telescope.nvim"
    },
  },
  {
    "jghauser/mkdir.nvim"
  }
}
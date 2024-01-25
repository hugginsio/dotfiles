-- https://www.lunarvim.org/

-- Source existing vim configuration (https://neovim.io/doc/user/nvim.html#nvim-from-vim)
vim.cmd('source ~/.vim/vimrc')

-- Disable built-in plugins
lvim.builtin.alpha.active = false
lvim.builtin.lir.active = false

-- lualine
lvim.builtin.lualine.style = "lvim"

-- telescope
lvim.builtin.telescope.theme = "dropdown"

-- which-key particulars
vim.o.timeout = true
vim.o.timeoutlen = 250

lvim.builtin.which_key.setup.plugins.marks = true
lvim.builtin.which_key.setup.plugins.presets.g = true
lvim.builtin.which_key.setup.plugins.presets.motions = true
lvim.builtin.which_key.setup.plugins.presets.nav = true
lvim.builtin.which_key.setup.plugins.presets.operators = true
lvim.builtin.which_key.setup.plugins.presets.text_objects = true
lvim.builtin.which_key.setup.plugins.presets.windows = true
lvim.builtin.which_key.setup.plugins.presets.z = true
lvim.builtin.which_key.setup.plugins.registers = true


-- Modify built-in keymaps
lvim.builtin.which_key.mappings[";"] = {}
lvim.builtin.which_key.mappings["q"] = { "<cmd>confirm q<CR>", "Quit Window" }
lvim.builtin.which_key.mappings["s"]["p"] = {}
lvim.builtin.which_key.mappings["o"] = { desc = "+Open" }
lvim.builtin.which_key.mappings["z"] = { desc = "+Zettelkasten" }

-- Add new keymaps
lvim.builtin.which_key.mappings[","] = { "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", "Search buffers" }

-- User plugins
lvim.plugins = {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 100,
  },
  {
    "tpope/vim-characterize",
    build = ":helptags ~/.vim/pack/hugginsio/start/characterize",
    dir = "~/.vim/pack/hugginsio/start/characterize",
    event = "VeryLazy",
  },
  {
    "tpope/vim-dotenv",
    build = ":helptags ~/.vim/pack/hugginsio/start/dotenv",
    dir = "~/.vim/pack/hugginsio/start/dotenv",
    event = "VeryLazy",
  },
  {
    "tpope/vim-eunuch",
    build = ":helptags ~/.vim/pack/hugginsio/start/eunuch",
    dir = "~/.vim/pack/hugginsio/start/eunuch",
    event = "VeryLazy",
  },
  {
    "tpope/vim-fugitive",
    build = ":helptags ~/.vim/pack/hugginsio/start/fugitive",
    dir = "~/.vim/pack/hugginsio/start/fugitive",
    event = "VeryLazy",
  },
  {
    "tpope/vim-sensible",
    build = ":helptags ~/.vim/pack/hugginsio/start/sensible",
    dir = "~/.vim/pack/hugginsio/start/sensible",
    event = "VeryLazy",
  },
  {
    "tpope/vim-speeddating",
    build = ":helptags ~/.vim/pack/hugginsio/start/speeddating",
    dir = "~/.vim/pack/hugginsio/start/speeddating",
    event = "VeryLazy",
  },
  {
    "tpope/vim-surround",
    build = ":helptags ~/.vim/pack/hugginsio/start/surround",
    dir = "~/.vim/pack/hugginsio/start/surround",
    event = "VeryLazy",
    keys = {
      { "S",   desc = "Surround",                           mode = "v" },
      { "cS",  desc = "Change surround on own line" },
      { "cs",  desc = "Change surround" },
      { "ds",  desc = "Delete surround" },
      { "yS",  desc = "You surround on own line" },
      { "ySS", desc = "You surround on own line and indent" },
      { "ys",  desc = "You surround" },
      { "yss", desc = "You surround on current line" },
    }
  },
  {
    "ellisonleao/glow.nvim",
    cmd = "Glow",
    opts = { border = "single" },
    keys = {
      { "<leader>og", "<cmd>Glow<CR>", desc = "Glow" },
    },
  },
  {
    "folke/flash.nvim",
    opts = {
      modes = {
        search = {
          enabled = false,
        },
      },
    },
  },
  {
    "fladson/vim-kitty",
    ft = "kitty",
  },
  {
    "hugginsio/twig.nvim",
    event = "VeryLazy",
    ft = "markdown",
    opts = {
      project_pattern = "[0-9]+",
    },
  },
  {
    "luizribeiro/vim-cooklang",
    ft = "cook",
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = {
      "MarkdownPreview",
      "MarkdownPreviewStop",
      "MarkdownPreviewToggle",
    },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    keys = {
      { "<leader>oG", "<cmd>MarkdownPreview<CR>", desc = "Markdown preview (browser)" },
    },
  },
  {
    "mickael-menu/zk-nvim",
    config = function(opts)
      require("zk").setup(opts)
      require("telescope").load_extension("zk")
    end,
    event = "VeryLazy",
    ft = { "markdn", "markdown", "md", "mdown" },
    keys = {
      { "<leader>zb", "<cmd>ZkBacklinks<CR>",        desc = "Open backlinks picker" },
      { "<leader>zl", "<cmd>ZkLinks<CR>",            desc = "Open outbound links picker" },
      { "<leader>zo", "<cmd>Telescope zk notes<CR>", desc = "Open notes picker" },
      { "<leader>zt", "<cmd>Telescope zk tags<CR>",  desc = "Open notes picker, filtered by tags" },
    },
    opts = {
      picker = "telescope",
      lsp = {
        config = { cmd = { "zk", "lsp" }, name = "zk" },
        auto_attach = { enabled = true, filetypes = { "markdn", "markdown", "md", "mdown" } },
      },
    },
  },
  {
    -- FIX: this does not work with my gtask binary
    "stevearc/overseer.nvim",
    opts = {},
    keys = {
      { "<leader>oo", "<cmd>OverseerRun<CR>",    desc = "Overseer (run)" },
      { "<leader>oO", "<cmd>OverseerToggle<CR>", desc = "Overseer (task history)" },
    },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {}
  }
}

-- Misc.
lvim.builtin.cmp.completion.keyword_length = 2
lvim.colorscheme = "catppuccin-mocha"

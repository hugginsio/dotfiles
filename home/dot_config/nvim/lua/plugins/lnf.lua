return {
  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "catppuccin-mocha"
    end
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      spec = {
        {
          mode = { "n", "x" },
          { "<leader>f", group = "file/find" },
          { "<leader>u", group = "ui" },
        }
      },
    }
  }
}

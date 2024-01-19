return {
        {
                "catppuccin/nvim",
                config = function()
                        vim.cmd("colorscheme catppuccin-mocha")
                end,
                name = "catppuccin",
                priority = 100,
        },
        {
                "folke/which-key.nvim",
                opts = {},
        },
}

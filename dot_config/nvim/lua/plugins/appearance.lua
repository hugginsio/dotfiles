return {
    {
        "catppuccin/nvim",
        config = function()
            vim.cmd("colorscheme catppuccin-mocha")
        end,
        lazy = false,
        priority = 1000,
    },
    {
        "itchyny/lightline.vim",
        dir = "~/.vim/pack/hugginsio/start/lightline",
        config = function()
            vim.cmd([[
                let g:lightline = {'colorscheme': 'catppuccin'}
            ]])
        end,
        lazy = false,
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        event = "VeryLazy",
        tag = "0.1.1",
    },
    {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup()
        end,
        event = "VeryLazy",
    },
}

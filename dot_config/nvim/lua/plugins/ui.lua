return {
    {
        "catppuccin/nvim",
        config = function()
            vim.cmd("colorscheme catppuccin-mocha")
        end,
        lazy = false,
        name = "catppuccin",
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
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            plugins = { spelling = true },
        },
        config = function()
            local wk = require("which-key") wk.setup({})

            local keymaps = {
                mode = { "n", "v" },
                ["<leader><Tab>"] = { name = "+tabs" },
                ["<leader>b"] = { name = "+buffers" },
                ["<leader>c"] = { name = "+code" },
                ["<leader>f"] = { name = "+file/find" },
                ["<leader>g"] = { name = "+git" },
                ["<leader>h"] = { name = "+help" },
                ["<leader>s"] = { name = "+search" },
                ["<leader>t"] = { name = "+toggle" },
                ["["] = { name = "+prev" },
                ["]"] = { name = "+next" },
                ["g"] = { name = "+goto" },
            }

            wk.register(keymaps)
        end,
    },
}

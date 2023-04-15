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
}

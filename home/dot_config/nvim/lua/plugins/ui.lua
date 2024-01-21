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
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 250
        end,
        opts = {
            plugins = { spelling = true },
            defaults = {
                ["<leader><tab>"] = { name = "+tabs" },
                ["<leader>b"] = { name = "+buffer" },
                ["<leader>c"] = { name = "+code" },
                ["<leader>f"] = { name = "+file" },
                ["<leader>g"] = { name = "+git" },
                ["<leader>gh"] = { name = "+hunks" },
                ["<leader>q"] = { name = "+quit" },
                ["<leader>s"] = { name = "+search" },
                ["<leader>t"] = { name = "+terminal" },
                ["<leader>u"] = { name = "+ui" },
                ["<leader>w"] = { name = "+windows" },
                ["<leader>x"] = { name = "+diagnostics/quickfix" },
                ["["] = { name = "+prev" },
                ["]"] = { name = "+next" },
                ["g"] = { name = "+goto" },
                ["gs"] = { name = "+surround" },
                ["z"] = { name = "+folds/spelling" },
                mode = { "n", "v" },
            },
        },
        config = function(_, opts)
            local wk = require("which-key")
            wk.setup(opts)
            wk.register(opts.defaults)
        end,
    },
    {
        "stevearc/oil.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        event = "VeryLazy",
        opts = {
            view_options = {
                show_hidden = true,
                is_always_hidden = function(name, bufnr)
                    local always = {
                        ".DS_Store",
                    }

                    return vim.tbl_contains(always, name)
                end,
            },
            float = {
                border = "single",
            },
            preview = {
                border = "single",
            },
            progress = {
                border = "single",
            },
        },
        keys = {
            { "-", "<cmd>Oil --float<CR>", desc = "Open parent directory" },
            { "<leader>e", "<cmd>Oil<CR>", desc = "Open parent directory" },
        },
    },
}

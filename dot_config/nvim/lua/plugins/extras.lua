return {
    {
        "tpope/vim-eunuch",
        dir = "~/.vim/pack/hugginsio/start/eunuch",
        event = "VeryLazy",
    },
    {
        "tpope/vim-speeddating",
        event = "VeryLazy",
    },
    {
        "mattn/calendar-vim",
        init = function()
            vim.cmd([[
                    let g:calendar_no_mappings=0
                    let g:calendar_diary="~/Workspaces/Vault/Daily"
                ]])
        end,
        cmd = { "Calendar", "CalendarH", "CalendarT", "CalendarVR", "CalendarSearch" },
        keys = {
            { "<leader>oc", "<cmd>CalendarH<CR>", desc = "Open calendar" },
            { "<leader>oC", "<cmd>CalendarT<CR>", desc = "Open calendar (full screen)" },
        },
    },
    {
        "hugginsio/twig.nvim",
        event = "VeryLazy",
        opts = {
            project_pattern = "-(.*)",
        },
    },
    {
        "mickael-menu/zk-nvim",
        config = function(opts)
            require("zk").setup(opts)
        end,
        event = "VeryLazy",
        ft = { "markdn", "markdown", "md", "mdown" },
        opts = {
            picker = "telescope",
            lsp = {
                config = {
                    cmd = { "zk", "lsp" },
                    name = "zk",
                },
                auto_attach = {
                    enabled = true,
                    filetypes = { "markdn", "markdown", "md", "mdown" },
                },
            },
        },
    },
}

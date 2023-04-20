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
            { "<leader>wc", "<cmd>CalendarH<CR>", desc = "Open calendar" },
            { "<leader>wC", "<cmd>CalendarT<CR>", desc = "Open calendar (full screen)" },
        },
    },
}

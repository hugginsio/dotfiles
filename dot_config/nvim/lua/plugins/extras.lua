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
                let g:calendar_diary="~/Workspaces/Vimwiki/diary"
                ]])
        end,
        cmd = { "Calendar", "CalendarH", "CalendarT", "CalendarVR", "CalendarSearch" },
        keys = {
            { "<leader>oc", "<cmd>CalendarH<CR>", desc = "Open calendar" },
            { "<leader>oC", "<cmd>CalendarT<CR>", desc = "Open calendar (full screen)" },
        },
    },
    {
        "lervag/wiki.vim",
        event = "VimEnter",
        ft = "wiki",
        init = function()
            vim.cmd([[
            let g:wiki_root = "~/Workspaces/Vimwiki/"
            ]])
        end,
        keys = {
            { "<leader>ww", "<cmd>WikiIndex<CR>", desc = "<Plug>(wiki-index)" },
            { "<leader>wn", "<cmd>WikiOpen<CR>", desc = "<Plug>(wiki-open)" },
            { "<leader>w<leader>w", "<cmd>WikiJournal<CR>", desc = "<Plug>(wiki-journal)" },
            { "<leader>x", "<cmd>WikiReload<CR>", desc = "<Plug>(wiki-reload)" },
        },
    },
}

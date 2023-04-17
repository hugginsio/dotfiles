return {
    {
        "vimwiki/vimwiki",
        event = "BufReadPre",
        init = function()
            vim.cmd([[
                let wiki={}
                let wiki.auto_generate_links=1
                let wiki.auto_tags=1
                let wiki.bullet_types=["-"]
                let wiki.ext=".wiki"
                let wiki.path="~/Workspaces/Vimwiki"
                let wiki.path_html="~/Workspaces/Vimwiki/html"
                let wiki.syntax="markdown"

                let g:vimwiki_list=[wiki]

                let g:vimwiki_auto_header=1
                let g:vimwiki_dir_link="index"
                let g:vimwiki_global_ext=0
                let g:vimwiki_listsyms=" OX"
                let g:vimwiki_use_calendar=1

                command! Diary VimwikiDiaryIndex
                augroup vimwikigroup
                    autocmd!
                    " automatically update links when diary page opened
                    autocmd BufRead,BufNewFile diary.wiki VimwikiDiaryGenerateLinks
                augroup end
            ]])
        end,
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
}

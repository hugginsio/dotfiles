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
        "epwalsh/obsidian.nvim",
        config = true,
        cmd = {
            "ObsidianBacklinks",
            "ObsidianFollowLink",
            "ObsidianLink",
            "ObsidianLinkNew",
            "ObsidianNew",
            "ObsidianOpen",
            "ObsidianQuickSwitch",
            "ObsidianSearch",
            "ObsidianTemplate",
            "ObsidianToday",
            "ObsidianYesterday",
        },
        keys = {
            { "<leader>oN", "<cmd>ObsidianTemplate<CR>", desc = "Create new note from template" },
            { "<leader>oO", "<cmd>ObsidianSearch<CR>", desc = "Open note (grep)" },
            { "<leader>on", ":ObsidianNew<Space>", desc = "Create new note" },
            { "<leader>oo", "<cmd>ObsidianQuickSwitch<CR>", desc = "Open note (title)" },
            { "<leader>ot", "<cmd>ObsidianToday<CR>", desc = "Open today's daily note" },
            { "<leader>sv", "<cmd>ObsidianSearch<CR>", desc = "Obsidian Vault" },
        },
        opts = {
            completion = {
                nvim_cmp = true,
            },
            daily_notes = {
                folder = "Daily",
            },
            dir = "~/Workspaces/Vault/",
            templates = {
                subdir = "templates",
                date_format = "%Y-%m-%d",
                time_format = "%H:%M",
            },
            note_id_func = function(title)
                -- Note IDs are title (or timestamp) + four random letters.
                local suffix = ""
                local id = ""

                for i = 1, 4 do
                    id = id .. string.char(math.random(65 + i, 95 - i)):lower()
                end

                if title ~= nil then
                    -- If title is given, transform it into valid file name.
                    suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
                else
                    -- If title is nil, use the current time
                    suffix = tostring(os.time())
                end

                return suffix .. "-" .. id
            end,
            notes_subdir = "Notes",
        },
    },
}

return {
    {
        "folke/flash.nvim",
        opts = {
            modes = {
                search = {
                    -- Disable flash by default in regular searches. It can still be activated
                    -- with <c-s> while the search is open.
                    enabled = false,
                },
            },
        },
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        opts = {
            filesystem = {
                bind_to_cwd = false,
                follow_current_file = { enabled = true },
            },
            window = {
                width = 30,
                mappings = {
                    ["<space>"] = "none",
                },
            },
            popup_border_style = "single",
            default_component_configs = {
                indent = {
                    with_expanders = true,
                },
                git_status = {
                    symbols = {
                        modified = "!",
                        deleted = "✖",
                        renamed = "»",
                        untracked = "?",
                        conflict = "=",
                    },
                },
            },
        },
    },
}

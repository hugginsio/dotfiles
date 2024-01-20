local Util = require("util")

return {
    {
        "echasnovski/mini.ai",
        event = "VeryLazy",
        opts = {},
        version = '*',
    },
    {
        "echasnovski/mini.bufremove",
        event = "VeryLazy",
        opts = {},
        version = '*',
        keys = {
            {
                "<leader>bd",
                function()
                    local bd = require("mini.bufremove").delete
                    if vim.bo.modified then
                        local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
                        if choice == 1 then -- Yes
                            vim.cmd.write()
                            bd(0)
                        elseif choice == 2 then -- No
                            bd(0, true)
                        end
                    else
                        bd(0)
                    end
                end,
                desc = "Delete Buffer",
            },
            { "<leader>bD", function() require("mini.bufremove").delete(0, true) end, desc = "Delete Buffer (Force)" },
        },
    },
    {
        "echasnovski/mini.comment",
        event = "VeryLazy",
        opts = {},
        version = '*'
    },
    {
        "echasnovski/mini.pairs",
        event = "VeryLazy",
        opts = {},
        keys = {
            {
                "<leader>up",
                function()
                    vim.g.minipairs_disable = not vim.g.minipairs_disable
                    if vim.g.minipairs_disable then
                        Util.warn("Disabled auto pairs")
                    else
                        Util.warn("Enabled auto pairs")
                    end
                end,
                desc = "Toggle auto pairs",
            },
        },
    },
    {
        "echasnovski/mini.surround",
        event = "VeryLazy",
        opts = {
            mappings = {
                add = "gsa",
                delete = "gsd",
                find = "gsf",
                find_left = "gsF",
                highlight = "gsh",
                replace = "gsr",
                update_n_lines = "gsn",
            },
        },
        keys = {
            { "<leader>gsa", desc = "Add surrounding", mode = { "n", "v" } },
            { "<leader>gsd", desc = "Delete surrounding" },
            { "<leader>gsf", desc = "Find right surrounding" },
            { "<leader>gsF", desc = "Find left surrounding" },
            { "<leader>gsh", desc = "Highlight surrounding" },
            { "<leader>gsr", desc = "Replace surrounding" },
            { "<leader>gsn", desc = "Update `MiniSurround.config.n_lines`" },
        },
    },
    {
        "echasnovski/mini.trailspace",
        event = "VeryLazy",
        opts = {},
        version = '*'
    },
}

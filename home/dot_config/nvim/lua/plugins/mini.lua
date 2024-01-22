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
                desc = "Delete buffer",
            },
            { "<leader>bD", function() require("mini.bufremove").delete(0, true) end, desc = "Delete buffer (force)" },
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
        "echasnovski/mini.trailspace",
        event = "VeryLazy",
        opts = {},
        version = '*'
    },
}

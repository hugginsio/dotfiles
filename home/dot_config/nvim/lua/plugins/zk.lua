---@type LazySpec
return {
    {
        "zk-org/zk-nvim",
        ft = { "markdown" },
        keys = {
            { "<leader>zb", "<cmd>ZkBacklinks<CR>",        desc = "Open backlinks picker" },
            { "<leader>zl", "<cmd>ZkLinks<CR>",            desc = "Open outbound links picker" },
            { "<leader>zo", "<cmd>Telescope zk notes<CR>", desc = "Open notes picker" },
            { "<leader>zt", "<cmd>Telescope zk tags<CR>",  desc = "Open notes picker, filtered by tags" },
        },
        opts = {
            picker = "snacks_picker",
            lsp = {
                config = { cmd = { "zk", "lsp" }, name = "zk" },
                auto_attach = { enabled = true },
            },
        },
    },
}

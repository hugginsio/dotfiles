return {
    {
        "tpope/vim-fugitive",
    },
    {
        "stevearc/overseer.nvim",
        opts = {},
        keys = {
            { "<leader>cR", "<cmd>OverseerRun<CR>", desc = "Run task" },
            { "<leader>ct", "<cmd>OverseerToggle bottom<CR>", desc = "Toggle task history" },
        },
    },
}

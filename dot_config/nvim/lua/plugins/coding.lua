return {
    {
        "tpope/vim-fugitive",
    },
    {
        "stevearc/overseer.nvim",
        opts = {},
        keys = {
            { "<leader>or", "<cmd>OverseerRun<CR>", desc = "Run task" },
            { "<leader>ot", "<cmd>OverseerToggle<CR>", desc = "Toggle task history" },
        },
    },
}

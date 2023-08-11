return {
    {
        "tpope/vim-fugitive",
    },
    {
        "stevearc/overseer.nvim",
        opts = {},
        keys = {
            { "<leader>cr", "<cmd>OverseerRun<CR>", desc = "Run task" },
            { "<leader>ct", "<cmd>OverseerToggle bottom<CR>", desc = "Toggle task history" },
        },
    },
}

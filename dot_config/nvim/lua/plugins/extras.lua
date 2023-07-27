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
        "hugginsio/twig.nvim",
        event = "VeryLazy",
        opts = {
            project_pattern = "-(.*)",
        },
    },
    {
        "mickael-menu/zk-nvim",
        config = function(opts)
            require("zk").setup(opts)
            require("telescope").load_extension("zk")
        end,
        event = "VeryLazy",
        ft = { "markdn", "markdown", "md", "mdown" },
        keys = {
            { "<leader>zb", "<cmd>ZkBacklinks<CR>", desc = "Open backlinks picker" },
            { "<leader>zj", "<cmd>ZkNew { dir = 'journal', group = 'journal'}<CR>", desc = "Open journal" },
            { "<leader>zl", "<cmd>ZkLinks<CR>", desc = "Open outbound links picker" },
            { "<leader>zo", "<cmd>Telescope zk notes<CR>", desc = "Open notes picker" },
            { "<leader>zt", "<cmd>Telescope zk tags<CR>", desc = "Open notes picker, filtered by tags" },
        },
        opts = {
            picker = "telescope",
            lsp = {
                config = {
                    cmd = { "zk", "lsp" },
                    name = "zk",
                },
                auto_attach = {
                    enabled = true,
                    filetypes = { "markdn", "markdown", "md", "mdown" },
                },
            },
        },
    },
}

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
    {
        -- TODO: this does not work and needs troubleshooting
        "AckslD/nvim-neoclip.lua",
        config = function()
            require("neoclip").setup()
            require("telescope").load_extension("neoclip")
        end,
        dependencies = {
            "nvim-telescope/telescope.nvim",
        },
        keys = {
            { "<leader>p", "<cmd>lua require('telescope').extensions.neoclip.default()<CR>", desc = "Open clipboard" },
        },
    },
    {
        "xiyaowong/link-visitor.nvim",
        config = {
            skip_confirmation = true,
        },
        event = "VeryLazy",
        keys = {
            { "gx", "<cmd>VisitLinkNearCursor<CR>", desc = "Open link under the cursor" },
        },
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
        keys = {
            { "<leader>fG", "<cmd>MarkdownPreviewToggle<CR>", desc = "Toggle markdown preview in browser" },
        },
    },
}

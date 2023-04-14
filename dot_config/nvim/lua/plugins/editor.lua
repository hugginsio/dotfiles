return {
    {
        "tpope/vim-surround",
        dir = "~/.vim/pack/hugginsio/start/surround",
        event = "VeryLazy",
    },
    {
        "mg979/vim-visual-multi",
        dir = "~/.vim/pack/hugginsio/start/visual-multi",
        event = "VeryLazy",
    },
    {
        "folke/todo-comments.nvim",
        config = true,
        dependencies = "nvim-lua/plenary.nvim",
        event = "VeryLazy",
    },
    {
        "lewis6991/gitsigns.nvim",
        config = true,
        event = "BufReadPre",
    },
}

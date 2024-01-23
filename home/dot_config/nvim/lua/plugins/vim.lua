return {
    {
        "tpope/vim-characterize",
        build = ":helptags ~/.vim/pack/hugginsio/start/characterize",
        dir = "~/.vim/pack/hugginsio/start/characterize",
        event = "VeryLazy",
    },
    {
        "tpope/vim-dotenv",
        build = ":helptags ~/.vim/pack/hugginsio/start/dotenv",
        dir = "~/.vim/pack/hugginsio/start/dotenv",
        event = "VeryLazy",
    },
    {
        "tpope/vim-eunuch",
        build = ":helptags ~/.vim/pack/hugginsio/start/eunuch",
        dir = "~/.vim/pack/hugginsio/start/eunuch",
        event = "VeryLazy",
    },
    {
        "tpope/vim-fugitive",
        build = ":helptags ~/.vim/pack/hugginsio/start/fugitive",
        dir = "~/.vim/pack/hugginsio/start/fugitive",
        event = "VeryLazy",
    },
    {
        "tpope/vim-sensible",
        build = ":helptags ~/.vim/pack/hugginsio/start/sensible",
        dir = "~/.vim/pack/hugginsio/start/sensible",
        event = "VeryLazy",
    },
    {
        "tpope/vim-speeddating",
        build = ":helptags ~/.vim/pack/hugginsio/start/speeddating",
        dir = "~/.vim/pack/hugginsio/start/speeddating",
        event = "VeryLazy",
    },
    {
        "tpope/vim-surround",
        build = ":helptags ~/.vim/pack/hugginsio/start/surround",
        dir = "~/.vim/pack/hugginsio/start/surround",
        event = "VeryLazy",
        keys = {
            { "S", desc = "Surround", mode = "v" },
            { "cS", desc = "Change surround on own line" },
            { "cs", desc = "Change surround" },
            { "ds", desc = "Delete surround" },
            { "yS", desc = "You surround on own line" },
            { "ySS", desc = "You surround on own line and indent" },
            { "ys", desc = "You surround" },
            { "yss", desc = "You surround on current line" },
        }
    },
}

return {
    {
        "folke/flash.nvim",
        opts = {
            modes = {
                search = {
                    -- Disable flash by default in regular searches. It can still be activated
                    -- with <c-s> while the search is open.
                    enabled = false,
                },
            },
        },
    },
}

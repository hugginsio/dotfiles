---@type LazySpec
return {
    {
        "nvim-telescope/telescope.nvim",
        config = function(self, opts)
            -- run the core AstroNvim configuration function with the options table
            require("astronvim.plugins.configs.telescope")(self, opts)

            -- require telescope and load extensions as necessary
            require("telescope").load_extension("scriptnames")
        end,
        dependencies = {
            {
                "hugginsio/telescope-scriptnames.nvim",
            },
        },
    },
}

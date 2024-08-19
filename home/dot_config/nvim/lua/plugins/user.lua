-- https://github.com/AstroNvim/template/blob/main/lua/plugins/user.lua

---@type LazySpec
return {
    {
        "goolord/alpha-nvim",
        opts = function(_, opts)
            opts.section.header.val = {}
            return opts
        end,
    },
}

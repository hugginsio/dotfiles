-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
    local keys = require("lazy.core.handler").handlers.keys
    ---@cast keys LazyKeysHandler
    -- do not create the keymap if a lazy keys handler exists
    if not keys.active[keys.parse({ lhs, mode = mode }).id] then
        opts = opts or {}
        opts.silent = opts.silent ~= false
        vim.keymap.set(mode, lhs, rhs, opts)
    end
end

local function unmap(mode, lhs, opts)
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.del(mode, lhs, opts)
end

-- lazy
unmap("n", "<leader>l")
map("n", "<leader>ol", "<cmd>:Lazy<cr>", { desc = "Lazy" })

-- window
unmap("n", "<leader>ww")
unmap("n", "<leader>wd")
unmap("n", "<leader>w-")
unmap("n", "<leader>w|")

-- Helper functions
local function augroup(name)
    return vim.api.nvim_create_augroup("hugginsio_" .. name, { clear = true })
end

-- Wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
    group = augroup("wrap_spell"),
    pattern = { "gitcommit", "markdown" },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
    end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    group = augroup("highlight_yank"),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Check if any buffers were changed outside Neovim
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained" }, {
    group = augroup("check_time"),
    pattern = "*",
    callback = function()
        vim.api.nvim_command('checktime')
    end,
})

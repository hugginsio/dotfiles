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

vim.api.nvim_create_autocmd("BufWritePost", {
    group = augroup("onedrive_is_pain"),
    pattern = vim.fn.expand("~/Library/CloudStorage") .. "/OneDrive*/*",
    callback = function(ev)
        vim.defer_fn(function()
            if vim.api.nvim_buf_is_valid(ev.buf) and not vim.bo[ev.buf].modified then
                vim.cmd("silent! checktime " .. ev.buf)
            end
        end, 500)
    end,
})

-- Automatically update the updated timestamp in markdown frontmatter
vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup("md_updated_prop"),
    pattern = "*.md",
    callback = function(args)
        local lines = vim.api.nvim_buf_get_lines(args.buf, 0, -1, false)
        local in_frontmatter = false

        for i, line in ipairs(lines) do
            if line:match("^%-%-%-$") then
                if not in_frontmatter then
                    in_frontmatter = true
                else
                    break
                end
            elseif in_frontmatter and line:match("^updated:%s") then
                local new_line = "updated: " .. os.date("%Y-%m-%d %H:%M")
                vim.api.nvim_buf_set_lines(args.buf, i - 1, i, false, { new_line })
                return
            end
        end
    end,
})

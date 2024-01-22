local M = {}

function M.info(msg)
    vim.notify(msg, vim.log.levels.INFO)
end

function M.warn(msg)
    vim.notify(msg, vim.log.levels.WARN)
end

function M.error(msg)
    vim.notify(msg, vim.log.levels.ERROR)
end

-- https://github.com/LazyVim/LazyVim/blob/eccf3b5e68035516c879b3e2b4d6bf8512c87976/lua/lazyvim/util/init.lua#L129
function M.on_load(name, fn)
    local Config = require("lazy.core.config")
    if Config.plugins[name] and Config.plugins[name]._.loaded then
        fn(name)
    else
        vim.api.nvim_create_autocmd("User", {
            pattern = "LazyLoad",
            callback = function(event)
                if event.data == name then
                    fn(name)
                    return true
                end
            end,
        })
    end
end

return M

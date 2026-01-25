-- I don't have any plugins I want to disable yet
-- stylua: ignore
if true then return {} end

---@type string[]
local disabled_plugins = {
  "",
}

---@type LazyPluginSpec[]
local spec = {}

for _, plugin in ipairs(disabled_plugins) do
  table.insert(spec, { plugin, enabled = false })
end

return spec

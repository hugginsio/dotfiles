-- Work-related lvim plugins. Appended to lvim.plugins when template expanded.

local configWork = {
  {
    "hugginsio/vim-x12",
  },
}

for _, configWorkPlugin in pairs(configWork) do
  table.insert(lvim.plugins, configWorkPlugin)
end

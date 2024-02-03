-- Personal lvim plugins. Appended to lvim.plugins when template expanded.

local configPersonal = {
  {
    "nomnivore/ollama.nvim",
    cmd = { "Ollama", "OllamaModel", "OllamaServe", "OllamaServeStop" },
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    keys = {
      {
        "<leader>ap",
        ":<c-u>lua require('ollama').prompt()<cr>",
        desc = "Prompt",
        mode = { "n", "v" },
      },
      {
        "<leader>ag",
        ":<c-u>lua require('ollama').prompt('Generate_Code')<cr>",
        desc = "Generate Code",
        mode = { "n", "v" },
      },
    },
    opts = {
      model = "codellama:7b",
    },
  },
}

for _, configPersonalPlugin in pairs(configPersonal) do
  table.insert(lvim.plugins, configPersonalPlugin)
end

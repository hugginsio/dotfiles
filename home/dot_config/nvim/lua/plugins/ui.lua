---@type LazySpec
return {
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      sections = {
        lualine_z = {},
      },
    },
  },
  {
    "snacks.nvim",
    ---@type snacks.Config
    opts = {
      dashboard = {
        preset = {
          header = "",
        -- stylua: ignore
        ---@type snacks.dashboard.Item[]
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "o", desc = "Org Files", action = ":lua Snacks.dashboard.pick('files', {cwd = '~/orgfiles/'})" },
          { icon = " ", key = "a", desc = "Org Agenda", action = ":Org agenda a" },
          { icon = " ", key = "j", desc = "Org Journal", action = ":OrgJournal" },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
        },
      },
    },
  },
}

---@type LazySpec
return {
  {
    "nvim-orgmode/orgmode",
    ft = { "org" },
    cmd = "Org",
    dependencies = {
      {
        "productivitykit/org-journal.nvim",
        cmd = "OrgJournal",
        keys = {
          { "<leader>oj", "<cmd>OrgJournal<cr>", desc = "journal" },
        },
      },
      {
        "productivitykit/org-virtual-clocktime.nvim",
      },
      {
        "danilshvalov/org-modern.nvim",
      },
    },
    config = function()
      require("orgmode").setup({
        calendar_week_start_day = 0,
        org_agenda_files = "~/orgfiles/**/*",
        org_agenda_span = "week",
        org_agenda_start_on_weekday = false,
        org_deadline_warning_days = 7,
        org_default_notes_file = "~/orgfiles/refile.org",
        org_startup_folded = "showeverything",
        org_todo_keywords = { "TODO(t)", "WAITING(w)", "|", "DONE(d)" },
        org_todo_keywords_faces = { WAITING = ":foreground blue" },
        win_border = "rounded",
        win_split_mode = "float",
        ui = {
          menu = {
            ---@diagnostic disable-next-line: redundant-parameter
            handler = function(data)
              require("org-modern.menu"):new():open(data)
            end,
          },
        },
      })

      vim.lsp.enable("org")
    end,
    keys = {
      { "<leader>oa", "<cmd>Org agenda<cr>", desc = "agenda" },
      { "<leader>oc", "<cmd>Org capture<cr>", desc = "capture" },
      { "<leader>fo", ":lua Snacks.dashboard.pick('files', {cwd = '~/orgfiles/'})<CR>", desc = "Find Org File" },
    },
  },
}

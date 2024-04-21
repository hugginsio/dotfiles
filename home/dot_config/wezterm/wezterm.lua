-- https://wezfurlong.org/wezterm/config/files.html
-- vim: ft=lua

local wezterm = require "wezterm"

local act = wezterm.action
local config = wezterm.config_builder()
local io = require "io"
local os = require "os"

-- https://catppuccin.com/palette
local scheme = wezterm.color.get_builtin_schemes()["catppuccin-mocha"]
scheme.cursor_bg = "#cdd6f4" -- mocha-text
scheme.cursor_fg = "#1e1e2e" -- mocha-base

config.color_schemes = {
  ["catppuccin-mocha-custom"] = scheme
}

config.color_scheme = "catppuccin-mocha-custom"

config.default_prog = { "/opt/homebrew/bin/fish", "-l" }
config.font = wezterm.font("JetBrains Mono", { weight = "Medium" })
config.font_size = 15
config.force_reverse_video_cursor = false
config.hide_tab_bar_if_only_one_tab = true
config.switch_to_last_active_tab_when_closing_tab = true
config.use_fancy_tab_bar = false
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }

config.disable_default_key_bindings = true
config.keys = {
  { key = "+",     mods = "SHIFT|CTRL", action = act.IncreaseFontSize },
  { key = "-",     mods = "SHIFT|CTRL", action = act.DecreaseFontSize },
  { key = "0",     mods = "SHIFT|CTRL", action = act.ResetFontSize },
  { key = "1",     mods = "SHIFT|CTRL", action = act.ActivateTab(0) },
  { key = "2",     mods = "SHIFT|CTRL", action = act.ActivateTab(1) },
  { key = "3",     mods = "SHIFT|CTRL", action = act.ActivateTab(2) },
  { key = "4",     mods = "SHIFT|CTRL", action = act.ActivateTab(3) },
  { key = "5",     mods = "SHIFT|CTRL", action = act.ActivateTab(4) },
  { key = "6",     mods = "SHIFT|CTRL", action = act.ActivateTab(5) },
  { key = "7",     mods = "SHIFT|CTRL", action = act.ActivateTab(6) },
  { key = "8",     mods = "SHIFT|CTRL", action = act.ActivateTab(7) },
  { key = "9",     mods = "SHIFT|CTRL", action = act.ActivateTab(-1) },
  { key = "C",     mods = "SHIFT|CTRL", action = act.CopyTo "Clipboard" },
  { key = "Copy",  mods = "NONE",       action = act.CopyTo "Clipboard" },
  { key = "F",     mods = "SHIFT|CTRL", action = act.Search "CurrentSelectionOrEmptyString" },
  { key = "L",     mods = "SHIFT|CTRL", action = act.ShowDebugOverlay },
  { key = "N",     mods = "SHIFT|CTRL", action = act.SpawnWindow },
  { key = "N",     mods = "SHIFT|CTRL", action = act.SpawnWindow },
  { key = "P",     mods = "SHIFT|CTRL", action = act.ActivateCommandPalette },
  { key = "P",     mods = "SHIFT|CTRL", action = act.ActivateCommandPalette },
  { key = "Paste", mods = "NONE",       action = act.PasteFrom "Clipboard" },
  { key = "Q",     mods = "SHIFT|CTRL", action = act.QuitApplication },
  { key = "R",     mods = "SHIFT|CTRL", action = act.ReloadConfiguration },
  { key = "T",     mods = "SHIFT|CTRL", action = act.SpawnTab "CurrentPaneDomain" },
  { key = "V",     mods = "SHIFT|CTRL", action = act.PasteFrom "Clipboard" },
  { key = "W",     mods = "SHIFT|CTRL", action = act.CloseCurrentTab { confirm = true } },
}

return config

local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local act = wezterm.action

-- Font / Text
config.font = wezterm.font 'JetBrains Mono'
  -- NOTE: Ligatures are ON be default
config.font_size = 22.0
config.color_scheme = 'Afterglow'

-- GUI
config.enable_tab_bar = false
config.enable_scroll_bar = false
config.window_padding = {
  left = 0, right = 0, top = "0.5cell", bottom = 0,
}
config.window_decorations = "RESIZE"

-- Keybindings
config.disable_default_key_bindings = true
-- NOTE: run `wezterm show-keys --lua` to generate the full default list
config.keys = {
  { key = 'c', mods = 'SUPER', action = act.CopyTo 'Clipboard' },
  { key = 'v', mods = 'SUPER', action = act.PasteFrom 'Clipboard' },
  { key = 'f', mods = 'SUPER', action = act.Search 'CurrentSelectionOrEmptyString' },
  { key = 'k', mods = 'SUPER', action = act.ClearScrollback 'ScrollbackAndViewport' },
  { key = 'n', mods = 'SUPER', action = act.SpawnWindow },
  { key = 'w', mods = 'SUPER', action = act.CloseCurrentTab { confirm = true } },
  { key = 'p', mods = 'SUPER', action = act.ActivateCommandPalette },
  { key = 'u', mods = 'SUPER', action = act.CharSelect { copy_on_select = true, copy_to = 'ClipboardAndPrimarySelection' } },
  { key = 'UpArrow', mods = 'SHIFT', action = act.ScrollByPage(-0.75) },
  { key = 'DownArrow', mods = 'SHIFT', action = act.ScrollByPage(0.75) },
}

config.key_tables = {
  search_mode = {
    { key = 'Enter', mods = 'NONE', action = act.CopyMode 'NextMatch' },
    { key = 'Escape', mods = 'NONE', action = act.CopyMode 'Close' },
    { key = 'n', mods = 'CTRL', action = act.CopyMode 'NextMatch' },
    { key = 'p', mods = 'CTRL', action = act.CopyMode 'PriorMatch' },
    { key = 'r', mods = 'CTRL', action = act.CopyMode 'CycleMatchType' },
    { key = 'u', mods = 'CTRL', action = act.CopyMode 'ClearPattern' },
    { key = 'UpArrow', mods = 'NONE', action = act.CopyMode 'PriorMatch' },
    { key = 'DownArrow', mods = 'NONE', action = act.CopyMode 'NextMatch' },
  },
}

return config

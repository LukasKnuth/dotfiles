local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local act = wezterm.action

-- Platform Helpers
local is_macos = function()
  return wezterm.target_triple:find("darwin") ~= nil
end

-- Font / Text
config.font = wezterm.font 'JetBrains Mono'
-- NOTE: Ligatures are ON be default
-- Enable slashed zeros
config.harfbuzz_features = { 'zero' }
config.font_size = is_macos() and 22.0 or 16.0
config.color_scheme = 'Catppuccin Mocha'

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
local mod_key = is_macos() and 'SUPER' or 'CTRL'
config.keys = {
  { key = 'c', mods = mod_key, action = act.CopyTo 'Clipboard' },
  { key = 'v', mods = mod_key, action = act.PasteFrom 'Clipboard' },
  { key = 'f', mods = mod_key, action = act.Search 'CurrentSelectionOrEmptyString' },
  { key = 'n', mods = mod_key, action = act.SpawnWindow },
  { key = 'w', mods = mod_key, action = act.CloseCurrentTab { confirm = true } },
  { key = 'p', mods = mod_key, action = act.ActivateCommandPalette },
  { key = 'u', mods = mod_key, action = act.CharSelect { copy_on_select = true, copy_to = 'ClipboardAndPrimarySelection' } },
  { key = 'k', mods = mod_key..'|SHIFT', action = act.ScrollByPage(-0.75) },
  { key = 'j', mods = mod_key..'|SHIFT', action = act.ScrollByPage(0.75) },
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

config.mouse_bindings = {
  -- Change the default click behavior so that it only selects text..
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'NONE',
    action = act.CompleteSelection 'ClipboardAndPrimarySelection',
  },
  -- ..then make CTRL-Click open hyperlinks.
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'CTRL',
    action = act.OpenLinkAtMouseCursor,
  },
  -- Consume Down event so that programs don't receive Down without previous Up
  {
    event = { Down = { streak = 1, button = 'Left' } },
    mods = 'CTRL',
    action = act.Nop,
  },
}

return config

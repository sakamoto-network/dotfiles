-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()
disable_default_key_bindings = true

-- This is where you actually apply your config choices
-- For example, changing the color scheme:
config.color_scheme = 'OneHalfDark'
config.enable_tab_bar = false
config.font = wezterm.font_with_fallback {
  'JetBrains Mono Nerd Font Mono',
  'Noto Sans CJK JP Medium',
}

config.keys = {
  {
    key = 'n',
    mods = 'SHIFT|CTRL',
    action = wezterm.action.ToggleFullScreen,
  },
  {
    key = 'Enter',
    mods = 'ALT',
    action = wezterm.action.DisableDefaultAssignment,
  },
}

config.colors = {
  -- The default background color
  background = 'black',
}
config.window_background_opacity = 0.9
config.font_size = 11.5
-- and finally, return the configuration to wezterm
return config

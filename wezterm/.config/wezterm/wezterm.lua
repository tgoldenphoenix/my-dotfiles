local wezterm = require 'wezterm'
local commands = require 'commands'
local constants = require 'constants'

local config = wezterm.config_builder()

-- Font settings
config.font_size = 19.0
config.line_height = 1.2
config.font = wezterm.font 'Hack Nerd Font' -- nếu font không có trên máy sẽ lỗi
config.font_rules = {
  {
    italic = true,
    intensity = 'Bold',
    font = wezterm.font('Hack Nerd Font', {
      italic = true,
      weight = 'Regular',
    }),
  },
}

-- Colors
config.colors = require 'cyberdream'

-- Appearance
config.cursor_blink_rate = 0
config.window_decorations = 'RESIZE'
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}
config.window_background_image = constants.bg_image
config.macos_window_background_blur = 40

-- Miscellaneous settings
config.max_fps = 120
config.prefer_egl = true

-- Custom commands
wezterm.on('augment-command-palette', function()
  return commands
end)

-- The last line return config
return config
